<?php
	include("conn.php");
	$table=$_GET[table];
	//echo $table;
	$query="call show_table('$table');";
	$result=$db->query($query);
	$number_results=$result->num_rows;
	if($number_results){
		echo "<table width=\"100%\" cellpadding=\"1\" cellspacing=\"0\">";
		if($table=="suppliers"){
			echo "<tr align=\"center\">
				<td>SID</td>
				<td>SNAME</td>
				<td>CITY</td>
				<td>TELEPHONE_NO</td>
			<tr>";
			for($i=0;$i<$number_results;$i++){
				$row=$result->fetch_assoc();
				$sid=htmlspecialchars(stripslashes($row['sid']));
				$sname=htmlspecialchars(stripslashes($row['sname']));
				$city=htmlspecialchars(stripslashes($row['city']));
				$telephone=htmlspecialchars(stripslashes($row['telephone_no']));
				echo "<tr align=\"center\">";
				echo "<td>".$sid."</td>";
				echo "<td>".$sname."</td>";
				echo "<td>".$city."</td>";
				echo "<td>".$telephone."</td>";
				echo "</tr>";
			}
		}
		else if($table=="products"){
			echo "<tr align=\"center\">
				<td>PID</td>
				<td>PNAME</td>
				<td>QOH</td>
				<td>QOH_THRESHOLD</td>
				<td>ORIGINAL_PRICE</td>
				<td>DISCNT_RATE</td>
				<td>SID</td>
			<tr>";
			for($i=0;$i<$number_results;$i++){
				$row=$result->fetch_assoc();
				$pid=htmlspecialchars(stripslashes($row['pid']));
				$pname=htmlspecialchars(stripslashes($row['pname']));
				$qoh=htmlspecialchars(stripslashes($row['qoh']));
				$qoh_threshold=htmlspecialchars(stripslashes($row['qoh_threshold']));
				$original_price=htmlspecialchars(stripslashes($row['original_price']));
				$discnt_rate=htmlspecialchars(stripslashes($row['discnt_rate']));
				$sid=htmlspecialchars(stripslashes($row['sid']));
							
				echo "<tr align=\"center\">";
				echo "<td>".$pid."</td>";
				echo "<td>".$pname."</td>";
				echo "<td>".$qoh."</td>";
				echo "<td>".$qoh_threshold."</td>";
				echo "<td>".$original_price."</td>";
				echo "<td>".$discnt_rate."</td>";
				echo "<td>".$sid."</td>";
				echo "</tr>";
			}
		}
		else if($table=="employees"){
			echo "<tr align=\"center\">
				<td>EID</td>
				<td>ENAME</td>
				<td>CITY</td>
			<tr>";
			for($i=0;$i<$number_results;$i++){
				$row=$result->fetch_assoc();
				$eid=htmlspecialchars(stripslashes($row['eid']));
				$ename=htmlspecialchars(stripslashes($row['ename']));
				$city=htmlspecialchars(stripslashes($row['city']));
							
				echo "<tr align=\"center\">";
				echo "<td>".$eid."</td>";
				echo "<td>".$ename."</td>";
				echo "<td>".$city."</td>";
			//	echo "<td><a href=\"javascript:;\" onclick=\"editTable('$table',$eid);\">修改</a></td>";
			//	echo "<td><a href=\"del_table.php?table=$table&id=$eid\">删除</a></td>";
				echo "</tr>";
			}
		}
		else if($table=="customers"){
			echo "<tr align=\"center\">
				<td>CID</td>
				<td>CNAME</td>
				<td>CITY</td>
				<td>VISIT_MADE</td>
				<td>LAST_VISITS_TIME</td>
			<tr>";
			for($i=0;$i<$number_results;$i++){
				$row=$result->fetch_assoc();
				$cid=htmlspecialchars(stripslashes($row['cid']));
				$cname=htmlspecialchars(stripslashes($row['cname']));
				$city=htmlspecialchars(stripslashes($row['city']));
				$visits_made=htmlspecialchars(stripslashes($row['visits_made']));
				$last_visit_time=htmlspecialchars(stripslashes($row['last_visit_time']));
							
				echo "<tr align=\"center\">";
				echo "<td>".$cid."</td>";
				echo "<td>".$cname."</td>";
				echo "<td>".$city."</td>";
				echo "<td>".$visits_made."</td>";
				echo "<td>".$last_visit_time."</td>";
				echo "</tr>";
			}
		}
		else if($table=="purchases"){
			echo "<tr align=\"center\">
				<td>PUR</td>
				<td>CID</td>
				<td>EID</td>
				<td>PID</td>
				<td>QTY</td>
				<td>PTIME</td>
				<td>TOTAL_PRICE</td>
			<tr>";
			for($i=0;$i<$number_results;$i++){
				$row=$result->fetch_assoc();
				$pur=htmlspecialchars(stripslashes($row['pur']));
				$cid=htmlspecialchars(stripslashes($row['cid']));
				$eid=htmlspecialchars(stripslashes($row['eid']));
				$pid=htmlspecialchars(stripslashes($row['pid']));
				$qty=htmlspecialchars(stripslashes($row['qty']));
				$ptime=htmlspecialchars(stripslashes($row['ptime']));
				$total_price=htmlspecialchars(stripslashes($row['total_price']));
							
				echo "<tr align=\"center\">";
				echo "<td>".$pur."</td>";
				echo "<td>".$cid."</td>";
				echo "<td>".$eid."</td>";
				echo "<td>".$pid."</td>";
				echo "<td>".$qty."</td>";
				echo "<td>".$ptime."</td>";
				echo "<td>".$total_price."</td>";
				echo "</tr>";
			}
			
		}
		else if($table=="logs"){
			echo "<tr align=\"center\">
				<td>LOGID</td>
				<td>WHO</td>
				<td>TIME</td>
				<td>TABLE_NAME</td>
				<td>OPERATION</td>
				<td>KEY_VALUE</td>
			<tr>";
			for($i=0;$i<$number_results;$i++){
				$row=$result->fetch_assoc();
				$logid=htmlspecialchars(stripslashes($row['logid']));
				$who=htmlspecialchars(stripslashes($row['who']));
				$time=htmlspecialchars(stripslashes($row['time']));
				$table_name=htmlspecialchars(stripslashes($row['table_name']));
				$operation=htmlspecialchars(stripslashes($row['operation']));
				$key_value=htmlspecialchars(stripslashes($row['key_value']));
							
				echo "<tr align=\"center\">";
				echo "<td>".$logid."</td>";
				echo "<td>".$who."</td>";
				echo "<td>".$time."</td>";
				echo "<td>".$table_name."</td>";
				echo "<td>".$operation."</td>";
				echo "<td>".$key_value."</td>";
				echo "</tr>";
			}
		}
		echo "<tr id=\"last_tr\" name=last_tr></tr>";
		echo "</table>";	
	}

	if($table=="products"){
		echo "<div id='add_form'>
			<span>增加商品信息：</span>
			<input id=\"prod_pid\" type=\"text\" name=\"PID\" placeholder=\"PID\" maxlength=\"4\" required>";
		echo "<input id=\"prod_pname\" type=\"text\" name=\"PNAME\" placeholder=\"PNAME\" maxlength=\"15\">";
		echo "<input id=\"prod_qoh\" type=\"text\" name=\"QOH\" placeholder=\"QOH\" maxlength=\"5\">";
		echo "<input id=\"prod_qoh_threshold\" type=\"text\" name=\"QOH_THRESHOLD\" placeholder=\"QOH_THRESHOLD\" maxlength=\"5\">";
		echo "<input id=\"prod_original_price\" type=\"text\" name=\"ORIGINAL_PRICE\" placeholder=\"ORIGINAL_PRICE\" maxlength=\"7\">";
		echo "<input id=\"prod_discnt_rate\" type=\"text\" name=\"DISCNT_RATE\" placeholder=\"DISCNT_RATE\" maxlength=\"4\">";
		echo "<input id=\"prod_sid\" type=\"text\" name=\"SID\" placeholder=\"SID\" maxlength=\"2\">";
		echo "<button id=\"submit_button\" type=\"button\" name=products onclick=\"addProduct(this);\">添 加</button></div>";
	}
	else if($table=="purchases"){
		echo "<div id='add_form'>
			<span>增加销售信息：</span>
			<input id=\"pur_pur\" type=\"text\" name=\"PUR\" placeholder=\"PUR\" maxlength=\"4\" required>";
		echo "<input id=\"pur_cid\" type=\"text\" name=\"CID\" placeholder=\"CID\" maxlength=\"4\">";
		echo "<input id=\"pur_eid\" type=\"text\" name=\"EID\" placeholder=\"EID\" maxlength=\"3\">";
		echo "<input id=\"pur_pid\" type=\"text\" name=\"PID\" placeholder=\"PID\" maxlength=\"4\">";
		echo "<input id=\"pur_qty\" type=\"text\" name=\"QTY\" placeholder=\"QTY\" maxlength=\"5\">";
		echo "<button id=\"submit_button\" type=\"button\" name=\"purchases\" onclick=\"addPurchase(this);\">添 加</button></div>";
	}
	
	else if($table=="suppliers"){
		echo "<div id='add_form'>
			<span>增加供应商信息：</span>
			<input id=\"supp_sid\" type=\"text\" name=\"SID\" placeholder=\"SID\" maxlength=\"2\" required>";
		echo "<input id=\"supp_sname\" type=\"text\" name=\"SNAME\" placeholder=\"SNAME\" maxlength=\"15\">";
		echo "<input id=\"supp_city\" type=\"text\" name=\"CITY\" placeholder=\"CITY\" maxlength=\"15\">";
		echo "<input id=\"supp_phone\" type=\"text\" name=\"TELEPHONE_NO\" placeholder=\"TELEPHONE_NO\" maxlength=\"10\">";
		echo "<button id=\"submit_button\" type=\"button\" name=suppliers onclick=\"addSupplier(this);\">添 加</button></div>";
	}
	else if($table=="employees"){
		echo "<div id='add_form'>
			<span>增加员工信息：</span>
			<input id=\"emp_eid\" type=\"text\" name=\"EID\" placeholder=\"EID\" maxlength=\"3\" required>";
		echo "<input id=\"emp_ename\" type=\"text\" name=\"ENAME\" placeholder=\"ENAME\" maxlength=\"15\">";
		echo "<input id=\"emp_city\" type=\"text\" name=\"CITY\" placeholder=\"CITY\" maxlength=\"15\">";
		echo "<button id=\"submit_button\" type=\"button\" name=employees onclick=\"addEmployee(this);\">添 加</button></div>";
	}
	else if($table=="customers"){
		echo "<div id='add_form'>
			<span>增加消费者信息：</span>
			<input id=\"cust_cid\" type=\"text\" name=\"CID\" placeholder=\"CID\" maxlength=\"4\" required>";
		echo "<input id=\"cust_cname\" type=\"text\" name=\"CNAME\" placeholder=\"CNAME\" maxlength=\"15\">";
		echo "<input id=\"cust_city\" type=\"text\" name=\"CITY\" placeholder=\"CITY\" maxlength=\"15\">";
		echo "<button id=\"submit_button\" type=\"button\" name=customers onclick=\"addCustomer(this);\">添 加</button></div>";
	}
	/*
	else if($table=="logs"){
		echo "<div id='add_form'>
			<span>增加日志信息：</span>
			<input type=\"text\" name=\"WHO\" placeholder=\"WHO\" required>";
		echo "<input type=\"text\" name=\"TIME\" placeholder=\"TIME\" >";
		echo "<input type=\"text\" name=\"TABLE_NAME\" placeholder=\"TABLE_NAME\" >";
		echo "<input type=\"text\" name=\"OPERATION\" placeholder=\"OPERATION\" >";
		echo "<input type=\"text\" name=\"KEY_VALUE\" placeholder=\"KEY_VALUE\" >";
		echo "<button id=\"submit_button\" type=\"button\" name=button>添 加</button></div>";
	}
	*/
?>