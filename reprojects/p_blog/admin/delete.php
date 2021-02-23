<?php 
require_once "../vendor/autoload.php";

$category = new App\classes\Category();
$blog = new App\classes\Blog();

if (isset($_GET['blog']) && $_GET['blog'] == 'delete') {
	$id = $_GET['id'];
	$file = $_GET['file'];
	$blog->deleteBlog($id);
	unlink("../uploads/" . $file);
	header("Location: manage-blog.php");
}

?>