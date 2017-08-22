<?php
	@ $db=new mysqli('localhost','root','','rbms');
	//mysql_query("set names utf8");
	$db->query("set names utf8");
	if(mysqli_connect_error()){
		echo "无法连接上数据库";
		exit;
	}
?>