<?php
return [
    'version' =>'latest',
    'region'  => env('AWS_REGION', 'us-east-1'),
    'endpoint' => env('AWS_ENDPOINT', 'YOUR_AWS_HOST'),
    'use_path_style_endpoint' =>true,
    'credentials' => [
        'key'    => env('AWS_KEY', 'YOUR_AWS_ACCESS_KEY'),
        'secret' => env('AWS_SECRET', 'YOUR_AWS_SECRET_KEY'),
    ],
    // You can override settings for specific services
    'Ses' => [
        'region' => env('AWS_SES_REGION', 'us-east-1'),
    ],
];