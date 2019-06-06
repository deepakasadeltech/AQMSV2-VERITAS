<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Repositories\CallRepository;
use App\Models\User;
use App\Models\ParentDepartment;
use App\Models\Department;
use App\Models\Counter;
use App\Models\Call;
use App\Models\Queue;
use App\Models\UhidMaster;
use Carbon\Carbon;
use App\Models\Setting;
class CallController extends Controller
{
    protected $calls;

    public function __construct(CallRepository $calls)
    {
        $this->calls = $calls;
    }

    public function index(Request $request)
    {
		$this->authorize('access', Call::class);
        event(new \App\Events\TokenIssued());

        return view('user.calls.index', [
            'users' => $this->calls->getUsers(),
            'counters' => $this->calls->getCounters(),
			'pdepartments' => $this->calls->getPDepartments(),
            'departments' => $this->calls->getActiveDepartments(),
        ]);
    }
//----------------------------------------------
public function tokenmodify(){
    $this->authorize('access', Call::class);
    return view('user.calls.tokenmodify', [
        'users' => $this->calls->getUsers(),
        'counters' => $this->calls->getCounters(),
        'pdepartments' => $this->calls->getPDepartments(),
        'departments' => $this->calls->getActiveDepartments(),
        'tokendetailbeforecall' => $this->calls->tokenDetailBeforeCalled(),

    ]);
}
//---------------------------------------------------------
public function rePrintToken(Request $request, $id){
    $request->session()->flash('printFlag', true);
    $queuemodify = Queue::find($request->id);
    $department = Department::findOrFail($queuemodify->department_id);
    
        event(new \App\Events\TokenIssued());
        $staffuser = User::find(Auth::user()->id);
        $stt = Setting::first();
        $request->session()->flash('department_name', $department->name);
        $request->session()->flash('number', $queuemodify->number);
        $request->session()->flash('total', $queuemodify->customer_waiting);
		$request->session()->flash('uhid',  $queuemodify->uhid);
        $request->session()->flash('priority',  $queuemodify->priority);
        $request->session()->flash('company_name', $stt->name);
        $request->session()->flash('staffname', $staffuser->name); 
        
        flash()->success('print');
    return redirect()->route('token_modify');
}
//-----------------------------------------------------------
public function modiFicationToken(Request $request, $id){
      $request->session()->flash('printFlag', true);

      $is_uhid_required = $this->isUhidRequired($request->department_id);
		if($is_uhid_required){
			$uhid = $request->uhid;
			$is_uhid_exist = $this->isUHIDExist($uhid);
			if(!$is_uhid_exist) {
				$request->session()->flash('printFlag', false);
				flash()->warning('Invalid UHID, only Number');
				return redirect()->route('token_modify');
			}
		}
        
        $queuemodify = Queue::find($request->id);
		$department = Department::findOrFail($queuemodify->department_id);
    $departmentdetail = UhidMaster::where('uhid', $request->uhid)->first();
    $queuemodify->uhid = $departmentdetail->uhid;
   $queuemodify->priority = $departmentdetail->priority_type;
    $queuemodify->save();
    
    $total = $this->calls->getCustomersWaiting($department);
        $priority_details = UhidMaster::where('uhid', $request->uhid)->first();
        event(new \App\Events\TokenIssued());
        $staffuser = User::find(Auth::user()->id);
        $stt = Setting::first();
        $request->session()->flash('department_name', $department->name);
        $request->session()->flash('number', $queuemodify->number);
        $request->session()->flash('total', $queuemodify->customer_waiting);
		$request->session()->flash('uhid', $request->uhid);
        $request->session()->flash('priority', $priority_details['priority_type']);
        $request->session()->flash('company_name', $stt->name);
        $request->session()->flash('staffname', $staffuser->name);
  
    flash()->success('Token Successfully Modify');
    return redirect()->route('token_modify');
              

  }
//-----------------------------------------------------------
//-------------------------------------------------

    public function newCall(Request $request)
    {
        $this->validate($request, [
            'user' => 'bail|required|exists:users,id',
            'counter' => 'bail|required|exists:counters,id',
            'pid' => 'bail|required|exists:parent_departments,id',
			'department' => 'bail|required|exists:departments,id',
        ]);

        $user = User::findOrFail($request->user);
        $counter = Counter::findOrFail($request->counter);
        $pdepartment = ParentDepartment::findOrFail($request->pid);
		$department = Department::findOrFail($request->department);

        $queue = $this->calls->getNextToken($department);

        if($queue==null) {
            flash()->warning('No Token for this department');
            return redirect()->route('calls');
        }

        $call = $queue->call()->create([
            'pid' => $pdepartment->id,
			'department_id' => $department->id,
            'counter_id' => $counter->id,
            'user_id' => $user->id,
            'number' => $queue->number,
            'called_date' => Carbon::now()->format('Y-m-d'),
        ]);

        $queue->called = 1;
        $queue->save();

        $request->session()->flash('department', $department->id);
        $request->session()->flash('counter', $counter->id);

        event(new \App\Events\TokenIssued());
        event(new \App\Events\TokenCalled());

        flash()->success('Token Called');
        return redirect()->route('calls');
    }


    public function postDept(Request $request, Department $department)
    {
		$request->session()->flash('printFlag', true);
		$is_uhid_required = $this->isUhidRequired($department->id);
		$priority = 4;//by default normal
		if($is_uhid_required){
			$uhid = $request->uhid;
			$is_uhid_exist = $this->isUHIDExist($uhid);
			if(!$is_uhid_exist) {
				$request->session()->flash('printFlag', false);
				flash()->warning('Invalid UHID');
				return redirect()->route('calls');
			}
		}
		if(!empty($uhid)){
			$uhid_details = UhidMaster::where('uhid', $uhid)->first();
			if(!empty($uhid_details)){
				$priority = $uhid_details['priority_type'];
			}
			
		}
		
        $last_token = $this->calls->getLastToken($department);
        $total = $this->calls->getCustomersWaiting($department);

        if($last_token) {
			$tokenNumber = ((int)$last_token->number)+1;
			$istkenExist = $this->calls->isTokenExist($department->pid, $department->id, $tokenNumber);
			if($istkenExist > 0){
				$request->session()->flash('printFlag', false);
				flash()->warning('Token already issued');
				return redirect()->route('calls');
			}
            $queue = $department->queues()->create([
				'pid' => $department->pid,
                'number' => ((int)$last_token->number)+1,
                'called' => 0,
				'uhid' => $request->uhid,
                'priority' => $priority,
                'customer_waiting' => $total,
            ]);
        } else {
			$tokenNumber = $department->start;
			$istkenExist = $this->calls->isTokenExist($department->pid, $department->id, $tokenNumber);
			if($istkenExist > 0){
				$request->session()->flash('printFlag', false);
				flash()->warning('Token already issued');
				return redirect()->route('calls');
			}
            $queue = $department->queues()->create([
				'pid' => $department->pid,
                'number' => $department->start,
                'called' => 0,
				'uhid' => $request->uhid,
                'priority' => $priority,
                'customer_waiting' => $total,
            ]);
        }

       
        $priority_details = UhidMaster::where('uhid', $request->uhid)->first();
        event(new \App\Events\TokenIssued());
        $staffuser = User::find(Auth::user()->id);
        $stt = Setting::first();
        $request->session()->flash('department_name', $department->name);
        $request->session()->flash('number', ($department->letter!='')?$department->letter.'-'.$queue->number:$queue->number);
        $request->session()->flash('total', $total);
		$request->session()->flash('uhid', $request->uhid);
        $request->session()->flash('priority', $priority_details['priority_type']);
        $request->session()->flash('company_name', $stt->name);
        $request->session()->flash('staffname', $staffuser->name);


        flash()->success('Token Added');
        return redirect()->route('calls');
    }

	private function isUhidRequired($department_id)
	{
		$flag = false;
		$result = Department::find($department_id);
		if(!empty($result)){
			$flag = ($result->is_uhid_required == 1) ? true : false;
		}
		return $flag;
	}
	
	private function isUHIDExist($uhid)
	{
		$flag = false;
		$result = UhidMaster::where('uhid', $uhid)->count();
		$flag = ($result > 0) ? true : false;
		return $flag;
	}
	
	
    public function recall(Request $request)
    {
        $call = Call::find($request->call_id);
        $new_call = $call->replicate();
        $new_call->save();

        $call->delete();

        event(new \App\Events\TokenCalled());

        flash()->success('Token Called');
        return $new_call->toJson();
    }
	
	public function postPdept(Request $request)
    { 
		$department = Department::where('pid', $request->pid)->get();
        return $department->toJson();
    }
    
    public function getPriority(Request $request)
    { 
		$uhid = $request->uid;
		if(empty($uhid)){
			return '';
		}
		$result = UhidMaster::where('uhid', $uhid)->first();
		if(!empty($result)){
			if($result['priority_type'] == 1){
				$output = '<span class="plbox">Platinum</span>';
			}else if($result['priority_type'] == 2){
				$output = '<span class="glbox">Gold</span>';
			}else if($result['priority_type'] == 3){
                $output = '<span class="slbox">Silver</span>';
            }else if($result['priority_type'] == 4){
				$output = '<span class="nlbox">Normal</span>';    
			}else{
				$output = '<span class="erbox">Inavid UHID</span>';
			}
		}else{
			$output = '<span class="erbox">Inavid UHID</span>';
		}
        return $output;
    }

}
