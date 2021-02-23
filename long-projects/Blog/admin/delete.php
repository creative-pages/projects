<?php 
require_once "../vendor/autoload.php";
$category = new App\classes\Category();
$blog = new App\classes\Blog();

if (isset($_GET['action']) && $_GET['action'] == 'cat') {
	echo $id = base64_decode($_GET['id']);
	$category->delete($id);
	header("Location: manage-category.php");
}

if (isset($_GET['action']) && $_GET['action'] == 'blog') {
	$id = base64_decode($_GET['id']);
	$blog->delete($id);
	$file = $_GET['filename'];
	unlink('../uploads/'.$file);
	header("Location: manage-blog.php");
}

?>