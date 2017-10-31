<?php
use \Servit\RestServer\RestException;
use \Servit\RestServer\RestController as BaseController;
use Illuminate\Database\Capsule\Manager as Capsule;

class TlenController extends BaseController {
	

	/**
	 * @noAuth 
	 * @url OPTIONS /
	 * @url POST /
	 * @url GET /
	 */ 
	public function initapp(){
	  return ['status'=>'success'];
	}


	/**
	 * @noAuth
	 * @url GET /company
	 */
	public function company(){
		$companys = Company::get();
		dump($companys);
	}


	/**
	 *@noAuth
	 *@url GET /listusers 
	 */
	public function listusers(){
		$users = User::get();
		echo '<ul>';
		foreach ($users as $user) {
			echo '<li><a href="/tlen/user/'.$user->id.'">'.$user->user.($user->profile?'/'.$user->profile->fname.' '.$user->profile->lname:null).'</a></li>';
		}
		echo '</ul>';
	}

	/**
	 * @noAuth
	 * @url GET /users
	 */
	public function users(){
		$users = User::get();
		echo '
			  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.css" />	
			  <table width="100%" border="1" class="table table-hover">
			  <thead>
			  	<tr>
			  	<th style="white-space:nowrap;">id</th>
			  	<th style="white-space:nowrap;">User</th>
			  	<th style="white-space:nowrap;">UUID</th>
			  	<th style="white-space:nowrap;">Package</th>
			  	<th style="white-space:nowrap;">Role</th>
			  	<th style="white-space:nowrap;">Company</th>
			  	<th style="white-space:nowrap;">INFO</th>
			  	<th style="white-space:nowrap;">DEL</th>
			  	<th style="white-space:nowrap;">Add sub User</th>
			  	<th style="white-space:nowrap;">Change Company</th>
			  	<th style="white-space:nowrap;">Add Company</th>
			  	<th style="white-space:nowrap;">add role</th>
			  	</tr>
			  </thead>
			  <tbody>';
		foreach ($users as  $user) {
			if($user->default_select_comp) $user->company;
			$user->role;
			$user->package = Package::where('uuid',$user->uuid)->first();
			$addcompany = '<form method="POST"  action="/tlen/addcompany/'.$user->id.'">';
			$addcompany .= '<input type="text" name="companyname" value="">';
			$addcompany .= '<input type="submit" class="btn-primary" name="submit" value="addcompany"></form>';
			if($user->package->comp_db > 1) {
				$companys = Company::where('comp_code',$user->uuid)->get();
				$chkcompany = '<form method="POST"  action="/tlen/changecompany/'.$user->id.'"><select name="company"><option value="0">please select company</option>'; 
				foreach ($companys as $company) {
					$chkcompany .= '<option value="'.$company->id.'">'.$company->companyname.'</option>';
				}
				$chkcompany .='</select><input type="submit" class="btn-primary" name="submit" value="changecompany"></form>';
			} else {
				$chkcompany = '----no-----';
			}




			$companycount = Company::where('comp_code',$user->uuid)->count();
			$usercount = User::where('uuid',$user->uuid)->count();



			echo '				
			<tr>
			<td style="white-space:nowrap;">'.$user->id.'</td>
			<td style="white-space:nowrap;">'.$user->user.'</td>
			<td style="white-space:nowrap;">'.$user->uuid.'</td>
			<td style="white-space:nowrap;">'.$user->package->name.'</td>
			<td style="white-space:nowrap;">'.$user->role->role.'</td>
			<td style="white-space:nowrap;">'.(isset($user->company->companyname) ? $user->company->companyname : null).'</td>
			<td style="white-space:nowrap;"><a href="/tlen/user/'.$user->id.'">'.$user->user.'</a></td>
			<td style="white-space:nowrap;"><a href="/tlen/deluser/'.$user->id.'" onclick="return confirm(\'Are you sure?\');" >'.$user->user.'</a></td>
			<td style="white-space:nowrap;">'.(($user->package->account > $usercount && $user->role_id == 1 ) ? '<a href="/tlen/addsubuser/'.$user->id.'">'.$user->package->account.'/'.$usercount.'</a>' : $user->package->account.'/'.$usercount ).'</td>
			<td style="white-space:nowrap;">changcompany:'.$chkcompany.'</td>
			<td style="white-space:nowrap;">'.$user->package->comp_db.'/'.$companycount.':-->'.($companycount < $user->package->comp_db && $user->role_id == 1  ? $addcompany : "---no---" ).'</td>
			<td style="white-space:nowrap;">'.($user->role_id == 1 ? '<a href="/tlen/addrole/'.$user->id.'">Addrole</a>':'---no---').'</td>
			</tr>';
		}
		echo '</tbody></table>';
		// dump($users);
		// return $users;
	}
	
	/**
	 * @noAuth
	 * @url GET /user
	 * @url GET /user/$id
	 */
	public function user($id=1){
		try {
			Capsule::enableQuerylog();
		 	Capsule::beginTransaction();
			$user = User::find($id);
				if($user){
					if($user->uuid){
						$user->companies;
					} else {
						$user->companies = Company::get();
					}
					if($user->default_select_comp) $user->company;
					$user->role;
					$user->package = Package::where('uuid',$user->uuid)->first();
					if($user->package) {
						$user->package->tb_limit = json_decode($user->package->tb_limit);
						$user->package->modules = json_decode($user->package->modules);
						$user->package->json_data = json_decode($user->package->json_data);

						// $user->modules = Module::where('level','<=',$user->package->level)->get();
						// $user->package->modules = json_encode($user->modules);
						// $user->package->save();
					}

					if($user->role_id == 1 && $user->parent_id == 0 && $user->package->account > 1 ){
						$user->roles;
					}

					if(isset($user->package->modules) && is_array($user->package->modules)){
						foreach ($user->package->modules as $module) {
							$module->permission = Permission::where('module_id',$module->id)
							                   ->where( function($q) use ($user) {
								                   $q->where('comp_code',$user->uuid)->orWhere('comp_code','********');
							                   })->where('role_id',$user->role_id)->first();
						}
					}
					$user->profile;
					dump(json_decode($user->toJson()));
					// return $user;
				} else  {
					echo 'no user';
				}
		} catch (Exception $e) {
		 	Capsule::rollback();
		}
	}



	/**
	 * @noAuth
	 * @url GET  /adduser/$packageid
	 * @url GET  /adduser/$user/$packageid
	 */
	public function adduser($packageid=2,$user='testuser') {
		try {
			$o = new stdClass();
			Capsule::enableQuerylog();
			Capsule::beginTransaction();
				//------- add new user--------------
					$u = new User();
					$u->user = $user;
					$u->password = password_hash("secret", PASSWORD_DEFAULT);
					$u->uuid = uuid(1);
					$u->role_id = 1;
				//------- select package 2 == free --------
					$freepackage = Syspackage::find($packageid);
					$package = new Package();
					$package->name  = $freepackage->name;
					$package->desc  = $freepackage->desc;
					$package->uuid  = $u->uuid;
					$package->comp_db  = $freepackage->comp_db;
					$package->account  = $freepackage->account;
					$package->modules  = $freepackage->modules;
					$package->tb_limit  = $freepackage->tb_limit;
					$package->remark  = $freepackage->remark;
					$package->status  = $freepackage->status;
					$package->json_data  = json_encode($freepackage);
					$package->promotionid  = $freepackage->promotionid;
					$package->showpublic  = $freepackage->showpublic;
					$package->level  = $freepackage->level;
					$package->created_by  = 'system';
					$package->updated_by  = 'system';
					$package->save();
				//------- add Company ------------------
					$company = new Company();
					$company->companyname = $u->user.' co.,ltd.';
					$company->comp_code = $u->uuid;
					$company->comp_uuid = short_uuid();
					$company->path = '/';
					$company->status = '1';
					$company->sort = '0';
					$company->created_by = 'system';
					$company->updated_by = 'system';
					$company->save();
				//------- add Profile ------------------
					$u->default_select_comp = $company->id;
					$u->save();
				    $profile = new Profile();
						$profile->user_id = $u->id;
						$profile->fname = $u->user;
						$profile->lname = 'lname';
						$profile->email = 'email';
						$profile->address1 = '123 address1';
						$profile->address2 = 'address2';
						$profile->district = 'JJ';
						$profile->provice = 'BKK';
						$profile->country = 'TH';
						$profile->zipcode = '10250';
						$profile->tel = '023005507';
						$profile->created_by = 'system';
						$profile->updated_by = 'system';
						$profile->save();
		 	Capsule::commit();
			$sql = Capsule::getQueryLog();
			consolelog($sql);
			// echo '<a href="/tlen/user/'.$u->id.'">'.$u->user.'</a>';
			dump($u,$package,$company,$profile);
			$o->user = $u;
			$o->package = $package;
			$o->company = $company;
			$o->profile = $profile;
			// return $o;
		} catch (Exception $e) {
		 	Capsule::rollback();
		 	$this->server->handleError(400,$e->getMessage());
		}
	}



	/**
	 * @noAuth
	 * @url GET  /deluser/$id
	 */
	public function deluser($id) {
		try {
			Capsule::enableQuerylog();
		 	Capsule::beginTransaction();
			$o = new stdClass();
			$u = User::find($id);
			if($u){
				// Company::where('comp_code',$u->uuid)->delete();
				// Package::where('uuid',$u->uuid)->delete();
				// if($u->profile) $u->profile->delete();
				// $u->delete();
				$sql = Capsule::getQueryLog();
				// consolelog($sql);
			 	Capsule::commit();
			 	echo 'Del user id=',$id,'  Successed.';
			} else {
				throw new Exception("No Usr for Delete this ID", 1);
			}
		} catch (Exception $e) {
		 	Capsule::rollback();
		 	$this->server->handleError(400,$e->getMessage());
		}
	}


	/**
	 * @noAuth
	 * @url GET  /index
	 */
	public function frmadduser() {
		echo '-------------------------- Add User---------------------------------------------<br/><form action="/tlen/adduser" method="POST" accept-charset="utf-8">';
		echo '1. select package Package:  ';
		$packages = Package::get();
		echo '<select name="package"><option value="0">---Please Select Package</option>';
		foreach ($packages as $package ) {
			echo '<option value="'.$package->id.'">'.$package->name,'</option>';
		}
		echo '</select><br/>';
		echo '2. give username: <input type="text" name="user" value="" placeholder="username"><br/>';
		echo '3. give email: <input type="email" name="email" value="" placeholder="email"><br/>';
		echo '4. give address1: <input type="text" name="address1" value="" placeholder="address1"><br/>';
		echo '5. give address2: <input type="text" name="address2" value="" placeholder="address2"><br/>';
		echo '6. select Role:<select name="role"><option value="0">---Please Select Role</option>';
		$roles = Role::where('comp_code','*********')->get();
		foreach ($roles as $role ) {
			echo '<option value="'.$role->id.'">'.$role->role,'</option>';
		}
		echo '</select></br/>';
		echo '7. give company Name: <input type="text" name="company" value="" placeholder="companyname"><br/>';
		echo '<input type="reset" name="reset" value="Reset"><input type="submit" name="submit" value="Submit"></form>';
	}

		/**
	 * @noAuth
	 * @url POST  /adduser
	 */
	public function postadduser() {
		dump($this->post);
		$packageid = $this->post->package;
  		$user = $this->post->user;
  		$email = $this->post->email;
  		$address1 = $this->post->address1;
  		$address2 = $this->post->address2;
  		$role = $this->post->role;
  		$companyname = $this->post->company;
		try {
			$o = new stdClass();
			Capsule::enableQuerylog();
			Capsule::beginTransaction();
				//------- add new user--------------
					$u = new User();
					$u->user = $user;
					$u->password = password_hash("secret", PASSWORD_DEFAULT);
					$u->uuid = uuid(1);
					$u->role_id = $role;
				//------- select package 2 == free --------
					$freepackage = Syspackage::find($packageid);
					$package = new Package();
					$package->name  = $freepackage->name;
					$package->desc  = $freepackage->desc;
					$package->uuid  = $u->uuid;
					$package->comp_db  = $freepackage->comp_db;
					$package->account  = $freepackage->account;
					$package->modules  = $freepackage->modules;
					$package->tb_limit  = $freepackage->tb_limit;
					$package->remark  = $freepackage->remark;
					$package->status  = $freepackage->status;
					$package->json_data  = json_encode($freepackage);
					$package->promotionid  = $freepackage->promotionid;
					$package->showpublic  = $freepackage->showpublic;
					$package->level  = $freepackage->level;
					$package->created_by  = 'system';
					$package->updated_by  = 'system';
					$package->save();
				//------- add Company ------------------
					$company = new Company();
					$company->companyname = $companyname.' co.,ltd.';
					$company->comp_code = $u->uuid;
					$company->path = '/';
					$company->save();
				//------- add Profile ------------------
					$u->default_select_comp = $company->id;
					$u->save();
				    $profile = new Profile();
						$profile->user_id = $u->id;
						$profile->fname = $u->user;
						$profile->comp_code = $u->uuid;
						$profile->lname = 'lname';
						$profile->email = $email;
						$profile->address1 = $address1;
						$profile->address2 = $address2;
						$profile->district = 'JJ';
						$profile->provice = 'BKK';
						$profile->country = 'TH';
						$profile->zipcode = '10250';
						$profile->tel = '023005507';
						$profile->created_by = 'system';
						$profile->updated_by = 'system';
						$profile->save();
		 	Capsule::commit();
			$sql = Capsule::getQueryLog();
			consolelog($sql);
			// echo '<a href="/tlen/user/'.$u->id.'">'.$u->user.'</a>';
			dump($u,$package,$company,$profile);
			$o->user = $u;
			$o->package = $package;
			$o->company = $company;
			$o->profile = $profile;
			// return $o;
		} catch (Exception $e) {
		 	Capsule::rollback();
		 	$this->server->handleError(400,$e->getMessage());
		}

	}



	/**
	 * @noAuth
	 * @url POST /changecompany/$userid
	 */
	public function changecompany($userid){

		if($this->post->company > 0 ) {
			$user = User::find($userid);
			if($user){
				$user->default_select_comp = $this->post->company;
				$user->save();
				echo 'change comapany:',$this->post->company,' for user:',$user->user,'successed.';
			}
		}
	}


	/**
	 *@noAuth
	 *@url GET /addsubuser/$userid
	 */
	public function addsubuser($userid){
		echo '---- Add sub user ----------------------<br/>';
		$user = User::find($userid);
		$user->package = Package::where('uuid',$user->uuid)->first();
		$usercount = User::where('uuid',$user->uuid)->get();
		$dbcount = Company::where('comp_code',$user->uuid)->count();
		if($user->role_id == 1 && $user->parent_id == 0 && $usercount->count() <= $user->package->account  ){
				$user->roles;
		}
		if($user->role_id == 1 && $user->parent_id == 0 && $dbcount <= $user->package->comp_db ){
				$dbs = Company::where('comp_code',$user->uuid)->get();
		}

		dump($user);
		echo '<form action="/tlen/addsubuser" method="POST" accept-charset="utf-8">
		<select name="role"><option value="0">please select role ----</option>';
		foreach ($user->roles as $role) {
			echo '<option value="'.$role->id.'">'.$role->role.'</option>';
		}
		echo '</select><select name="compy"><option value="0">please select compy ----</option>';
		foreach ($dbs as $db) {
			echo '<option value="'.$db->id.'">'.$db->companyname.'</option>';
		}
		echo '</select>
			  <input type="hidden" name="userid" value="'.$user->id.'" placeholder="userid" >
			  <input type="text" name="username" value="" placeholder="username">
			  <input type="reset" name="reset" value="reset">
			  <input type="submit" name="submit" value="submit">
			  </form>';
	}

	/**
	 *@noAuth
	 *@url POST /addsubuser
	 */
	public function addpostsubuser() {
		try {
		// 	Capsule::enableQuerylog();
		// 	Capsule::beginTransaction();	
			if($this->post->userid && $this->post->username && $this->post->role ){
				dump($this->post);
				$mainuser = User::find($this->post->userid);
				$newuser = new User();
				$newuser->user  = $this->post->username;
				$newuser->password = password_hash("secret", PASSWORD_DEFAULT);
				$newuser->role_id = $this->post->role;
				$newuser->status = 1;
				$newuser->uuid = $mainuser->uuid;
				$newuser->default_select_comp =$mainuser->default_select_comp;
				$newuser->chkpermiss = $mainuser->chkpermiss;
				$newuser->sysadmin = 0;
				$newuser->parent_id = $mainuser->id;
				$newuser->save();
				$profile = new Profile();
						$profile->user_id = $newuser->id;
						$profile->fname = $newuser->user;
						$profile->comp_code = $newuser->uuid;
						$profile->lname = 'lname';
						$profile->email = 'email';
						$profile->address1 = '$address1';
						$profile->address2 = '$address2';
						$profile->district = 'JJ';
						$profile->provice = 'BKK';
						$profile->country = 'TH';
						$profile->zipcode = '10250';
						$profile->tel = '023005507';
						$profile->save();
				Capsule::commit();
				dump($mainuser,$newuser);
			} else {
				throw new Exception("Please Fill any data!.", 1);
			}
		} catch (Exception $e) {
				Capsule::rollback();
				$this->server->handleError(400,$e->getMessage());
		}
	}


	/**
	 * @noAuth
	 * @url POST /addcompany/$userid
	 */
	public function addcompany($userid){
			$mainuser = User::find($userid);
			if($mainuser){
				$company = new Company();
				$company->companyname = $this->post->companyname.' co.,ltd.';
				$company->comp_code = $mainuser->uuid;
				$company->comp_uuid = short_uuid();
				$company->path = '/';
				$company->status = '1';
				$company->sort = '0';
				$company->save();
			}
			dump($userid,$this->post,$mainuser,$company);
	}

	/**
	 *@noAuth
	 *@url GET /addrole/$userid
	 */
	public function addrole($userid) { ?>
				<!DOCTYPE html>
				<html>
				<head>
					<meta charset="utf-8">
					<meta http-equiv="X-UA-Compatible" content="IE=edge">
					<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
					<title> Add Role </title>
					<script src="https://unpkg.com/vue/dist/vue.min.js"></script>
				    <style type="text/css" media="screen">
				        @-webkit-keyframes a{0%{opacity:0;bottom:-15px;max-height:0;max-width:0;margin-top:0}30%{opacity:.8;bottom:-3px}to{opacity:1;bottom:0;max-height:200px;margin-top:12px;max-width:400px}}@keyframes a{0%{opacity:0;bottom:-15px;max-height:0;max-width:0;margin-top:0}30%{opacity:.8;bottom:-3px}to{opacity:1;bottom:0;max-height:200px;margin-top:12px;max-width:400px}}@-webkit-keyframes b{0%{opacity:1;bottom:0}30%{opacity:.2;bottom:-3px}to{opacity:0;bottom:-15px}}@keyframes b{0%{opacity:1;bottom:0}30%{opacity:.2;bottom:-3px}to{opacity:0;bottom:-15px}}@-webkit-keyframes c{0%{opacity:0}30%{opacity:.5}to{opacity:.6}}@keyframes c{0%{opacity:0}30%{opacity:.5}to{opacity:.6}}@-webkit-keyframes d{0%{opacity:.6}30%{opacity:.1}to{opacity:0}}@keyframes d{0%{opacity:.6}30%{opacity:.1}to{opacity:0}}.notyf__icon--alert,.notyf__icon--confirm{height:21px;width:21px;background:#fff;border-radius:50%;display:block;margin:0 auto;position:relative}.notyf__icon--alert:after,.notyf__icon--alert:before{content:"";background:#ed3d3d;display:block;position:absolute;width:3px;border-radius:3px;left:9px}.notyf__icon--alert:after{height:3px;top:14px}.notyf__icon--alert:before{height:8px;top:4px}.notyf__icon--confirm:after,.notyf__icon--confirm:before{content:"";background:#3dc763;display:block;position:absolute;width:3px;border-radius:3px}.notyf__icon--confirm:after{height:6px;-webkit-transform:rotate(-45deg);transform:rotate(-45deg);top:9px;left:6px}.notyf__icon--confirm:before{height:11px;-webkit-transform:rotate(45deg);transform:rotate(45deg);top:5px;left:10px}.notyf__toast{display:block;overflow:hidden;-webkit-animation:a .3s forwards;animation:a .3s forwards;box-shadow:0 1px 3px 0 rgba(0,0,0,.45);position:relative;padding-right:13px}.notyf__toast.notyf--alert{background:#ed3d3d}.notyf__toast.notyf--confirm{background:#3dc763}.notyf__toast.notyf--disappear{-webkit-animation:b .3s 1 forwards;animation:b .3s 1 forwards;-webkit-animation-delay:.25s;animation-delay:.25s}.notyf__toast.notyf--disappear .notyf__message{opacity:1;-webkit-animation:b .3s 1 forwards;animation:b .3s 1 forwards;-webkit-animation-delay:.1s;animation-delay:.1s}.notyf__toast.notyf--disappear .notyf__icon{opacity:1;-webkit-animation:d .3s 1 forwards;animation:d .3s 1 forwards}.notyf__wrapper{display:table;width:100%;padding-top:20px;padding-bottom:20px;padding-right:15px;border-radius:3px}.notyf__icon{width:20%;text-align:center;font-size:1.3em;-webkit-animation:c .5s forwards;animation:c .5s forwards;-webkit-animation-delay:.25s;animation-delay:.25s}.notyf__icon,.notyf__message{display:table-cell;vertical-align:middle;opacity:0}.notyf__message{width:80%;position:relative;-webkit-animation:a .3s forwards;animation:a .3s forwards;-webkit-animation-delay:.15s;animation-delay:.15s}.notyf{position:fixed;bottom:20px;right:30px;width:20%;color:#fff;z-index:1}@media only screen and (max-width:736px){.notyf__container{width:90%;margin:0 auto;display:block;right:0;left:0}}        
				    </style>
				    <script type="text/javascript">
							class Notyf {

							    constructor(args) {
							        this.notifications = [];
							        var defaults = {
							            delay: 2000,
							            alertIcon: 'notyf__icon--alert',
							            confirmIcon: 'notyf__icon--confirm'
							        }

							        if (arguments[0] && typeof arguments[0] == "object") {
							            this.options = this.extendDefaults(defaults, arguments[0]);
							        } else {
							            this.options = defaults;
							        }

							        //Creates the main notifications container
							        var docFrag = document.createDocumentFragment();
							        var notyfContainer = document.createElement('div');
							        notyfContainer.className = 'notyf';
							        docFrag.appendChild(notyfContainer);
							        document.body.appendChild(docFrag);
							        this.container = notyfContainer;
							        //Stores which transitionEnd event this browser supports
							        this.animationEnd = this.animationEndSelect();
							    }
							    //---------- Public methods ---------------
							    /**
							     * Shows an alert card
							     */
							    alert(alertMessage) {
							        var card = this.buildNotificationCard.call(this, alertMessage, this.options.alertIcon);
							        card.className += ' notyf--alert';
							        this.container.appendChild(card);
							        this.notifications.push(card);
							    }


							    /**
							     * Creates a generic card with the param message. Returns a document fragment.
							     */
							     buildNotificationCard(messageText, iconClass) {
							        //Card wrapper
							        var notification = document.createElement('div');
							        notification.className = 'notyf__toast';

							        var wrapper = document.createElement('div');
							        wrapper.className = 'notyf__wrapper';

							        var iconContainer = document.createElement('div');
							        iconContainer.className = 'notyf__icon';

							        var icon = document.createElement('i');
							        icon.className = iconClass;

							        var message = document.createElement('div');
							        message.className = 'notyf__message';
							        message.innerHTML = messageText;

							        //Build the card
							        iconContainer.appendChild(icon);
							        wrapper.appendChild(iconContainer);
							        wrapper.appendChild(message);
							        notification.appendChild(wrapper);

							        var _this = this;
							        setTimeout(function() {
							            notification.className += " notyf--disappear";
							            notification.addEventListener(_this.animationEnd, function(event) {
							                event.target == notification && _this.container.removeChild(notification);
							            });
							            var index = _this.notifications.indexOf(notification);
							            _this.notifications.splice(index, 1);
							        }, _this.options.delay);

							        return notification;
							    }

							    // Determine which animationend event is supported
							    animationEndSelect() {
							        var t;
							        var el = document.createElement('fake');
							        var transitions = {
							            'transition': 'animationend',
							            'OTransition': 'oAnimationEnd',
							            'MozTransition': 'animationend',
							            'WebkitTransition': 'webkitAnimationEnd'
							        }

							        for (t in transitions) {
							            if (el.style[t] !== undefined) {
							                return transitions[t];
							            }
							        }
							    }

							    //---------- Private methods ---------------

							    /**
							     * Populates the source object with the value from the same keys found in destination
							     */
							    extendDefaults(source, destination) {
							        // console.log('bf',source);
							        for (source.property in destination) {
							            console.log(source.property);
							            //Avoid asigning inherited properties of destination, only asign to source the destination own properties
							            if (destination.hasOwnProperty(source.property)) {
							                source[source.property] = destination[source.property];
							            }
							        }
							        // console.log('af',source);
							        return source;
							    }

							    /**
							     * Shows a confirm card
							     */
							    confirm(alertMessage) {
							        var card = this.buildNotificationCard.call(this, alertMessage, this.options.confirmIcon);
							        card.className += ' notyf--confirm';
							        this.container.appendChild(card);
							        this.notifications.push(card);
							    }
							}
				    </script>
				</head>
				<body>
				<div id="app"> <?php
				//---------------------- start -------------------php -------------------------------
				try {
					$user = User::find($userid);
					$permitype = Capsule::select('SELECT information_schema.`COLUMNS`.COLUMN_NAME from information_schema.columns  where TABLE_SCHEMA = "dbname" and TABLE_NAME = "permissions" ');
					if($user){
						if($user->role_id != 1 ) throw new Exception("Forbidden", 1);
						$user->roles;
						$user->role;
						$user->package = Package::where('uuid',$user->uuid)->first();
						echo 'User Name : <b>',$user->user,'</b><br/>';
						echo 'my role : <b>',$user->role->role,'</b><br/>';
						echo 'Package: <b>',$user->package->name,'</b><br/>';
						echo '----------this package have roles-('.$user->roles->count().')------------<br/>';
						$modules = json_decode($user->modules);
						foreach( $user->roles as $role ) {
							echo '---->',$role->role,'<br/>';
							if($modules){
								foreach ($modules as $module) {
									$permis = Permission::where('role_id',$role->id)->where('module_id',$module->id)->first();
									// dump($permis);
								}
							}
						}
						$accounts = User::where('uuid',$user->uuid)->get();
						$totalaccount = $accounts->count();
						$dbs = Company::where('comp_code',$user->uuid)->get();
						$totaldb = $dbs->count();
						echo '<br/>user account : ',$totalaccount,'/'.$user->package->account.' (total)<br/>'; 
						foreach ($accounts as $account) {
							echo '--username: ',$account->user,'<br/>';
						}
						echo '<br/>';
						echo 'company db : ',$totaldb,'/'.$user->package->comp_db.' (total)<br/>';
						foreach ($dbs as $db) {
							echo '--db: ',$db->companyname,'<br/>';
						}
						echo '---------modules-------------<br/>';
						// $modules = Module::where('level','<=',$user->package->level)->where('status',1)->get();	
						// $moduleids = [];		
						if($modules){
							foreach ($modules as $module) {
								// $moduleids[] = $module->id;
								$module->permission = Permission::where('role_id',$user->role_id)->where('module_id',$module->id)->first();
								echo '----->',$module->module,'/',$module->route,'<br/>';
								echo '<pre>',json_encode($module->permission),'</pre>';
								// dump($module);
							}
						} ?>
							<input type="text" v-model="role" name="rolename" value="" placeholder="Role Name">
							<div v-for="r in roles">
								<span>{{r.role}}</span>:<input type="checkbox" v-model="r.isRead"    name="isRead"    value=""><span>isRead</span>
								<span>{{r.role}}</span>:<input type="checkbox" v-model="r.isAdd"     name="isAdd"     value=""><span>isAdd</span>
								<span>{{r.role}}</span>:<input type="checkbox" v-model="r.isDelete"  name="isDelete"  value=""><span>isDelete</span>
								<span>{{r.role}}</span>:<input type="checkbox" v-model="r.idEdit"    name="idEdit"    value=""><span>idEdit</span>
								<span>{{r.role}}</span>:<input type="checkbox" v-model="r.isPrint"   name="isPrint"   value=""><span>isPrint</span>
								<span>{{r.role}}</span>:<input type="checkbox" v-model="r.isExport"  name="isExport"  value=""><span>isExport</span>
								<span>{{r.role}}</span>:<input type="checkbox" v-model="r.isCancel"  name="isCancel"  value=""><span>isCancel</span>
								<span>{{r.role}}</span>:<input type="checkbox" v-model="r.isApprove" name="isApprove" value=""><span>isApprove</span>
								<span>{{r.role}}</span>:<input type="checkbox" v-model="r.isMauthor" name="isMauthor" value=""><span>isMauthor</span>
							</div>
						<?php
							// $ms = Module::whereIn('id',$moduleids)->get();
							// dump($moduleids,$ms);
							// $user->modules = json_encode($modules);
							// unset($user->package);
							// $user->save();
							// dump($user);
							// $user->package->save();
							// dump($user,$user->package,$totalaccount,$totaldb,$modules);
							$o = new stdClass();
							$o->user = $user;
							$o->user->getTableColumns;
							$o->accounts = $accounts;
							$o->dbs = $dbs;
							$o->modules = $modules;
							$o->permiss = $permitype;

							$o->test = Capsule::getSchemaBuilder()->getColumnListing('roles_copy');
					} else {
						throw new Exception("no user in this id", 1);
					}
				} catch (Exception $e) {
					echo 'Error:',$e->getMessage();
				}
				//--------------------- end php ---------------------------- ?>
				</div>	
				<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
				<script src="https://unpkg.com/vue-resource/dist/vue-resource.min.js"></script>
				<script type="text/javascript">
					var vm = new Vue({
							mixins:[],
							data() {
								return {
									data: <?=json_encode($o)?>,
									role:'',
									roles:[{},{},{}]
								} 
							},
							el:'#app',
							methods:{
							 alert(){ this.$nty.alert('Hello test');     },
						     confirm(){ this.$nty.confirm('test confirm'); }
							},
							computed:{ },
							watch: {},
							components:{},
							beforeCreate  () { },
							created       () { },
							beforeMount   () { },
							mounted       () { this.$nty = new Notyf(); },
							beforeUpdate  () { },
							updated       () { },
							beforeDestroy () { },
							destroyed     () { },
					})	
				</script>
				</body>
				</html>
	<?php }


	/**
	 * @noAuth
	 * @url GET  /test
	 */
	public function test(){
		$this->server->setConnection('sys_');
		$us = User::get();
		dump($us);
		$this->server->setConnection();
		$us = User::get();
		dump($us);
		// $us = User::isParent()->isSysadmin()->get();
		// dump($us->toArray());
	}


	/**
	 * @noAuth
	 * @url GET /crudx
	 * @url POST /crud/$table
	 * @url POST /crud/$table/$page
	 * @url POST /crud/$table/$page/$perpage
	 * @url POST /crud/$table/$page/$perpage/$kw
	 * @url PUT /crud/$table/$id
	 * @url PUT /crud/$table/$id/$page
	 * @url PUT /crud/$table/$id/$page/$perpage
	 * @url PUT /crud/$table/$id/$page/$perpage/$kw
	 * @url DELETE /crud/$table/$id
	 * @url DELETE /crud/$table/$id/$page
	 * @url DELETE /crud/$table/$id/$page/$perpage
	 * @url DELETE /crud/$table/$id/$page/$perpage/$kw
	 */
	public function postCrud($table=null,$id=null,$page=1,$perpage=15,$kw=''){
		$o = new stdClass();
		$o->method = $this->server->method;
		if(empty($table)) return $o;
		switch ($this->server->method) {
			case 'PUT':
				$sql ='select * from '.$table.' where id =  ? ';
				$o->item = Capsule::select($sql,[$id]);
				$o->post = $this->server->data;
				// $o->cols = Capsule::select('DESCRIBE '.$table);
				$o->cols = Dbcolinfo::where('tbname',$table)->get();
				$o->rows = Capsule::select('select * from '.$table);
				break;
			case 'POST':
				if($this->server->data && empty($this->server->data->id)){
					$o->method = 'insert';
					$o->post = $this->server->data;
				}
				// $o->cols = Capsule::select('DESCRIBE '.$table);
				$o->cols = Dbcolinfo::where('tbname',$table)->get();
				$o->rows = Capsule::select('select * from '.$table);
				break;
			case 'DELETE':
				$sql ='select * from '.$table.' where id =  ? ';
				$o->item = Capsule::select($sql,[$id]);
				$o->cols = Dbcolinfo::where('tbname',$table)->get();
				// $o->cols = Capsule::select('DESCRIBE '.$table);
				$o->rows = Capsule::select('select * from '.$table);
				break;
			default:
				$o->message ='ok';
				break;
		}
		return $o;

	}

	/**
	 * @noAuth
	 * @url GET /crud
	 */
	public function crud(){ 
		$tables = Capsule::select('SHOW TABLES');
		?>
			<html>
			<head>
				<meta charset="utf-8">
				<meta http-equiv="X-UA-Compatible" content="IE=edge">
				<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
				<title>CRUD</title>
				<script src="https://unpkg.com/vue/dist/vue.min.js"></script>
				<link rel='stylesheet' href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" >
				<!-- <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> -->
 				<!-- <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css"> -->
			    
			    <!-- Add this to <head> -->
				<link type="text/css" rel="stylesheet" href="//unpkg.com/bootstrap@next/dist/css/bootstrap.min.css"/>
				<link type="text/css" rel="stylesheet" href="//unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>

			    <style type="text/css" media="screen">
			        @-webkit-keyframes a{0%{opacity:0;bottom:-15px;max-height:0;max-width:0;margin-top:0}30%{opacity:.8;bottom:-3px}to{opacity:1;bottom:0;max-height:200px;margin-top:12px;max-width:400px}}@keyframes a{0%{opacity:0;bottom:-15px;max-height:0;max-width:0;margin-top:0}30%{opacity:.8;bottom:-3px}to{opacity:1;bottom:0;max-height:200px;margin-top:12px;max-width:400px}}@-webkit-keyframes b{0%{opacity:1;bottom:0}30%{opacity:.2;bottom:-3px}to{opacity:0;bottom:-15px}}@keyframes b{0%{opacity:1;bottom:0}30%{opacity:.2;bottom:-3px}to{opacity:0;bottom:-15px}}@-webkit-keyframes c{0%{opacity:0}30%{opacity:.5}to{opacity:.6}}@keyframes c{0%{opacity:0}30%{opacity:.5}to{opacity:.6}}@-webkit-keyframes d{0%{opacity:.6}30%{opacity:.1}to{opacity:0}}@keyframes d{0%{opacity:.6}30%{opacity:.1}to{opacity:0}}.notyf__icon--alert,.notyf__icon--confirm{height:21px;width:21px;background:#fff;border-radius:50%;display:block;margin:0 auto;position:relative}.notyf__icon--alert:after,.notyf__icon--alert:before{content:"";background:#ed3d3d;display:block;position:absolute;width:3px;border-radius:3px;left:9px}.notyf__icon--alert:after{height:3px;top:14px}.notyf__icon--alert:before{height:8px;top:4px}.notyf__icon--confirm:after,.notyf__icon--confirm:before{content:"";background:#3dc763;display:block;position:absolute;width:3px;border-radius:3px}.notyf__icon--confirm:after{height:6px;-webkit-transform:rotate(-45deg);transform:rotate(-45deg);top:9px;left:6px}.notyf__icon--confirm:before{height:11px;-webkit-transform:rotate(45deg);transform:rotate(45deg);top:5px;left:10px}.notyf__toast{display:block;overflow:hidden;-webkit-animation:a .3s forwards;animation:a .3s forwards;box-shadow:0 1px 3px 0 rgba(0,0,0,.45);position:relative;padding-right:13px}.notyf__toast.notyf--alert{background:#ed3d3d}.notyf__toast.notyf--confirm{background:#3dc763}.notyf__toast.notyf--disappear{-webkit-animation:b .3s 1 forwards;animation:b .3s 1 forwards;-webkit-animation-delay:.25s;animation-delay:.25s}.notyf__toast.notyf--disappear .notyf__message{opacity:1;-webkit-animation:b .3s 1 forwards;animation:b .3s 1 forwards;-webkit-animation-delay:.1s;animation-delay:.1s}.notyf__toast.notyf--disappear .notyf__icon{opacity:1;-webkit-animation:d .3s 1 forwards;animation:d .3s 1 forwards}.notyf__wrapper{display:table;width:100%;padding-top:20px;padding-bottom:20px;padding-right:15px;border-radius:3px}.notyf__icon{width:20%;text-align:center;font-size:1.3em;-webkit-animation:c .5s forwards;animation:c .5s forwards;-webkit-animation-delay:.25s;animation-delay:.25s}.notyf__icon,.notyf__message{display:table-cell;vertical-align:middle;opacity:0}.notyf__message{width:80%;position:relative;-webkit-animation:a .3s forwards;animation:a .3s forwards;-webkit-animation-delay:.15s;animation-delay:.15s}.notyf{position:fixed;bottom:20px;right:30px;width:20%;color:#fff;z-index:1}@media only screen and (max-width:736px){.notyf__container{width:90%;margin:0 auto;display:block;right:0;left:0}}        
			        #content {
			        	overflow: auto;
			        }
			    </style>
			    <script type="text/javascript">
						class Notyf {
						    constructor(args) {
						        this.notifications = [];
						        var defaults = {
						            delay: 2000,
						            alertIcon: 'notyf__icon--alert',
						            confirmIcon: 'notyf__icon--confirm'
						        }

						        if (arguments[0] && typeof arguments[0] == "object") {
						            this.options = this.extendDefaults(defaults, arguments[0]);
						        } else {
						            this.options = defaults;
						        }

						        //Creates the main notifications container
						        var docFrag = document.createDocumentFragment();
						        var notyfContainer = document.createElement('div');
						        notyfContainer.className = 'notyf';
						        docFrag.appendChild(notyfContainer);
						        document.body.appendChild(docFrag);
						        this.container = notyfContainer;

						        //Stores which transitionEnd event this browser supports
						        this.animationEnd = this.animationEndSelect();
						    }
						    //---------- Public methods ---------------
						    /**
						     * Shows an alert card
						     */
						    alert(alertMessage) {
						        var card = this.buildNotificationCard.call(this, alertMessage, this.options.alertIcon);
						        card.className += ' notyf--alert';
						        this.container.appendChild(card);
						        this.notifications.push(card);
						    }
						    /**
						     * Creates a generic card with the param message. Returns a document fragment.
						     */
						     buildNotificationCard(messageText, iconClass) {
						        //Card wrapper
						        var notification = document.createElement('div');
						        notification.className = 'notyf__toast';

						        var wrapper = document.createElement('div');
						        wrapper.className = 'notyf__wrapper';

						        var iconContainer = document.createElement('div');
						        iconContainer.className = 'notyf__icon';

						        var icon = document.createElement('i');
						        icon.className = iconClass;

						        var message = document.createElement('div');
						        message.className = 'notyf__message';
						        message.innerHTML = messageText;

						        //Build the card
						        iconContainer.appendChild(icon);
						        wrapper.appendChild(iconContainer);
						        wrapper.appendChild(message);
						        notification.appendChild(wrapper);

						        var _this = this;
						        setTimeout(function() {
						            notification.className += " notyf--disappear";
						            notification.addEventListener(_this.animationEnd, function(event) {
						                event.target == notification && _this.container.removeChild(notification);
						            });
						            var index = _this.notifications.indexOf(notification);
						            _this.notifications.splice(index, 1);
						        }, _this.options.delay);

						        return notification;
						    }

						    // Determine which animationend event is supported
						    animationEndSelect() {
						        var t;
						        var el = document.createElement('fake');
						        var transitions = {
						            'transition': 'animationend',
						            'OTransition': 'oAnimationEnd',
						            'MozTransition': 'animationend',
						            'WebkitTransition': 'webkitAnimationEnd'
						        }

						        for (t in transitions) {
						            if (el.style[t] !== undefined) {
						                return transitions[t];
						            }
						        }
						    }

						    //---------- Private methods ---------------

						    /**
						     * Populates the source object with the value from the same keys found in destination
						     */
						    extendDefaults(source, destination) {
						        // console.log('bf',source);
						        for (source.property in destination) {
						            console.log(source.property);
						            //Avoid asigning inherited properties of destination, only asign to source the destination own properties
						            if (destination.hasOwnProperty(source.property)) {
						                source[source.property] = destination[source.property];
						            }
						        }
						        // console.log('af',source);
						        return source;
						    }

						    /**
						     * Shows a confirm card
						     */
						    confirm(alertMessage) {
						        var card = this.buildNotificationCard.call(this, alertMessage, this.options.confirmIcon);
						        card.className += ' notyf--confirm';
						        this.container.appendChild(card);
						        this.notifications.push(card);
						    }

						}
			    </script>

			</head>
			<body>
		<div id="app" style="padding-left:10px;padding-right:10px;"> 
	 	Select Table: <select class="selectpicker" name="table" v-model="selecttb"  @change="selecttable">
	 	<option value="0">please -- select table --</option>
		<?php
	 	 foreach ($tables as $table) {
	 	 	 echo '<option value="'.$table->Tables_in_dbname.'">'.$table->Tables_in_dbname.'</option>';
	 	 }
		?>
		</select><br/><br/><hr/>
		<div v-if="selecttb != 0">
			<h2>Table: <b>{{selecttb}}</b></h2>
			<br/><br/>
			<div  id="content">

				<input class="btn btn-primary" style="float:left" type="button" name="insert" value="New" @click="newitem()">
				<table class="table table-striped table-hover" width="100%" >
					<thead  class="thead-inverse" ><tr>
						<th v-for="(col,idx) in columns" v-show="col.show" >{{col.field}}</th>
					<th>Action</th></tr></thead>
					<tbody>
						<tr v-for="rows in datarows">
							<td v-for="(col,idx) in columns" v-show="col.show">
								<!-- {{col.type}}/{{rows[col.field]}} -->
								<div v-if="col.type=='number'"><input style="width:100px;" type="number" name="{{col.field}}" v-model="rows[col.field]"/></div>
								<div v-if="col.type=='checkbox'"><input  type="checkbox" name="{{col.field}}" v-model="rows[col.field]" ><label>{{rows[col.field]}}</label></input></div>
								<div v-if="col.type=='datetime'"><input style="width:255px;"  type="datetime-local" name="{{col.field}}" v-bind:value="convertdate(rows[col.field])" @change="changedate(rows,col.field,event)"/></div>
								<div v-if="col.type=='textarea'"><textarea  name="{{col.field}}" v-model="rows[col.field]"></textarea></div>
								<div v-if="col.type=='text'"><input  type="text" name="{{col.field}}" v-model="rows[col.field]" /></div>
							</td>
							<td style="width:100px;"><div style="display:flex">
								<input class="btn btn-warning btn-xs" type="button" name="edit" value="save" @click="editrow(rows)"> &nbsp;
								<input class="btn btn-danger btn-xs" type="button" name="del" value="del" @click="deleterow(rows)">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div v-else="select 1=0"> <center><b>Please Select Table</b></center></div>
		</div>	
		<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
		<script src="https://unpkg.com/vue-resource/dist/vue-resource.min.js"></script>
		<script type="text/javascript">
				
				var vm = new Vue({
				mixins:[],
				data(){
					return {
						selecttb:'0',
						page:1,
						perpage:15,
						kw:'',
						columns:[],
						datarows:[]
					}
				},
				el:'#app',
				methods:{
				 alert(msg){ this.$nty.alert(msg);},
			     confirm(msg){ this.$nty.confirm(msg); },
			     selecttable(){
			     	if(this.selecttb != 0) {
				     	let url ='/tlen/crud/'+this.selecttb+'/'+this.page+'/'+this.perpage+'/'+ this.kw ;
				     	axios.post(url)
						    .then((response)=>{
						       let data = response.data;
						       console.log('post-->',data)
						       this.columns = data.cols;
						       this.datarows = data.rows;
						       this.confirm('data '+ this.selecttb +' successed.')
						    })
						    .catch((error)=>{
						       this.alert(error)
						    });
			     	}
			     },
			     editrow(item){
				 	console.log('edititem=>',item)
					if (confirm("Are you sure you want to update")) {
						if(item.id) {
					     	let url ='/tlen/crud/'+this.selecttb+'/'+ item.id +'/'+this.page+'/'+this.perpage+'/'+ this.kw ;
					     	axios.put(url,item)
							    .then((response)=>{
							       let data = response.data;
							       console.log(data)
							       this.columns = data.cols;
							       this.datarows = data.rows;
							       this.confirm('update '+ this.selecttb +' successed.')
							    })
							    .catch((error)=>{
							       this.alert(error)
							    });
						} else {
				     	let url ='/tlen/crud/'+this.selecttb+'/'+ item.id +'/'+this.page+'/'+this.perpage+'/'+ this.kw ;
					     	axios.post(url,item)
							    .then((response)=>{
							       let data = response.data;
							       console.log(data)
							       this.columns = data.cols;
							       this.datarows = data.rows;
							       this.confirm('update '+ this.selecttb +' successed.')
							    })
							    .catch((error)=>{
							       this.alert(error)
							    });
						}
					}
			     },
			     deleterow(item){
			     	if (confirm("Are you sure you want to delete")) {
						let url ='/tlen/crud/'+this.selecttb+'/'+ item.id +'/'+this.page+'/'+this.perpage+'/'+ this.kw ;
			     		axios.delete(url)
						    .then((response)=>{
						       let data = response.data;
						       console.log(data)
						       this.columns = data.cols;
						       this.datarows = data.rows;
						       this.confirm('delete '+ this.selecttb +' successed.')
						    })
						    .catch((error)=>{
						       this.alert(error)
						    });
  					}
			     },
			     convertdate(datestring) {
			     	if(datestring){
			     		return datestring.replace(' ','T');
			     	} else{
			     		return	
			     	}
			     },
			     changedate(row,field,event){
			     	let newdate = event.target.value;
			     	newdate = newdate.replace('T',' ');
			     	row[field]= newdate;
			     	console.log(newdate);

			     },
			     newitem(){
			     	let o = {};
			     	this.columns.forEach((i)=>{
			     		o[i.field] = null;
			     	})
			     	this.datarows.unshift(o);
			     }

				},
				computed:{

				 },
				watch: { },
				components:{ },
				beforeCreate  () { },
				created       () { },
				beforeMount   () { },
				mounted       () {  this.$nty = new Notyf(); },
				beforeUpdate  () { },
				updated       () { },
				beforeDestroy () { },
				destroyed     () { },
				})	
		</script>
		<!-- Add this after vue.js -->
		<script src="//unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
		<script src="//unpkg.com/tether@latest/dist/js/tether.min.js"></script>
		<script src="//unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
	</body>
	</html>
	<?php }

	/**
	 * @noAuth
	 */
	public function postTestpost(){
		dump($this->post);
	}


	/**
	 * @noAuth
	 * @url GET /dbinfo
	 */
	public function dbinfo() {
		$stringtype =['char','varchar','binary','char byte','varbinary','tinyblob','blob','mediumblob','longblob','tinytext','enum','set'];
		$textareatype = ['text','mediumtext','longtext','json','row'];
		$numbertype = ['tinyint','smallint','mediumint','int','integer','bigint','decimal','dec','numeric','fixed','float','double','real','bit'];
		$chkboxtype = ['boolean'];
		$datetimetype = ['datetime','timestamp'];
		Capsule::table('dbcolumninfos')->truncate();
		$tables = Capsule::select('Show tables');
		foreach ($tables as $table) {
			echo 'Table:---------->',$table->Tables_in_dbname,'<br/>';
			$cols = Capsule::select('DESCRIBE '.$table->Tables_in_dbname);
			foreach ($cols as $col) {
				$dbinfo = new Dbcolinfo();
				$dbinfo->tbname = $table->Tables_in_dbname;
				$dbinfo->field = $col->Field;
				preg_match ('/([a-zA-Z\s]*)\((.*)\).*$/', $col->Type, $matches);
				$chktype = '';
				$chklength = 0;
				if(isset($matches[1]) && $matches[1]) {
					$chktype = $matches[1];
					$chklength = ($matches[2]?:0);
				} else {
					$chktype = $col->Type;
				}
				// dump($chktype);
				if(in_array($chktype,$datetimetype)) {
					$dbinfo->type = 'datetime';
				} else if (in_array($chktype,$numbertype)){
						$dbinfo->type = 'number';
				} else if (in_array($chktype,$chkboxtype)){
						$dbinfo->type = 'checkbox';
				} else if (in_array($chktype,$textareatype)){
						$dbinfo->type = 'textarea';
				} else {
					if($chklength > 255 ) {
						$dbinfo->type = 'textarea';
					} else {
						$dbinfo->type = 'text';
					}
				}
				// dump($dbinfo->type);
				$dbinfo->length = $chklength;
				$dbinfo->json = json_encode($col,JSON_UNESCAPED_SLASHES);
				$dbinfo->save();
				// dump($col);
				// exit();
			}
		}
		Dbcolinfo::where('field','created_by')->update(['show' => 0]);
		Dbcolinfo::where('field','updated_by')->update(['show' => 0]);
		Dbcolinfo::where('field','created_at')->update(['show' => 0]);
		Dbcolinfo::where('field','updated_at')->update(['show' => 0]);
		Dbcolinfo::where('field','deleted_at')->update(['show' => 0]);
		echo 'successed';
	}

	/**
	 * @noAuth
	 * @url GET /sysrole
	 */
	public function sysrolepermiss() {
	}


	/**
	 * @noAuth
	 * @url GET /sysrolepermiss
	 * @url POST /sysrolepermiss
	 * @url PUT /sysrolepermiss
	 * @url DEL /sysrolepermiss
	 */
	public function srolepermiss() {
		$o = new stdClass();
		$o->method = $this->server->method;
		$o->function = __FUNCTION__;
		
		switch ($this->server->method) {
			case 'GET':
				$roles = Role::where('comp_code','*********')->get();
				$o->roles = $roles;
				foreach ($o->roles as $role) {
					$role->modules = Module::get();
					foreach ($role->modules as $module) {
						$module->permission = $module->permission($role->id);
					}
				}

				break;
			case 'POST':
				# code...
				break;
			case 'PUT':
				# code...
				break;
			case 'DELETE':
				# code...
				break;
			default:
				# code...
				break;
		}
		// return $o;
		dump(json_decode(json_encode($o)));
	}



}



