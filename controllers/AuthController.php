<?php
use \Jacwright\RestServer\RestException;
use \Jacwright\RestServer\RestController as BaseController;

use Lcobucci\JWT\Builder;
use Lcobucci\JWT\Parser;
use Lcobucci\JWT\Signer;
use Lcobucci\JWT\Signer\Hmac\Sha256;
use Lcobucci\JWT\Token;
use Lcobucci\JWT\ValidationData;


class  AuthController extends BaseController {

		/**
		 * @noAuth
		 */
		public function getTest($user=null,$pass=null){
			$username = 'test';
			if($user == 'admin') { $username=$user; $role = 'admin';  $level = 'FFFFFFFFFFFFFFFFFFFFFFFFFFFF'; }
			if($user == 'user')  { $username=$user; $role = 'user';  $level = 'FAFFFFFFFFFFFFFFFFFFFFFFFFFF'; }

			// $user = "";
			// $user = User::where('username','')->where('password','')->first();

			$user = new stdClass();
			$user->username = $username;
			$user->id = 1;
			$user->level = (isset($level) ?  $level : null );
			$user->role =  (isset($role) ? $role : null );

			if($username) {
				$token = $this->jwt->token($user);
	            $this->server->token = $token;
					return [
							'status' => 'success',
							'method'=> __FUNCTION__,
							'username'=>$user->username,
							'role'=>$user->role,
							'level'=> $user->level,
							'token'=> $token,
							];
			} else {
				// $this->server->handleError(404);
				throw new RestException(401, "You are not authorized to access this resource.");
			}
		}

		/**
		 * @url GET /chktoken
		 * @url OPTIONS /chktoken
		 * @url POST /chktoken
		*/
		public function chktoken() {
			$this->jwt->chkauth();
		}	


		/**
		 * @url OPTIONS /refresh
		 * @noAuth
		*/
		public function optionsRefresh(){
			return array("status" => 'success'); 
		}


		/**
		 * @url GET /refresh
		 * @url POST /refresh
		*/
		public function postRefresh() {
			$o = $this->jwt->jwtrefreshobj();
			return $o->jwt;
		}
 
		/**
		 * @url GET /login
		 * @url OPTIONS /login
		 * @noAuth
		*/
		public function getlogin() {
			return array('status' => 'success','username'=>'tlen','method'=>'get_option_login'); 
		}		
		
		/**
		 * @url POST /login
		 * @noAuth
		*/
		public function postLogin() {
			$user = $this->server->data->username;
			$pass = $this->server->data->password;
			$username = '';
			if($user == 'admin') { $username=$user; $role = 'admin';  $level = 'FFFFFFFFFFFFFFFFFFFFFFFFFFFF'; }
			if($user == 'staff') { $username=$user; $role = 'staff';  $level = 'FFFFFFFFFFFFFFFFFFFFFFFFFFFF'; }
			if($user == 'user')  { $username=$user; $role = 'user';   $level = 'FAFFFFFFFFFFFFFFFFFFFFFFFFFF'; }
			// $user = "";
			// $user = User::where('username','')->where('password','')->first();
			if($username) {
		            $now = time();
		            $remotehost = $this->server->server['REMOTE_ADDR'];
			        $builder = new Builder();
			        $builder->setIssuer($remotehost) // Configures the issuer (iss claim)
                        ->setAudience($remotehost) // Configures the audience (aud claim)
                        ->setId('4f1g23a12aa', true) // Configures the id (jti claim), replicating as a header item
			            ->setIssuedAt($now)
			            ->setExpiration($now+ EXPTIME)
			            ->set('username', $username)
			            ->set('uid',1)
			            ->set('role',$role)
			            ->set('level',$level)
			            ->sign($this->jwt->signer,SECRETKEY);
			        $this->server->token = $builder->getToken()->__toString();
					return [
							'status' => 'success',
							'method'=>'postLogin',
							'role'=>$role,
							'username'=>$user,
							'remotehost'=>$remotehost ,
							'level'=> $level,
							'jwt'=> $this->server->token,
							];
			} else {
				// $this->server->handleError(404);
				throw new RestException(401, "You are not authorized to access this resource.");
			}
		}


		/**
		 * @url GET /user
		*/
		public function user(){
			$o = new \stdClass();
			$o->username   = $this->jwt->getJwt()->getClaim('username');
			$o->uid = $this->jwt->getJwt()->getClaim('uid');
			$o->role     = $this->jwt->getJwt()->getClaim('role');
			$o->level    = $this->jwt->getJwt()->getClaim('level');
			$o->token = $this->jwt->getJwt()->__toString();
			list($header,$payload,$signature) = explode('.',$o->token);
			$o->data = base64_decode($payload);
			$o->date = date(1500551216);
			// $o->user = User::find(jwt->getJwt()->getClaim('uid'));
			return array('status' => 'success','data'=>$o); 
		}


		public function postLogout() {
		        return [
		            'status' => 'success',
		            'msg' => 'Logged out Successfully.'
		        	];
		}

	   public function tokenverify()   {
	        if ($this->useJwt && $this->token) {
	            return $this->token->verify($this->signer, $this->publicKey);
	        } else {
	            return false;
	        }
	    }

	    protected function jwtchk()
	    {
	        if ($this->useJwt) {
	            $data = new ValidationData(); // It will use the current time to validate (iat, nbf and exp)
	            $data->setIssuer($_SERVER['REMOTE_ADDR']);
	            $data->setAudience($_SERVER['REMOTE_ADDR']);
	            $data->setId($this->secretKey);
	            if ($this->token) {
	                return $this->token->validate($data); // true, because validation information is equals to data contained on the token
	            } else {
	                if (isset($_COOKIE['authorised'])) {
	                    $token = $_COOKIE['authorised'];
	                    $this->token = ( new Parser() )->parse($token); // Parses from a string
	                    $this->token->getHeaders(); // Retrieves the token header
	                    $this->token->getClaims(); // Retrieves the token claims
	                    return $this->token->validate($data); // true, because validation information is equals to data contained on the token
	                } else {
	                    return false;
	                }
	            }
	        } else {
	            return false;
	        }
	    }

	    protected function updateJwtcookie()
	    {
	        if (isset($_COOKIE['authorised'])) {
	            $username = $this->token->getClaim('username');
	            ( !empty($username) ? $this->setJwt($username) : null );  //change if custome
	        }
	    }


}
