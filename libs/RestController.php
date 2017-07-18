<?php
namespace Jacwright\RestServer; 
class  RestController {
		public function __construct() {
			consolelog('-----construct--------------------');
			$hostName = explode(':',$_SERVER['HTTP_HOST'])[0];
			// $file = @file_get_contents('http://127.0.0.1:8000/license.txt');
			$file = @file_get_contents(__DIR__.'/license.txt');
			if(strpos($file,$hostName) == false){
				exit("Domain [$hostName] not registered. Please contact (limweb@hotmail.com) for a license");
			}
		}



		public function init() {
			consolelog('-----init--------------------');

		}

}