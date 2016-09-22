<?php
	include("conn.php");
	$cid=$_GET['cid'];
	$cname=$_GET['cname'];
	$city=$_GET['city'];

	$query="call add_customers('$cid','$cname','$city',@message);";

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
	echo "<td>".htmlspecialchars($cid)."</td>";
	echo "<td>".htmlspecialchars($cname)."</td>";
	echo "<td>".htmlspecialchars($city)."</td>";
	echo "<td>0</td>";
	echo "<td></td>";
?>