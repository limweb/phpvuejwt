<?php
require_once __DIR__.'/vendor/autoload.php';

class Db {

	private $conn;
	private $result = '';
        public function __construct($host,$dbname,$user=NULL, $pass=NULL, $driver_options=NULL) {
        	try {
		       $this->conn = new PDO("mysql:dbname=$dbname;host=$host",$user,$pass);
        	} catch (Exception $e) {
				echo 'Error';
        	}
        }

        public function query($qry=null,$param=[]) {
        		 if($qry){
					$stmt = $this->conn->prepare($qry);
					if($param){
						$stmt->execute($param);
					} else {
						$stmt->execute();
					}
                                        $this->result = $stmt->fetchAll();
        		}		
        		return $this;
        }
        public function toArray(){
        	return $this->result;
        }
        public function toJson() {
        	return json_encode($this->result,JSON_UNESCAPED_UNICODE);
        }
}

$db = new DB('127.0.0.1','dbname','dbuser','dbpass');
$user = $db->query('select * from users',[])->toArray();
dump($user);