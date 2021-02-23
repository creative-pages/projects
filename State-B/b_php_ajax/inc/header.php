<?php 

$filepath = realpath(dirname(__FILE__));
include_once ($filepath . '/../lib/Database.php');
include_once ($filepath . '/../classes/Project.php');

$db = new Database();
$project = new Project();

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>PHP || Dynamic Website</title>
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>

	<div class="container">
		<div class="py-4 px-3 bg-primary">
			<h2 class="text-center text-white"><a class="text-decoration-none text-white" href="index.php">Learning OOP in PHP.</a></h2>
		</div>
	</div>

	<div class="container">
		<div class="main">
		