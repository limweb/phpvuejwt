<?php

use \Jacwright\RestServer\RestException;
use \Jacwright\RestServer\RestController as BaseController;


class SysController extends BaseController {
    
    /**
     * @noAuth
     */
    public function getTest($id = null,$a=null,$b=null,$c=null) {
        $o = new stdClass();
        // dump($this->rbac);
        $o->hasRole = $this->rbac->hasRole('admin');
        $o->rbac = $this->rbac;
        $o->this = $this;
        // $o->url = $this->server->url;
        // $o->method = $this->server->method;
        // $o->params = $this->server->params;
        // $o->token = $this->jwt->getToken();
        // $o->tokenverify = $this->jwt->tokenverify();
        // $o->chkauto = $this->jwt->chkauth();
        $o->data = 'tlen work';
        // $o->format = $this->server->format;
        $o->status = 'success';
        return $o;
    }

    /**
     * @noAuth
     */
    private function  info($info=null){
        echo "<br/><center><b>API Server JWT v1.".((isset($info) && $info=='tlen') ? $info : null)." is WORK!</b></cener>";
    }

    /**
     * @noAuth
     */
    public function getRoutes($info=null) {
        $this->info($info);
        if($this->server->mode == 'debug' || $info == 'tlen') {
            echo '<table><thead><tr><td><b>Route</b></td><td><b>Controller</b></td><td><b>Method</b></td><td><b>$args</b></td><td>null</td><td><b>$noAuth</b></td></tr></thead><tbody>';
            foreach ($this->server->routes() as $routekey => $routes) {
                echo '<tr><td colspan="6">--------------------------> '.$routekey.'-------------------------------------------------------------------------------</td></tr>';

                switch ($routekey) {
                    case 'GET':
                        foreach ($routes as $key => $value) {
                            echo "<tr><td>".($routekey =='GET' ? '<a href="http://'.$_SERVER['HTTP_HOST'].'/'.$key.'">'.( empty($key) ? '/' : $key ).'</a>'    : $key)."</td><td>$value[0]</td><td>$value[1]</td><td><pre>".json_encode($value[2])."</pre></td><td>".json_encode($value[3])."</td><td>".json_encode($value[4])."</td></tr>";
                        }
                        break;
                    case 'POST':
                    case 'OPTIONS':
                    default:
                        foreach ($routes as $key => $value) {
                            echo "<tr><td style='cursor:pointer;' onclick='alert(\"".$key."\")'>$key</td><td>$value[0]</td><td>$value[1]</td><td><pre>".json_encode($value[2])."</pre></td><td>".json_encode($value[3])."</td><td>".json_encode($value[4])."</td></tr>";
                        }
                        break;
                }


            }
            echo '</tbody></table>';
        }
        exit(0);
    }


    /**
     * @noAuth
     */
    public function getServerinfo($info=null,$show=null) {
        $this->info($info);
        if($this->server->mode == 'debug' || $info == 'tlen'){
            dump($this);
            if($info=='tlen' && $show){
                phpinfo();
            }

        }
        exit(0);
    }

    /**
     * @url GET /info
     * @noAuth
     */
    public function homeinfo($info=null)   {
        $this->info($info);
        require __DIR__.'/../home/magic.html';
        exit(0);
    }

    /**
     * @url GET /
     * @noAuth
     */
    public function test()
    {
        // $this->info();
        // require __DIR__.'/../home/magic.html';
        // require __DIR__.'/../page/app.php';
        require __DIR__.'/../index.html';
        exit(0);
    }

    /**
     * Throws an error
     * @noAuth
     * @url GET /error
     */
    public function throwError() {
        throw new RestException(401, "Empty password not allowed");
    }
}