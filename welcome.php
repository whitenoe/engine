<html>
<body>

<!-- Welcome <?php echo $_POST["username"]; ?><br>-->
<!--Your email address is: <?php echo $_POST["password"]; ?>-->

<?php

$user = $_POST["username"];
$pass = $_POST["password"];

if($user == "almadoni"){
	#echo "<script>location.href='dashboard.html';</script>";
	include 'dashboard.html';
}else{
	echo "User dan password salah..!";
}

?>

</body>
</html>
