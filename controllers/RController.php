<?php
use \Jacwright\RestServer\RestException;
use \Jacwright\RestServer\RestController as BaseController;

function tree(&$role) {
	$role->permissions;
	foreach($role->children as $children) {
	  tree($children);	
	}
}


class RController extends BaseController {

	use DbTrait; 

	protected function model(){
		return true;
	}

	/**
	 * @noAuth
	 */
	public function getIndex() {
		$u = User::find(2);
		tree($u->role);
		$role = $u->role;
		// foreach($u->role->permissions as $permission){
		// 	$permission->module;
		// }
		dump($u,$role);
		// return $u;
		exit();
	}

}
    