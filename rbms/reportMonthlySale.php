<?php
	include("conn.php");
	$pid=htmlspecialchars($_GET['pid']);
	//echo $pid;
	$query="call report_monthly_sale('$pid');";
	$result=$db->query($query);
	$number_results=$result->num_rows;
	if($number_results){
		echo "<table width=\"100%\" cellpadding=\"1\" cellspacing=\"0\">";
		echo "<tr align=\"center\">
			<td>商品名</td>
			<td>销售年份</td>
			<td>销售月份</td>
			<td>该月销量</td>
			<td>该月营业额</td>
			<td>平均售价</td>
		<tr>";
		for($i=0;$i<$number_results;$i++){
			$row=$result->fetch_assoc();
			$pname=stripslashes($row['pname']);
			$year=stripslashes($row['year(ptime)']);
			$month=stripslashes($row["DATE_FORMAT(ptime,'%b')"]);
			$sum_qty=stripslashes($row['sum(qty)']);
			$sum_total_price=stripslashes($row['sum(total_price)']);
			$avg_price=stripslashes($row['round(sum(total_price)/sum(qty),2)']);
			echo "<tr align=\"center\">";
			echo "<td>".$pname."</td>";
			echo "<td>".$year."</td>";
			echo "<td>".$month."</td>";
			echo "<td>".$sum_qty."</td>";
			echo "<td>".$sum_total_price."</td>";
			echo "<td>".$avg_price."</td>";
			echo "</tr>";
		}
		echo "</table>";
	}
	else{
		echo "该商品的销售数据不存在。";
	}
?>