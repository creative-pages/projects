<?php 

require_once "classes/user.php";

$user = new User();

$id = $_GET["id"];

$user->deleteUser($id);


?>