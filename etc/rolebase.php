<?php
function chk($module=null,$action=null){
	$chk = 1;
	$str = 'FAFFFFFFFFFFFFFFFFFFFFFFFFFF';
	$ls = explode(':',chunk_split($str,2,':'));
	$actions = ['r','c','u','d','p','e','a','t'];
	$modules = ['a','b','c'];
	$m = array_search($module,$modules); 
	(is_numeric($m) ? null : $chk = 0 );
	$levelhx = $ls[$m];
	$level = base_convert($levelhx,16,2);
	$a = array_search($action,$actions);
	(is_numeric($a) ? null : $chk = 0 );
	return ($chk ? $level[$a] : 0 );
}

// $actions = ['r','c','u','d','p','e','a','t'];
echo chk();
// let str = 'FFFFFFFFFFFFFFFFFFFFFFFFFFFF';
// let roles = str.match(/.{1,2}/g))
// var page_id = 4
// var level = roles[page_id];
// accessible = !!(level & 1 << (page_id - 1));
?>

