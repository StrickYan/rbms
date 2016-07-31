<?php
	include("conn.php");
	$eid=$_GET[eid];
	$ename=$_GET[ename];
	$city=$_GET[city];

	$query="call add_employees('$eid','$ename','$city',@message);";

	$db->query($query);
	$result = $db->query('select @message as message;');
	$number_results=$result->num_rows;
	if($number_results){
		$row=$result->fetch_assoc();
		$message=stripslashes($row['message']);	
		if($message!="Insert sucessed."){
			echo "<td class='errorMessage' colspan='7' style='background:rgb(111,111,111);color:white;'>".$message."</td>";
			return;
		}
	}
	//添加成功返回数据
	echo "<td>".htmlspecialchars($eid)."</td>";
	echo "<td>".htmlspecialchars($ename)."</td>";
	echo "<td>".htmlspecialchars($city)."</td>";
?>