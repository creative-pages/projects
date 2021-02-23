<?php 
require_once "../dbconn.php";

$id = base64_decode($_GET['id']);

mysqli_query($dbconn, "UPDATE `students` SET `status` = '0' WHERE `id` = '$id'");

header("Location: students.php");


?>