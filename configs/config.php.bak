<?php

// FOR DEBUGING PHP ---- start>
ini_set('display_errors',1);
ini_set('display_startup_errors',1);
error_reporting(-1);
error_reporting(1);
error_reporting(0);
error_reporting(E_ALL);
ini_set("display_errors", 1);
// FOR DEBUGING PHP ---- end.


date_default_timezone_set('Asia/Bangkok');
define('NONCE_SECRET', 'jvTGophIQ108Pqw9Hej'); // for nonce class
define('DB_NAME'	, 'dbname');
define('DB_USER'	, 'dbuser');
define('DB_PASSWORD', 'dbpass');
define('DB_HOST'	, '127.0.0.1');
define('DB_CHARSET'	, 'utf8');
define('DB_COLLATE'	, '');


define('APPMODE','debug'); // debug or production
define('DEBUG',true);
define('CROS',true);
define('EXPTIME', 60*60*24*30);  //  60sec * 60 mins * 24 hr * 30 day 
define('SECRETKEY','02443f12-e1ef-11e5-b86d-9a79f06e9478');
define('USEDROLE',true);

require_once  __DIR__.'/../vendor/autoload.php';
use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Eloquent\Model as Model;
use Carbon\Carbon;

$capsule = new Capsule;
$config = [
	'driver'    => 'mysql',
	'host'      => DB_HOST,
	'database'  => DB_NAME,
	'username'  => DB_USER,
	'password'  => DB_PASSWORD,
	'charset'   => 'utf8',
	'collation' => 'utf8_unicode_ci',
	'prefix'    => '',
	];

$capsule->addConnection($config,'default' );

// Set the event dispatcher used by Eloquent models... (optional)
use Illuminate\Events\Dispatcher;
use Illuminate\Container\Container;
$capsule->setEventDispatcher(new Dispatcher(new Container));

// // Make this Capsule instance available globally via static methods... (optional)
$capsule->setAsGlobal();

// // Setup the Eloquent ORM... (optional; unless you've used setEventDispatcher())
$capsule->bootEloquent();


class Config {

    protected $values;
    
    public function __construct($obj=null){
        if($obj) {
        	$this->values = $obj;
        } else {
        	$this->values = new \stdClass();
        }

    }

    public function __get($prop) {
        return (isset($this->values->$prop) ? $this->values->$prop : null  );
    }

    public function __set( $prop, $value ) {
             $this->values->$prop = $value;
    }
}

$sysconfig = new Config();
$sysconfig->dbconfig = $config;
