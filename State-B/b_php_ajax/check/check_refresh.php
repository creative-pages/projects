<?php 
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . '/../classes/Project.php');

$project = new Project();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	$content = $_POST['content'];

	$content = $project->autoRefresh($content);
}


// get content by without refreshing
$project->getContent();


?>