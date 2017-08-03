<?php
use \Jacwright\RestServer\RestException;
use \Jacwright\RestServer\RestController as BaseController;


class RoleController extends BaseController {

	use DbTrait;  // if use DbTrait please add prefix 

	protected function model(){
		return new Role();
	}

}