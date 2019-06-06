<?php

return [
    'save' => 'Save',
    'select' => 'Select',
    'add' => 'Add',
    'name' => 'Name',
    'actions' => 'Action',
    'edit' => 'Edit',
    'start_time' => 'Start Time',
    'end_time' => 'End Time',
    'delete' => 'Delete',
    'update' => 'Update',
    'change' => 'Change',
    'date' => 'Date',
    'go' => 'Go',
    'range' => 'Range',
    'report' => 'Report',
    'month' => 'Month',
    'all' => 'All',
    'starting' => 'Starting',
    'ending' => 'Ending',
    'time' => 'Time',
    'issue' => 'Issue',
    'new' => 'New',
    'settings' => 'Settings',
    'default' => 'Default',
    'set' => 'Set',
    'language' => 'Language',
    'map_department' => 'Map Department',
    'map_doctor' => 'Allotted Department & Room Number To Doctor',
    'next_only' => 'Next',
    'cancel' => 'Cancel',
    'type' => 'Type',
    'types' => 'Types',
    'serving' => 'Serving',
    'served' => 'Served',
    'start' => 'Start',
    'end' => 'End',
    'and' => 'And',
    'in_seconds' => 'In Seconds',
    'avg_time' => 'Average Waiting Time',
    'min_time' => 'Minimum Waiting Time',
    'max_time' => 'Maximum Waiting Time',
    'count_perday' => 'Total count per day',
    'font_size' => 'Font Size',
    'color' => 'Color',
    'today_queue' => 'Today Queue',
    'today_missed' => 'Today Missed',
    'today_served' => 'Today Served',
    'over_time' => 'Over Time',
    'today_yesterday' => 'Today vs Yesterday',
    'queue_details' => 'Queue Details',
    'more_info' => 'More Info',
    'you_do_first_start' => 'You do first Start',
    'You_have_started' => 'You have started',

    'locales' => [
        'gb' => [
            'gb' => 'English',
            'tr' => 'Türk',
            'sa' => 'العربية',
            'fr' => 'français',
            'de' => 'Deutsch',
            'in' => 'हिन्दी',
            'it' => 'italiano',
            'pt' => 'português',
            'ru' => 'русский',
            'sk' => 'slovenský',
            'es' => 'Español',
            'th' => 'ไทย',
            'id' => 'Indonesia',
        ],
    ],

    'mainapp' => [
        'select_language' => 'Select Language',
        'display_url' => 'Display URL',
        'issue_url' => 'Issue Token URL',
        'last_login' => 'Last Login',
        'profile' => 'Profile',
        'logout' => 'Logout',
        'menu' => [
            'menu' => 'Menu',
            'dashboard' => 'Dashboard',
            'call' => 'Call',
            'token_issue' => 'Token Issue',
            'token_modification' => 'Token Modification',
            'department' => 'Sub Department',
			'parent_department' => 'Department',
			'uhid_required' => 'UHID',
            'counter' => "Doctor's Room",
            'users' => 'Users (User/Doctor)',
            'reports' => [
                'reports' => 'Reports',
                'user_report' => 'User Report',
                'queue_list' => 'Queue List',
                'monthly' => 'Monthly',
                'statistical' => 'Statistical',
                'missed' => 'Missed',
                'overtime' => 'Overtime',
            ],
            'account' => 'Account',
        ],

        'role' => [
            'Administrator' => 'Administrator',
			'Doctor' => 'Doctor',
            'Staff' => 'User',
            'Helpdesk' => 'Help Desk',
            'CMO' => 'CMO',
            'Displayctrl' => 'Display Controller'
        ],
    ],

    'dashboard' => [
        'notification' => 'Notification',
        'preview' => 'Preview',
        'notification_text' => 'Notification text',
        'notification_placeholder' => 'Notification to show on display page',
    ],

    'call' => [
        'new_call' => 'New Call',
        'user' => 'User',
        'call_next' => 'Call Next Patient',
        'click_department' => 'Click on department to Issue Token',
        'todays_queue' => 'Todays Queue',
        'number' => 'Number',
        'called' => 'Called',
        'recall' => 'Recall',
        'token_issue' => 'TOKEN ISSUED',
        'cancel' => 'CANCEL',
        'doctor' => 'Doctor',
    ],

    'department' => [
        'letter' => 'Letter',
        'start' => 'Start',
    ],

    'users' => [
        'username' => 'Username',
        'email' => 'Email',
        'role' => 'Role',
        'password' => 'Password',
        'confirm' => 'Confirm',
        'parent_department' => 'Department',
        'department' => 'Sub Department',
        'counter' => 'Room No.',
        'action' => 'Action',
        'attendance' => 'Attendance',
        'token_number' => 'Token Number',
        'room_number' => 'Room Number',
        'display_sequence' => 'Display Sequence No.'
    ],

    'company' => [
        'company' => 'Company',
        'address' => 'Address',
        'location' => 'Location',
        'phone' => 'Phone',
    ],

    'display' => [
        'display' => 'Display',
        'token' => 'Token Number',
        'please' => 'Please be',
        'proceed_to' => 'Present To',
        'room' => 'Room Number',
        'persons' => 'Person(s)',
        'in_queue' => 'In Queue',
    ],



    // Dont want to change

    'title' => 'Laravel Installer',
    'next' => 'Next Step',
    'finish' => 'Install',

    'welcome' => [
        'title'   => 'Welcome To The Installer',
        'message' => 'Welcome to the setup wizard.',
    ],

    'requirements' => [
        'title' => 'Requirements',
    ],

    'permissions' => [
        'title' => 'Permissions',
    ],

    'environment' => [
        'title' => 'Environment Settings',
        'save' => 'Save .env',
        'success' => 'Your .env file settings have been saved.',
        'errors' => 'Unable to save the .env file, Please create it manually.',
    ],

    'final' => [
        'title' => 'Finished',
        'finished' => 'Application has been successfully installed.',
        'exit' => 'Click here to exit',
    ],
];
