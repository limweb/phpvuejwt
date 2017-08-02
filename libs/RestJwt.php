<?php
namespace Jacwright\RestServer;
use Lcobucci\JWT\Signer\Hmac\Sha256;
use Lcobucci\JWT\Signer;
use Lcobucci\JWT\Parser;
use Lcobucci\JWT\ValidationData;
use Lcobucci\JWT\Builder;
use Lcobucci\JWT\Token;

class RestJwt {

	private $token = null; // String   header.palyload.signature
	public $signer=null ; //obj of Lcobucci\JWT\Signer
	private $jwt = null;  //obj of Lcobucci\JWT\Token;

	public function __construct() {
		$this->signer = new Sha256();
		$this->token = $this->getBearerToken();
		$this->jwtobj();
	}


	 // return  String   header.palyload.signature
	public function getToken() {
		return $this->token;
	}

	//retrun obj of Lcobucci\JWT\Token;
	public function getJwt() {
		if($this->jwt) return $this->jwt;
		return null;
	}

	/***---- gen token for jwt ----
		{ 
			username: '',
			uid: 1 ,
			role: 'admin',
			level: 'FF'
		}
	*/	
	public function token($user=null) {
		if($user) {
		 	$now = time();
		    $remotehost = $_SERVER['REMOTE_ADDR'];
			$builder = new Builder();
			$builder->setIssuer($remotehost) // Configures the issuer (iss claim)
                    ->setAudience($remotehost) // Configures the audience (aud claim)
                    ->setId('4f1g23a12aa', true) // Configures the id (jti claim), replicating as a header item
			        ->setIssuedAt($now)
			        ->setExpiration($now + EXPTIME)
		            ->set('username', $user->username)
		            ->set('uid',$user->id)
		            ->set('role',$user->role)
		            ->set('level',$user->level)
		            ->sign($this->signer, SECRETKEY);
	        return $builder->getToken()->__toString();
		} return null;
	}

	// get old token  and gen new token for add time  
	// return payload headr.paylaod.sginer
	public function jwtrefreshobj() {
			$o = new \stdClass();
			$o->verify = $this->tokenverify();
			$o->status  = $this->chkauth();
			$remotehost = $_SERVER['REMOTE_ADDR'];
			$now = time();
			if($o->status && $o->verify){
				$builder = new Builder();
				$builder->setIssuer($remotehost) // Configures the issuer (iss claim)
				->setAudience($remotehost) // Configures the audience (aud claim)
				->setId('4f1g23a12aa', true) // Configures the id (jti claim), replicating as a header item
				->setIssuedAt($now)
				->setExpiration($now + EXPTIME)
				->set('username',$this->jwt->getClaim('username'))
				->set('uid',$this->jwt->getClaim('uid'))
				->set('role',$this->jwt->getClaim('role'))
				->set('level',$this->jwt->getClaim('level'))
				->sign($this->signer,SECRETKEY);
				$this->server->token  = $builder->getToken()->__toString();
				$o->token = $builder->getToken()->__toString();
				$o->jwt = $this->server->token;
			}
			return $o;
	}

	//---- chk for verify signer and validate data  all pass --- 
	// return true/false
	public function chkauth() {
		$o = new \stdClass();
		$o->status =  false;
		$o->verify = false;
		if($this->jwt) {
			$remotehost = $_SERVER['REMOTE_ADDR'];
			$o->verify = $this->jwt->verify($this->signer, SECRETKEY);
			if($o->verify){
			    $validationData = new ValidationData();
			    $validationData->setIssuer($remotehost);
			    $validationData->setAudience($remotehost);
			    $validate = $this->jwt->validate($validationData);
			    $o->status =  $validate;
				// list($header, $payload, $signature) = explode(".", $token);
				// $o->header =  json_decode(base64_decode($header));
				// $o->payload = json_decode(base64_decode($payload));
			}
		}
		if($o->status){
			return $o->status;
		} else {
			throw new RestException(401, "xxYou are not authorized to access this resource.");
		}
	}	

	//---- verify from token payload check signer only ----
	// return true/false
	public function tokenverify()   {
		if ($this->token) {
			$token = (new Parser())->parse($this->token);
			return $token->verify($this->signer,SECRETKEY);
		} else {
			return false;
		}
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


	//---- gen  Lcobucci\JWT\Token; obj form toekn
	private function jwtobj() {
		$remotehost = $_SERVER['REMOTE_ADDR'];
		if($this->token){
		    $token = (new Parser())->parse($this->token);
		    $verify = $token->verify($this->signer,SECRETKEY);
			if($verify) {
			    $validationData = new ValidationData();
			    $validationData->setIssuer($remotehost);
			    $validationData->setAudience($remotehost);
			    $validate = $token->validate($validationData);
				if($validate) $this->jwt = $token;
			}
		}
	}

}