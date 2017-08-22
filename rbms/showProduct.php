<?php
	include("conn.php");
	$pid=$_GET['pid'];
	$query="call show_product('$pid');";
	$result=$db->query($query);
	$number_results=$result->num_rows;
	if($number_results){
		$row=$result->fetch_assoc();
		$pid=stripslashes($row['pid']);
		$pname=stripslashes($row['pname']);
		$qoh=stripslashes($row['qoh']);
		$qoh_threshold=stripslashes($row['qoh_threshold']);
		$original_price=stripslashes($row['original_price']);
		$discnt_rate=stripslashes($row['discnt_rate']);
		$sname=stripslashes($row['sname']);
?>
		<div id="product_info">
			<div id="pImg">
				<img src="<?php echo 'img/product/'.$pid.'.png'; ?>" alt="暂时缺少该商品图片">
			</div>
			<div id="pInfo">
				<div>商品号：<?php echo $pid; ?></div>
				<div>商品名称：<?php echo $pname; ?></div>
				<div>剩余库存：<?php echo $qoh; ?></div>
				<div>库存临界值：<?php echo $qoh_threshold; ?></div>
				<div>原价：￥<?php echo $original_price; ?></div>
				<div>优惠价：￥<?php echo number_format($original_price*(1-$discnt_rate), 2, '.', '')." (".((1-$discnt_rate)*10)."折)"; ?></div>
				<div>供应商：<?php echo $sname; ?></div>
			</div>
		</div>
<?php
	}
?>