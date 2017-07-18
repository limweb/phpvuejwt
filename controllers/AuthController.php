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


		public function getTest($user,$pass){
			$username;
			if($user == 'admin') { $username=$user; $role = 'admin';  $level = 'FFFFFFFFFFFFFFFFFFFFFFFFFFFF'; }
			if($user == 'user')  { $username=$user; $role = 'user';  $level = 'FAFFFFFFFFFFFFFFFFFFFFFFFFFF'; }
			// $user = "";
			// $user = User::where('username','')->where('password','')->first();
			if($username) {
		            $now = time();
		            $host = $this->server->server['REMOTE_ADDR'];
			        $builder = new Builder();
			        $builder->setIssuer($host) // Configures the issuer (iss claim)
                        ->setAudience($host) // Configures the audience (aud claim)
                        ->setId('4f1g23a12aa', true) // Configures the id (jti claim), replicating as a header item
			            ->setIssuedAt($now)
			            ->setExpiration($now+$this->server->exptime)
			            // ->setNotBefore($now + 60)
			            ->set('username', $username)
			            ->set('uid',1)
			            ->set('role',$role)
			            ->set('level',$level)
			            ->sign($this->server->signer, $this->server->secretKey);
			        $this->server->token  = $builder->getToken();
					return [
							'status' => 'success',
							'method'=>'postLogin',
							'role'=>$role,
							'username'=>$user,
							'host'=>$host ,
							'level'=> $level,
							'jwt'=> $this->server->token->__toString(),
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
		 * @noAuth
		*/
		public function chktoken() {
			$o = new stdClass();
			$o->status =  false;
			$o->verify = false;
			$token = $this->server->token;
			if($token) {
				$host = $this->server->server['REMOTE_ADDR'];
		    	$token = (new Parser())->parse($token);
				$o->verify = $token->verify($this->server->signer, $this->server->secretKey);
				if($o->verify){
				    $validationData = new ValidationData();
				    $validationData->setIssuer($host);
				    $validationData->setAudience($host);
				    $validate = $token->validate($validationData);
				    $o->status =  $validate;
					list($header, $payload, $signature) = explode(".", $token);
					$o->header =  json_decode(base64_decode($header));
					$o->payload = json_decode(base64_decode($payload));
				}
			}
			return $o;
		}	


		/**
		 * @url GET /refresh
		 * @url OPTIONS /refresh
		 * @noAuth
		*/
		public function optionsRefresh(){
			return array("status" => 'success'); 
		}


		/**
		 * @url POST /refresh
		 * @noAuth
		*/
		public function postRefresh() {
			$token = $this->server->token;
			$o = new stdClass();
			if($token){
				$host = $this->server->server['REMOTE_ADDR'];
				$now = time();
				$token = (new Parser())->parse($token);
				$data = new ValidationData();
				$o->status = $token->validate($data);
				if($o->status){
			        $builder = new Builder();
			        $builder->setIssuer($host) // Configures the issuer (iss claim)
	                    ->setAudience($host) // Configures the audience (aud claim)
	                    ->setId('4f1g23a12aa', true) // Configures the id (jti claim), replicating as a header item
			            ->setIssuedAt($now)
			            ->setExpiration($now+$this->server->exptime)
				            ->set('username',$token->getClaim('username'))
				            ->set('uid',$token->getClaim('uid'))
				            ->set('role',$token->getClaim('role'))
				            ->set('level',$token->getClaim('level'))
				           ->sign($this->server->signer, $this->server->secretKey);
				  	$this->server->token  = $builder->getToken();
				  	$o->jwt = $this->server->token->getPayload();
				}
			}
			return $o;
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
			$user = $this->server->data->username;
			$pass = $this->server->data->password;
			$username;
			if($user == 'admin') { $username=$user; $role = 'admin';  $level = 'FFFFFFFFFFFFFFFFFFFFFFFFFFFF'; }
			if($user == 'user')  { $username=$user; $role = 'user';  $level = 'FAFFFFFFFFFFFFFFFFFFFFFFFFFF'; }
			// $user = "";
			// $user = User::where('username','')->where('password','')->first();
			if($username) {
		            $now = time();
		            $host = $this->server->server['REMOTE_ADDR'];
			        $builder = new Builder();
			        $builder->setIssuer($host) // Configures the issuer (iss claim)
                        ->setAudience($host) // Configures the audience (aud claim)
                        ->setId('4f1g23a12aa', true) // Configures the id (jti claim), replicating as a header item
			            ->setIssuedAt($now)
			            ->setExpiration($now+$this->server->exptime)
			            // ->setNotBefore($now + 60)
			            ->set('username', $username)
			            ->set('uid',1)
			            ->set('role',$role)
			            ->set('level',$level)
			            ->sign($this->server->signer, $this->server->secretKey);
			        $this->server->token  = $builder->getToken();
					return [
							'status' => 'success',
							'method'=>'postLogin',
							'role'=>$role,
							'username'=>$user,
							'host'=>$host ,
							'level'=> $level,
							'jwt'=> $this->server->token->__toString(),
							];
			} else {
				// $this->server->handleError(404);
				throw new RestException(401, "You are not authorized to access this resource.");
			}
		}

		public function user(){

			// $token = $this->server->token;
			// consolelog('usertoken-->',$token);
			// try {
			//     $token = (new Parser())->parse($token);
			//   } catch (Exception $exception) {
			//     return false;
			//   }

			//   $validationData = new ValidationData();
			//   $validationData->setIssuer('JWT Example');
			//   $validationData->setAudience('JWT Example');

			//   return $token->validate($validationData);

			$o = new stdClass();
			$jwt = $this->chktoken();

			$o->username = $jwt->username;
			$o->role = $jwt->role;
			$o->level = $jwt->level;
			return array('status' => 'success','data'=>$o); 
			// return array('status' => 'success'); 
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
