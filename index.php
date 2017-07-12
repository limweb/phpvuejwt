<?php
require_once __DIR__.'/vendor/autoload.php';
require_once __DIR__.'/libs/RestServer.php';
require_once __DIR__.'/English.php';
require 'TestController.php';
require 'AaaController.php';
require 'AuthController.php';
$server = new \Jacwright\RestServer\RestServer('debug');
$server->addClass('TestController');
$server->addClass('AaaController','aaa');
$server->addClass('AuthController','/api/v1/auth');
$server->handle();
