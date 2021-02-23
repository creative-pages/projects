<?php 

$dbconn = mysqli_connect("localhost", "root", "", "lms");
mysqli_query($dbconn, "SET CHARACTER SET utf8");
mysqli_query($dbconn, "SET SESSION collation_connection = 'utf8_general_ci'");

if (!$dbconn) {
	echo "Database connection failed.";
}


?>