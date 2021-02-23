<?php 

$conn = mysqli_connect('localhost', 'root', '', 'b_lms');
mysqli_query($conn, "SET CHARACTER SET utf-8");
mysqli_query($conn, "SET SESSION collation_connection = 'utf_general_ci'");

if (!$conn) {
	echo "Connection failed!";
}

?>