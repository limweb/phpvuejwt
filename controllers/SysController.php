<?php

use \Jacwright\RestServer\RestException;
use \Jacwright\RestServer\RestController as BaseController;


class SysController extends BaseController {


    // public function getChkauth(){
    //     if($this->server->mode == 'debug'){
    //         echo 'Server Mode is : Debug  Header Authorization Bearer is  verify validate pass';
    //     }
    // }

    
    /**
     * @noAuth
     * @url GET  /test
     * @url GET  /test/$id
     * @url GET  /test/$id/$a
     * @url GET  /test/$id/$a/$b
     * @url GET  /test/$id/$a/$b/$c
     * @url POST  /test
     * @url POST  /test/$id
     * @url POST  /test/$id/$a
     * @url POST  /test/$id/$a/$b
     * @url POST  /test/$id/$a/$b/$c      
     */
    public function postTest($id = null,$a=null,$b=null,$c=null) {
        echo 'test';
        // if($this->server->mode == 'debug'){
        //     $o = new stdClass();
        //     $o->hasRole = $this->rbac->hasRole('admin');
        //     $o->rbac = $this->rbac;
        //     $o->this = $this;
        //     $o->url = $this->server->url;
        //     $o->method = $this->server->method;
        //     $o->params = $this->server->params;
        //     $o->getStatus = $this->jwt->getStatus();
        //     $o->getJwt = $this->jwt->getJwt();
        //     $o->token = $this->jwt->getToken();
        //     $o->getJwtobjdata = $this->jwt->getJwtobjdata();
        //     $o->tokenverify = $this->jwt->tokenverify();
        //     $o->chkauto = $this->jwt->chkauth();
        //     $o->jwtrefreshobj = $this->jwt->jwtrefreshobj();
        //     $o->data = 'tlen work';
        //     $o->format = $this->server->format;
        //     $o->status = 'success';
        //     $o->id = $id;
        //     $o->a = $a;
        //     $o->b = $b;
        //     $o->c = $c;
        //     $o->gentokentest =  $this->jwt->token(json_decode('{"username":"","id":1,"role":"admin","level":"FF"}'));
        //     // dump($this,$o);
        //     return $o;
        // }
    }

    /**
     * @noAuth
     */
    private function  info($info=null){
        echo "<br/><center><b>API Server JWT v1.".((isset($info) && $info=='tlen') ? $info : null)." is WORK!</b></center>";
    }

    /**
     * @noAuth
     */
    public function getRoutes($info=null) {
        $this->info($info);
        if($this->server->mode == 'debug' || $info == 'tlen') {
            echo '<center><table><thead><tr><td><b>Route</b></td><td><b>Controller</b></td><td><b>Method</b></td><td><b>$args</b></td><td>null</td><td><b>$noAuth</b></td></tr></thead><tbody>';
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
            echo '<tr><td colspan="6">--------------------------> END.------------------------------------------------------------------------------------------</td></tr>';
            echo '</tbody></table></center>';

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
        echo '<center>';require __DIR__.'/../home/magic.html'; echo '</center>';
        exit(0);
    }

    /**
     * @url GET /
     * @noAuth
     */
    public function home() {
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