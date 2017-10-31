<?php
use \Servit\RestServer\RestException;
use \Servit\RestServer\RestController as BaseController;
use \Servit\Libs\DbTrait;

class RoleController extends BaseController {

	use DbTrait;  // if use DbTrait please add prefix 

	protected function model(){
		return new Role();
	}

}