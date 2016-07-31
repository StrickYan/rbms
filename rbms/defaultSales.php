<?php
	include("conn.php");
	$query="call default_sales();";
	$result=$db->query($query);
	$number_results=$result->num_rows;
	for($i=0;$i<$number_results;$i++){
		$row=$result->fetch_assoc();
		$pid=stripslashes($row['pid']);
		$pname=stripslashes($row['pname']);
		$original_price=stripslashes($row['original_price']);
		$discnt_rate=stripslashes($row['discnt_rate']);
?>
		<div class="one_product">
			<a name="<?php echo $pid; ?>" href="javascript:;" onclick="showProduct(this);"></a>
			<img src="<?php echo 'img/product/'.$pid.'.png'; ?>" alt="暂时缺少该商品图片">
			<div class="pname"><?php echo $pname; ?></div>
			<div class="price"><?php echo '￥'.number_format($original_price*(1-$discnt_rate), 2, '.', ''); ?></div>		
		</div>
<?php
	}
?>