<?php
use \Servit\RestServer\RestException;
use \Servit\RestServer\RestController as BaseController;
use \Servit\Traits\DbTrait;

class TController extends BaseController {

	use DbTrait;  // if use DbTrait please add prefix 
	protected function model(){
		return new User();
	}


	/**
	 * @noAuth
	 */
    public function getNone() {
        return uuid();
    }

	/**
	 * @noAuth
	 */
	public function getIndex() {
		$page=0;
		$perpage=10;
		$total = $this->model()->get()->count();
		$list = [];
		$where = [];
		

		// $u = User::find(2);
		// tree($u->role);
		// $role = $u->role;
		// // foreach($u->role->permissions as $permission){
		// // 	$permission->module;
		// // }
		dump($users);
		// // return $u;
		exit();
	}

}
    