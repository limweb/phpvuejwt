<?php
use Servit\RestServer\ThemeController;
use Servit\RestServer\Exception;

class AdminlteController extends ThemeController {
	  
	  protected $theme = 'admin';

	  public function __construct(){
	  	$this->themepath = __DIR__;
	  	parent::__construct();
	  }

	  public function __destruct() {
	  	parent::__destruct();
	  }

	  /**
	   *@noAuth
	   *@url GET /
	   */
	  public function index() {
	  	    $breadcrumb = $this->breadcrumb();
			echo '<div class="content-wrapper" >
				    <section class="content-header">
				      <h1>
				        Page Header
				        <small>Optional description</small>
				      </h1>
				      '.$breadcrumb.'
				    </section>
				    <section class="content container-fluid">
							<h1>test</h1>
				    </section>
			  </div>
			  ';
	  }

}