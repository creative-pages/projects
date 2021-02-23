<?php 
include "dbcon.php";

$id = base64_decode($_GET['id']);

$result = mysqli_query($dbconn, "DELETE FROM `students` WHERE `id` = '$id'");
header("Location: index.php?page=all-student");


?>