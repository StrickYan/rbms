<?php
	include("conn.php");
	$pid=$_GET[pid];
	$pname=$_GET[pname];
	$qoh=$_GET[qoh];
	$qoh_threshold=$_GET[qoh_threshold];
	$original_price=$_GET[original_price];
	$discnt_rate=$_GET[discnt_rate];
	$sid=$_GET[sid];

	$query="call add_product('$pid','$pname',$qoh,$qoh_threshold,$original_price,$discnt_rate,'$sid',@message);";

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
	echo "<td>".htmlspecialchars($pid)."</td>";
	echo "<td>".htmlspecialchars($pname)."</td>";
	echo "<td>".htmlspecialchars($qoh)."</td>";
	echo "<td>".htmlspecialchars($qoh_threshold)."</td>";
	echo "<td>".htmlspecialchars($original_price)."</td>";
	echo "<td>".htmlspecialchars($discnt_rate)."</td>";
	echo "<td>".htmlspecialchars($sid)."</td>";
?>