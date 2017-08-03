<?php


function tree(&$role) {
    $role->permissions;
    foreach($role->children as $children) {
      tree($children);  
    }
}

function uuid($serverID=1)
{
    $t=explode(" ",microtime());
    return sprintf( "%04x-%08s-%08s-%04s-%04x%04x",
        $serverID,
        clientIPToHex(),
        substr("00000000".dechex($t[1]),-8),   // get 8HEX of unixtime
        substr("0000".dechex(round($t[0]*65536)),-4), // get 4HEX of microtime
        mt_rand(0,0xffff), mt_rand(0,0xffff));
}

function clientIPToHex($ip="") {
    $hex="";
    if($ip=="") $ip=getEnv("REMOTE_ADDR");
    $part=explode(".", $ip);
    for ($i=0; $i<=count($part)-1; $i++) {
        $hex.=substr("0".dechex($part[$i]),-2);
    }
    return $hex;
}

function clientIPFromHex($hex) {
    $ip="";
    if(strlen($hex)==8) {
        $ip.=hexdec(substr($hex,0,2)).".";
        $ip.=hexdec(substr($hex,2,2)).".";
        $ip.=hexdec(substr($hex,4,2)).".";
        $ip.=hexdec(substr($hex,6,2));
    }
    return $ip;
}

if ( ! function_exists( 'implodeKV' ) && ! function_exists('consolelog') ) {

    function implodeKV($glueKV, $gluePair, $KVarray)  {
        if( is_object($KVarray) ) {
           $KVarray = json_decode(json_encode($KVarray),TRUE);
        }
        $t = array();
        foreach($KVarray as $key=>$val) {
            if(is_array($val)){
               $val = implodeKV(':',',',$val);
            }else if( is_object($val)){
                $val = json_decode(json_encode($val),TRUE);
                $val = implodeKV(':',',',$val);
            }

            if(is_int($key)){
                $t[] = $val;
            } else {
                $t[] = $key . $glueKV . $val;
            }
        }
        return implode($gluePair, $t);
    }


function consolelog($status = 200)  {
    if( DEBUG ){
        
        $lists = func_get_args();
        $status = '';
        $status = implodeKV( ':' , ' ' , $lists);
  
       if(isset($_SERVER["REMOTE_ADDR"]) && !empty($_SERVER["REMOTE_ADDR"])){
          $raddr =$_SERVER["REMOTE_ADDR"];
       } else {
          $raddr = '127.0.0.1';
       }

       if(isset($_SERVER["REMOTE_PORT"]) && !empty($_SERVER["REMOTE_PORT"])){
          $rport = $_SERVER["REMOTE_PORT"];
       } else {
          $rport = '8000';
       }

       if(isset($_SERVER["REQUEST_URI"]) && !empty($_SERVER["REQUEST_URI"])){
          $ruri = $_SERVER["REQUEST_URI"];
       } else {
          $ruri = '/console';
       }

       file_put_contents("php://stdout",
           sprintf("[%s] %s:%s [%s]:%s \n",
               date("D M j H:i:s Y"),
               $raddr,$rport,
               $status,
               $ruri
               )
           );
   }

  }  // end-of-consolelog

} // end-of-check funtion exist

function toObj($var){
    return  json_decode(json_encode($var),FALSE);
}

function toArray($var){
    return  json_decode(json_encode($var),TRUE);
}

function converdate($date){
    if($date == 'Present') return $date;
    $de = new DateTime($date);
    return $de->format('M d, Y');    
}