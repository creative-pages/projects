<?php 
require_once "../vendor/autoload.php";
$category = new App\classes\Category();
$blog = new App\classes\Blog();

if (isset($_GET['action']) && $_GET['action'] == 'active') {
	echo $id = base64_decode($_GET['id']);
	$category->active($id);
	header("location: manage-category.php");
}

if (isset($_GET['action']) && $_GET['action'] == 'inactive') {
	echo $id = base64_decode($_GET['id']);
	$category->inactive($id);
	header("location: manage-category.php");
}

if (isset($_GET['blog']) && $_GET['action'] == 'active') {
	echo $id = base64_decode($_GET['id']);
	$blog->active($id);
	header("location: manage-blog.php");
}

if (isset($_GET['blog']) && $_GET['action'] == 'inactive') {
	echo $id = base64_decode($_GET['id']);
	$blog->inactive($id);
	header("location: manage-blog.php");
}


?>