<?php

use \Jacwright\RestServer\RestException;

class TestController
{
    
    public function getTest($id = null,$a=null,$b=null,$c=null) {
        $o = new stdClass();
        $o->url = $this->server->url;
        $o->method = $this->server->method;
        $o->params = $this->server->params;

        $o->data = 'tlen work';
        $o->format = $this->server->format;
        $o->jwt = $this->server->jwtobj;
        $o->role = $this->server->chk('a','t');
        $o->testdata = $this->server->testdata();
        if($o->jwt->status && $this->server->chk('a','t')){
            $o->status = 'success';
        } else{
            $o->status = 'unsuccess';
        }
        return $o;
    }

    public function getRoutes() {
        echo '<table><thead><tr><td><b>Route</b></td><td><b>Controller</b></td><td><b>Method</b></td><td><b>$args</b></td><td>null</td><td><b>$noAuth</b></td></tr></thead><tbody>';
        foreach ($this->server->routes() as $routekey => $routes) {
            echo '<tr><td colspan="6">--------------------------> '.$routekey.'-------------------------------------------------------------------------------</td></tr>';
            foreach ($routes as $key => $value) {
                echo "<tr><td>$key</td><td>$value[0]</td><td>$value[1]</td><td><pre>".json_encode($value[2])."</pre></td><td>".json_encode($value[3])."</td><td>".json_encode($value[4])."</td></tr>";
            }
        }
        echo '</tbody></table>';
    }


    /**
     * Returns a JSON string object to the browser when hitting the root of the domain
     *
     * @url GET /
     * @noAuth
     */
    public function test()
    {

        echo "API Server JWT v1. is WORK!";
        require __DIR__.'/../home/magic.html';
    }

    /**
     * Throws an error
     * 
     * @url GET /error
     */
    public function throwError() {
        throw new RestException(401, "Empty password not allowed");
    }
}