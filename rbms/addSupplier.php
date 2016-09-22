<?php
	include("conn.php");
	$sid=$_GET['sid'];
	$sname=$_GET['sname'];
	$city=$_GET['city'];
	$phone=$_GET['phone'];

	$query="call add_suppliers('$sid','$sname','$city','$phone',@message);";

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
	echo "<td>".htmlspecialchars($sid)."</td>";
	echo "<td>".htmlspecialchars($sname)."</td>";
	echo "<td>".htmlspecialchars($city)."</td>";
	echo "<td>".htmlspecialchars($phone)."</td>";
?>