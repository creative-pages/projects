<?php 
require_once "../dbconn.php";

if (isset($_GET['action']) && $_GET['action'] == 'delete') {
	$id = $_GET['id'];
	$result = mysqli_query($dbconn, "DELETE FROM `books` WHERE `id` = '$id'");
	if ($result) {
		header("Location: manage-books.php");
	}
	
}


?>