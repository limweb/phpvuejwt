<?php

// FOR DEBUGING PHP
ini_set('display_errors',1);
ini_set('display_startup_errors',1);
error_reporting(-1);
error_reporting(1);
error_reporting(0);
error_reporting(E_ALL);
ini_set("display_errors", 1);
date_default_timezone_set('Asia/Bangkok');

define('DB_NAME'	, 'dbname');
define('DB_USER'	, 'dbuser');
define('DB_PASSWORD', 'dbpass');
define('DB_HOST'	, '127.0.0.1');
define('DB_CHARSET'	, 'utf8');
define('DB_COLLATE'	, '');

define('DEBUG',true);
define('EXPTIME', 60*60*1);  //  60sec * 60 mins * 1 hr
define('SECRETKEY','02443f12-e1ef-11e5-b86d-9a79f06e9478');
define('USEDROLE',true);

require_once  __DIR__.'/../vendor/autoload.php';
use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Eloquent\Model as Model;
use Carbon\Carbon;


$capsule = new Capsule;

$capsule->addConnection([
	'driver'    => 'mysql',
	'host'      => DB_HOST,
	'database'  => DB_NAME,
	'username'  => DB_USER,
	'password'  => DB_PASSWORD,
	'charset'   => 'utf8',
	'collation' => 'utf8_unicode_ci',
	'prefix'    => '',
	],'default' );


// // Make this Capsule instance available globally via static methods... (optional)
$capsule->setAsGlobal();

// // Setup the Eloquent ORM... (optional; unless you've used setEventDispatcher())
$capsule->bootEloquent();

if ( ! function_exists( 'implodeKV' ) && ! function_exists('consolelog') ) {

	function implodeKV($glueKV, $gluePair, $KVarray)  {
		if( is_object($KVarray) ) {
		   $KVarray = json_decode(json_encode($KVarray),TRUE);
		}
		$t = array();
		foreach($KVarray as $key=>$val) {
			if(is_array($val)){
			   $val = implodeKV(':',',',$val);
			}else if( is_object($val)){
				$val = json_decode(json_encode($val),TRUE);
				$val = implodeKV(':',',',$val);
			}

			if(is_int($key)){
				$t[] = $val;
			} else {
				$t[] = $key . $glueKV . $val;
			}
		}
		return implode($gluePair, $t);
	}


function consolelog($status = 200)  {
	if( DEBUG ){
		
		$lists = func_get_args();
		$status = '';
		$status = implodeKV( ':' , ' ' , $lists);
  
	   if(isset($_SERVER["REMOTE_ADDR"]) && !empty($_SERVER["REMOTE_ADDR"])){
		  $raddr =$_SERVER["REMOTE_ADDR"];
	   } else {
		  $raddr = '127.0.0.1';
	   }

	   if(isset($_SERVER["REMOTE_PORT"]) && !empty($_SERVER["REMOTE_PORT"])){
		  $rport = $_SERVER["REMOTE_PORT"];
	   } else {
		  $rport = '8000';
	   }

	   if(isset($_SERVER["REQUEST_URI"]) && !empty($_SERVER["REQUEST_URI"])){
		  $ruri = $_SERVER["REQUEST_URI"];
	   } else {
		  $ruri = '/console';
	   }

	   file_put_contents("php://stdout",
		   sprintf("[%s] %s:%s [%s]:%s \n",
			   date("D M j H:i:s Y"),
			   $raddr,$rport,
			   $status,
			   $ruri
			   )
		   );
   }

  }  // end-of-consolelog

} // end-of-check funtion exist

function toObj($var){
	return  json_decode(json_encode($var),FALSE);
}

function toArray($var){
	return  json_decode(json_encode($var),TRUE);
}

function converdate($date){
	if($date == 'Present') return $date;
	$de = new DateTime($date);
	return $de->format('M d, Y');    
}
