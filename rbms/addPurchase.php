<?php
	include("conn.php");
	$pur=$_GET['pur'];
	$cid=$_GET['cid'];
	$eid=$_GET['eid'];
	$pid=$_GET['pid'];
	$qty=$_GET['qty'];

	$query="call add_purchase('$pur','$cid','$eid','$pid',$qty,@message,@price);";
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
	$result = $db->query('select @price as price;');
	$number_results=$result->num_rows;
	if($number_results){
		$row=$result->fetch_assoc();
		$price=stripslashes($row['price']);
		date_default_timezone_set('Asia/Shanghai'); 
		echo "<td>".htmlspecialchars($pur)."</td>";
		echo "<td>".htmlspecialchars($cid)."</td>";
		echo "<td>".htmlspecialchars($eid)."</td>";
		echo "<td>".htmlspecialchars($pid)."</td>";
		echo "<td>".htmlspecialchars($qty)."</td>";
		echo "<td>".date("Y-m-d H:i:s")."</td>";
		echo "<td>".htmlspecialchars($price)."</td>";
	}

	$result = $db->query('select @cur_qoh_msg as cur_qoh_msg;');
	$number_results=$result->num_rows;
	if($number_results){
		$row=$result->fetch_assoc();
		$cur_qoh_msg=stripslashes($row['cur_qoh_msg']);
		echo "<div class='qohMessage' style='position:fixed;right:50px;top:66px;text-align:left;color:rgb(230,98,82);z-index:2;'>".$cur_qoh_msg.".<br>";
	}
	$result = $db->query('select @inc_qoh_msg as inc_qoh_msg;');
	$number_results=$result->num_rows;
	if($number_results){
		$row=$result->fetch_assoc();
		$inc_qoh_msg=stripslashes($row['inc_qoh_msg']);
		echo $inc_qoh_msg.".</div>";
	}
?>