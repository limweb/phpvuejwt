<?php
use \Servit\RestServer\RestException;
use Servit\RestServer\ThemeController;
use \Servit\Libs\Request;
class ErrorController extends ThemeController {

	protected $theme = 'admin';

	public function __construct(){
		$this->themepath = __DIR__;
		parent::__construct();
	}


	public function handle404(){
		$this->get_header();
		require_once __DIR__.'/../errors/404.php';
	}

	public function handle401(){
		$this->get_header();
		require_once __DIR__.'/../errors/401.php';
	}

}
