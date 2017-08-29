<?php 
require __DIR__.'/../vendor/autoload.php';
require_once __DIR__.'/api.php';
$api = new PHP_CRUD_API(array(
    'dbengine'=>'MySQL',
	'hostname'=>'localhost',
	'username'=>'dbuser',
	'password'=>'dbpass',
	'database'=>'dbname',
	'charset'=>'utf8'
));

$api->executeCommand();