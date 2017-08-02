<?php
namespace Jacwright\RestServer; 
class  RestController {

		public function __construct() {
			// consolelog('-----construct--------------------');
			// $hostName = explode(':',$_SERVER['HTTP_HOST'])[0];
			// $file = @file_get_contents('http://127.0.0.1:8000/license.txt');
			// $file = @file_get_contents(__DIR__.'/license.txt');
			// if(strpos($file,$hostName) == false){
			// 	exit("Domain [$hostName] not registered. Please contact (limweb@hotmail.com) for a license");
			// }
			// $this->jwt = (new Restjwt());
			// $this->rbac = (new RestRbac($this->jwt));
			// $this->get =  (object) $_GET;
			// $this->post = (object) $_POST;
		}

		public function authorize(){
			// $chk = 0;
			// if($this->jwt) {
			// 	$this->jwt->server = $this->server;
			// 	$chk =  $this->jwt->chkauth();
			// }
			// return $chk;
			return true;
    	}

		public function init() {
			consolelog('-----init--------------------');
			// dump($this->jwt->tokenverify());
			// dump($this->jwt->chkauth());
		}



}