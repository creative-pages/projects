<?php 
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . '/../classes/Project.php');

$project = new Project();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	$content = $_POST['content'];
	$contentid = $_POST['contentid'];

	$autosave = $project->contentAutoSave($content, $contentid);
}


?>