<?php
include 'connect.php';

$id = $_POST["id"];
$product = $_POST["productName"];
$code = $_POST["code"];
$parent = $_POST["parent"];

?>

	Product Name : <?php echo $product;?> <br>
	Kode : <?php echo $code; ?><b>

<?php

$params = "('$id','$code','$product','1','$parent','now()', 'now()') RETURNING id";
$query = "INSERT INTO product (id, code, name,is_active ,parent_id,create_date, update_date) values ". $params;
$doAddproduct = pg_query($query);

$paramsUnit = "('303','PCS','1','$id','now()','now()') RETURNING id";
$addUnit = "INSERT INTO unit (id,name,is_active,product_id,create_date,update_date) values ".$paramsUnit;
$doAddUnit = pg_query($addUnit);

trigger_error("Unit id :  "+$doAddUnit);

$paramsPrice = "('403','40000','$doAddUnit','now()','now()') RETURNING id";
$addPrice = "INSERT INTO price (id,price,unit_id,create_date,update_date) values ".$paramsPrice;
$doAddPrice = pg_query($addPrice);

echo "hasil :";
?>
