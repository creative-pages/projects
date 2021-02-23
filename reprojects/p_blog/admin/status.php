<?php 
require_once "../vendor/autoload.php";

$category = new App\classes\Category();
$blog = new App\classes\BLog();

if (isset($_GET['action']) && $_GET['action'] == 'inactive') {
	$id = $_GET['id'];
	$category->inactive($id);
	header("Location: manage-category.php");
}
if (isset($_GET['action']) && $_GET['action'] == 'active') {
	$id = $_GET['id'];
	$category->active($id);
	header("Location: manage-category.php");
}

if (isset($_GET['blog']) && $_GET['blog'] == 'inactive') {
	$id = $_GET['id'];
	$blog->inactive($id);
	header("Location: manage-blog.php");
}
if (isset($_GET['blog']) && $_GET['blog'] == 'active') {
	$id = $_GET['id'];
	$blog->active($id);
	header("Location: manage-blog.php");
}


?>