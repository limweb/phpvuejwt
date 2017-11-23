<?php
use \Servit\RestServer\RestException;
use \Servit\RestServer\RestController as BaseController;
use Illuminate\Database\Capsule\Manager as Capsule;
use Lcobucci\JWT\Builder;
use Lcobucci\JWT\Parser;
use Lcobucci\JWT\Signer;
use Lcobucci\JWT\Signer\Hmac\Sha256;
use Lcobucci\JWT\Token;
use Lcobucci\JWT\ValidationData;
use Carbon\Carbon;
use \Curl\Curl;

class JwtController extends BaseController {

	/**
	 *@noAuth
	 *@url POST  /jwt/register
	 */
	public function register(){
		$user = new User();
		$user->username =  $this->post->username;
		$user->password =  $this->post->password;
		$user->save();
		return 'ok';
	}


	/**
	 *@noAuth
	 *@url POST  /jwt/auth
	 */
	public function auth(){
		try {
			$user = User::where('username',$this->post->username)->where('password',$this->post->password)->first();
			$token = '';
			if($user){
				$signer = new Sha256();
				$remotehost = $_SERVER['REMOTE_ADDR'];
				$host = $_SERVER['HTTP_HOST'];
				$now = time();
				$builder = new Builder();
				$builder->setIssuer($host) // Configures the issuer (iss claim)
				->setAudience($remotehost) // Configures the audience (aud claim)
				->setId(uuid(), true) // Configures the id (jti claim), replicating as a header item
				->setIssuedAt($now)
				->setExpiration($now + EXPTIME)
				->set('username',$user->username)
				->set('uid',$user->id)
				->set('role','admin')
		        ->set('level','1')
				->sign($signer,SECRETKEY);
				$user->refresh_token = $builder->getToken()->__toString();
				$user->expire_date = Carbon::now()->addDays(7);  //expire in 7 days
				$user->save();			
				$token =$user->refresh_token;
			}
			return $token;
		} catch (Exception $e) {
			dump($e);
		}
	}


	/**
	 *@url POST  /jwt/refresh
	 */
	public function refresh(){
		$token = $this->getBearerToken();
		$user = User::where('refresh_token',$token)->first();
		$access_token = '';
		if($user){
				$signer = new Sha256();
				$remotehost = $_SERVER['REMOTE_ADDR'];
				$host = $_SERVER['HTTP_HOST'];
				$now = time();
				$builder = new Builder();
				$builder->setIssuer($host) // Configures the issuer (iss claim)
				->setAudience($remotehost) // Configures the audience (aud claim)
				->setId(uuid(), true) // Configures the id (jti claim), replicating as a header item
				->setIssuedAt($now)
				->setExpiration($now + 60)
				->set('username',$user->username)
				->set('uid',$user->id)
				->set('level','1')
				->set('role','admin')
				->sign($signer,SECRETKEY);
				$access_token = $builder->getToken()->__toString();
		}
		return $access_token;
	}


	/**
	 *@noAuth 
	 *@url POST /jwt/logout
	 */ 
	public function logout(){
		$token = $this->getBearerToken();
		$msg = 'you logouted';
		if($token){
			$user = User::where('refresh_token',$token)->first();
			if($user){
					$user->refresh_token = null;
					$user->expire_date = null;
					$user->save();
					$msg = 'logout successed';
			}
		}
		return $msg;
	}

	/**
	 *@noAuth
	 *@url POST /logout
	 */ 
	public function logoutauth(){
		$user = User::where('username',$this->post->username)->where('password',$this->post->password)->first();
		if($user){
			$user->refresh_token = null;
			$user->expire_date = null;
			$user->save();
			// dump(toObj($user->toArray()));
		}
		return  'ok';
	}


	/**
	 *@noAuth 
	 *@url POST /jwt/revoke
	 *@Desc ไว้แถน refresh token ออกจาก database
	 */
	public function revoke(){
		$token = $this->getBearerToken();
		$msg = 'no token';
		if($token){
			$user = User::where('refresh_token',$token)->first();
				if($user){
					$user->refresh_token = null;
					$user->expire_date = null;
					$user->save();
					$msg = 'revoke successed';
				}
		}
		return $msg;
	}


	/**
	 *@url POST /microservice1
	 */
	public function service1(){
		echo 'microservice1';
	}

	/**
	 *@url POST /microservice2
	 */
	public function service2(){
		echo 'microservice2';

	}

	/**
	 *@url POST /microservice3
	 */
	public function service3(){
		echo 'microservice3';

	}

	/** 
	 * Get hearder Authorization
	 * */
	private function getAuthorizationHeader(){
		$headers = null;
		if (isset($_SERVER['Authorization'])) {
			$headers = trim($_SERVER["Authorization"]);
		}
	        else if (isset($_SERVER['HTTP_AUTHORIZATION'])) { //Nginx or fast CGI
	        	$headers = trim($_SERVER["HTTP_AUTHORIZATION"]);
	        } elseif (function_exists('apache_request_headers')) {
	        	$requestHeaders = apache_request_headers();
	            // Server-side fix for bug in old Android versions (a nice side-effect of this fix means we don't care about capitalization for Authorization)
	        	$requestHeaders = array_combine(array_map('ucwords', array_keys($requestHeaders)), array_values($requestHeaders));
	            //print_r($requestHeaders);
	        	if (isset($requestHeaders['Authorization'])) {
	        		$headers = trim($requestHeaders['Authorization']);
	        	}
	        }
	        return $headers;
	    }

	/**
	 * get access token from header
	 * */
	private function getBearerToken() {
		$headers = $this->getAuthorizationHeader();
	    // HEADER: Get the access token from the header
	    // /Bearer\s((.*)\.(.*)\.(.*))/
		if (!empty($headers)) {
			if (preg_match('/Bearer\s(\S+)/', $headers, $matches)) {
				return $matches[1];
			}
		}
		return null;
	}


}

