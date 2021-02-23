<?php 
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . '/../classes/Project.php');

$project = new Project();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	$data = $_POST['data'];

	$data = $project->liveSearch($data);
}


?>