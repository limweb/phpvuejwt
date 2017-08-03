<?php
use \Jacwright\RestServer\RestException;
use \Jacwright\RestServer\RestController as BaseController;


class PermissController extends BaseController {

	use DbTrait;  // if use DbTrait please add prefix  and add a fundion model() return new EloquentModel() list Sample
	protected function model(){
		return new Permission();
	}

}