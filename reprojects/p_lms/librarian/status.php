<?php 

require_once "../dbconn.php";

if (isset($_GET['action']) && $_GET['action'] == 'inactive') {
	$id = $_GET['id'];
	$result = mysqli_query($dbconn, "UPDATE `students` SET `status` = '1' WHERE `id` = '$id'");
	if ($result) {
		header("Location: students.php");
	}
	
}

if (isset($_GET['action']) && $_GET['action'] == 'active') {
	$id = $_GET['id'];
	$result = mysqli_query($dbconn, "UPDATE `students` SET `status` = '0' WHERE `id` = '$id'");
	if ($result) {
		header("Location: students.php");
	}
	
}


?>