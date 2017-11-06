<?php
use \Servit\RestServer\RestException;
use \Servit\RestServer\RestController as BaseController;
use \Servit\Traits\DbTrait;

class PermissController extends BaseController {

	use DbTrait;  // if use DbTrait please add prefix  and add a fundion model() return new EloquentModel() list Sample
	protected function model(){
		return new Permission();
	}

}