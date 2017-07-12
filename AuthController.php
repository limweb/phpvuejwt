<?php
use \Jacwright\RestServer\RestException;
use Lcobucci\JWT\Builder;
use Lcobucci\JWT\Parser;
use Lcobucci\JWT\Signer;
use Lcobucci\JWT\Signer\Hmac\Sha256;
use Lcobucci\JWT\Token;
use Lcobucci\JWT\ValidationData;

class  AuthController {

		/**
		 * @url GET /refresh
		 * @url OPTIONS /refresh
		 * @noAuth
		*/
		public function optionsRefresh(){
			return array("status" => 'success'); 
		}

		// public function authorize(){
		// 	error_log('authorize');
		// }

		/**
		 * @url GET /login
		 * @url OPTIONS /login
		 * @noAuth
		*/
		public function login() {
			error_log('/login at get and options');
			return array('status' => 'success','username'=>'tlen','method'=>'get_option_login'); 
		}		
		
		/**
		 * @url POST /login
		*/
		public function postLogin() {
			$user = "tlen";
			// $user = "";
			// $user = User::where('username','')->where('password','')->first();
			if($user) {
		            $now         = time();
			        consolelog($this->server->data);
			        $builder = new Builder();
			        $builder
			            ->setIssuedAt($now)
			            ->setExpiration($now+$this->server->exptime)
			            ->set('username', $user)
			            ->set('uid',1)
			            ->set('role','admin')
			            ->sign($this->server->signer, $this->server->secretKey);
			        $this->server->token  = $builder->getToken();
					consolelog('-----login post--------------');
					return array('status' => 'success','method'=>'postLogin');
			} else {
				// $this->server->handleError(404);
				throw new RestException(401, "You are not authorized to access this resource.");
			}
		}

		public function user(){
			$o = new stdClass();
			$o->username = 'tlen';
			$o->role = 'admin';
			return array('status' => 'success','data'=>$o); 
		}


		public function postLogout() {
		        return [
		            'status' => 'success',
		            'msg' => 'Logged out Successfully.'
		        	];
		}
}
