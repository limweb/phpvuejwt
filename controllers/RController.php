<?php
use \Jacwright\RestServer\RestException;
use \Jacwright\RestServer\RestController as BaseController;


class RController extends BaseController {


	public function getAdmin() {
		if($this->rbac->hasRole(['user','superadmin'])){
			$jwtdata =  $this->jwt->getJwtobjdata();
			echo 'Userid:',$jwtdata->uid,'<br/>';
			echo 'Username:',$jwtdata->username,'<br/>';
	  		echo 'Role:',$jwtdata->role,'<br/>';
	  		echo 'Level:',$jwtdata->level,'<br/>';
	  		// echo 'Iss:',$jwtdata->iss,'<br/>';
	  		// echo 'Aud:',$jwtdata->aud,'<br/>';
	  		// echo 'Jti:',$jwtdata->jti,'<br/>';
	  		// echo 'Iat:',$jwtdata->iat,'<br/>';
	  		// echo 'Exp:',$jwtdata->exp,'<br/>';
	  		echo 'canRead-->',$this->rbac->canRead(),'<br/>';
	  		echo 'canCreate-->',$this->rbac->canCreate(),'<br/>';
			echo 'canInsert-->',$this->rbac->canInsert(),'<br/>';
			echo 'canUpdate-->',$this->rbac->canUpdate(),'<br/>';
			echo 'canEdit-->',$this->rbac->canEdit(),'<br/>';
			echo 'canEarse-->',$this->rbac->canEarse(),'<br/>';
			echo 'canDelete-->',$this->rbac->canDelete(),'<br/>';
			echo 'canDel-->',$this->rbac->canDel(),'<br/>';
			echo 'canPrint-->',$this->rbac->canPrint(),'<br/>';
			echo 'canExport-->',$this->rbac->canExport(),'<br/>';
			echo 'canAuth-->',$this->rbac->canAuth(),'<br/>';
			echo 'canEtc-->',$this->rbac->canEtc(),'<br/>';
			echo 'canCustom-->',$this->rbac->canCustom(),'<br/>';
			// dump($this->jwt->getJwtobjdata());
		} elseif($this->rbac->hasRole('admin')){
			$jwtdata =  $this->jwt->getJwtobjdata();
			echo 'Userid:',$jwtdata->uid,'<br/>';
			echo 'Username:',$jwtdata->username,'<br/>';
	  		echo 'Role:',$jwtdata->role,'<br/>';
	  		echo 'Level:',$jwtdata->level,'<br/>';
	  		// echo 'Iss:',$jwtdata->iss,'<br/>';
	  		// echo 'Aud:',$jwtdata->aud,'<br/>';
	  		// echo 'Jti:',$jwtdata->jti,'<br/>';
	  		// echo 'Iat:',$jwtdata->iat,'<br/>';
	  		// echo 'Exp:',$jwtdata->exp,'<br/>';
	  		echo 'canRead-->',$this->rbac->canRead(),'<br/>';
	  		echo 'canCreate-->',$this->rbac->canCreate(),'<br/>';
			echo 'canInsert-->',$this->rbac->canInsert(),'<br/>';
			echo 'canUpdate-->',$this->rbac->canUpdate(),'<br/>';
			echo 'canEdit-->',$this->rbac->canEdit(),'<br/>';
			echo 'canEarse-->',$this->rbac->canEarse(),'<br/>';
			echo 'canDelete-->',$this->rbac->canDelete(),'<br/>';
			echo 'canDel-->',$this->rbac->canDel(),'<br/>';
			echo 'canPrint-->',$this->rbac->canPrint(),'<br/>';
			echo 'canExport-->',$this->rbac->canExport(),'<br/>';
			echo 'canAuth-->',$this->rbac->canAuth(),'<br/>';
			echo 'canEtc-->',$this->rbac->canEtc(),'<br/>';
			echo 'canCustom-->',$this->rbac->canCustom(),'<br/>';
			// dump($this->jwt->getJwtobjdata());
		} else {
			$this->server->handleError(403);
		}
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
    