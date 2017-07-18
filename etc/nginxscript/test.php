<?php
require_once __DIR__.'/../vendor/autoload.php';
echo '<table border="1">';
echo '<tr><th>KEY</th><th>Value</th></tr>';
echo '<tr><td>HTTP_HOST</td><td>'.$_SERVER['HTTP_HOST'].'</td></tr>';
echo '<tr><td>SCRIPT_FILENAME</td><td>'.$_SERVER['SCRIPT_FILENAME'].'</td></tr>';
echo '<tr><td>PATH_INFO</td><td>'.$_SERVER['PATH_INFO'].'</td></tr>';
echo '<tr><td>SERVER_NAME</td><td>'.$_SERVER['SERVER_NAME'].'</td></tr>';
echo '<tr><td>SERVER_PORT</td><td>'.$_SERVER['SERVER_PORT'].'</td></tr>';
echo '<tr><td>SERVER_ADDR</td><td>'.$_SERVER['SERVER_ADDR'].'</td></tr>';
echo '<tr><td>REMOTE_PORT</td><td>'.$_SERVER['REMOTE_PORT'].'</td></tr>';
echo '<tr><td>REMOTE_ADDR</td><td>'.$_SERVER['REMOTE_ADDR'].'</td></tr>';
echo '<tr><td>SERVER_SOFTWARE</td><td>'.$_SERVER['SERVER_SOFTWARE'].'</td></tr>';
echo '<tr><td>GATEWAY_INTERFACE</td><td>'.$_SERVER['GATEWAY_INTERFACE'].'</td></tr>';
echo '<tr><td>REQUEST_SCHEME</td><td>'.$_SERVER['REQUEST_SCHEME'].'</td></tr>';
echo '<tr><td>SERVER_PROTOCOL</td><td>'.$_SERVER['SERVER_PROTOCOL'].'</td></tr>';
echo '<tr><td>DOCUMENT_ROOT</td><td>'.$_SERVER['DOCUMENT_ROOT'].'</td></tr>';
echo '<tr><td>DOCUMENT_URI</td><td>'.$_SERVER['DOCUMENT_URI'].'</td></tr>';
echo '<tr><td>REQUEST_URI</td><td>'.$_SERVER['REQUEST_URI'].'</td></tr>';
echo '<tr><td>SCRIPT_NAME</td><td>'.$_SERVER['SCRIPT_NAME'].'</td></tr>';
echo '<tr><td>REQUEST_METHOD</td><td>'.$_SERVER['REQUEST_METHOD'].'</td></tr>';
echo '<tr><td>QUERY_STRING</td><td>'.$_SERVER['QUERY_STRING'].'</td></tr>';
echo '<tr><td>FCGI_ROLE</td><td>'.$_SERVER['FCGI_ROLE'].'</td></tr>';
echo '<tr><td>PHP_SELF</td><td>'.$_SERVER['PHP_SELF'].'</td></tr>';
echo '</table>';
dump($_SERVER);
?>