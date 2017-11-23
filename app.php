<?php 
(session_status() == PHP_SESSION_NONE ? session_start() : null ); 
require_once __DIR__.'/vendor/autoload.php'; // Autoload files using Composer autoload
require_once __DIR__.'/configs/config.php';
require_once __DIR__.'/configs/models.php';
require_once __DIR__.'/controllers/Errorcontroller.php';
define('SRVPATH',__DIR__);
$server = new \Servit\RestServer\RestServer($sysconfig,APPMODE); // config = class config and  mode = debug / production see config.php
$server->addClass('SysController');
$server->addClass('AuthController','/api/v1/auth');
$err = new Errorcontroller();
$err->server = $server;
$server->addErrorClass($err);
include __DIR__.'/route/routes.php';
$server->handle();

