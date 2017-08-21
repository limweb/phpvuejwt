<?php
use \Jacwright\RestServer\RestException;
use \Jacwright\RestServer\RestController as BaseController;


class AppController extends BaseController {


	/**
	 * @noAuth 
	 * @url OPTIONS /app/init
	 * @url POST /app/init
	 */ 
	public function initapp(){
	  return ['status'=>'success'];
	}

}