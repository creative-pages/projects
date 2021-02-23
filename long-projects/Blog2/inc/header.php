<?php 
ob_start();
include_once "lib/Session.php";
Session::init();
include_once "lib/Database.php";
include_once "healper/Format.php";

spl_autoload_register(function($class_name) {
	include_once "classes/" . $class_name . ".php";
});

$database = new Database();
$format = new Format();
$post = new Post();
$category = new Category();
$titleSlogan = new TitleSlogan();
$forpage = new ForPage();
$forcontact = new ForContact();
$theme = new Theme();
$slider = new Slider();

$viewTitleSlogan = $titleSlogan->viewTitleSlogan();
$title_slogan = $viewTitleSlogan->fetch_assoc();

$viewAdminSocial = $titleSlogan->viewAdminSocial();
$social = $viewAdminSocial->fetch_assoc();

?>
<?php
  header("Cache-Control: no-cache, must-revalidate");
  header("Pragma: no-cache"); 
  header("Expires: Sat, 26 Jul 1997 05:00:00 GMT"); 
  header("Cache-Control: max-age=2592000");
?>
<!DOCTYPE html>
<html>
<head>
	<?php include 'scripts/css.php'; ?>
	<?php include 'scripts/meta.php'; ?>
	<?php include 'scripts/js.php'; ?>
</head>

<body>
	<div class="headersection templete clear">
		<a href="index.php">
			<div class="logo">
				<img src="images/<?= $title_slogan['logo']; ?>" alt="Logo"/>
				<h2><?= $title_slogan['title']; ?></h2>
				<p><?= $title_slogan['slogan']; ?></p>
			</div>
		</a>
		<div class="social clear">
			<div class="icon clear">
				<a href="<?= $social['facebook']; ?>" target="_blank"><i class="fa fa-facebook"></i></a>
				<a href="<?= $social['twitter']; ?>" target="_blank"><i class="fa fa-twitter"></i></a>
				<a href="<?= $social['linkedin']; ?>" target="_blank"><i class="fa fa-linkedin"></i></a>
				<a href="<?= $social['google']; ?>" target="_blank"><i class="fa fa-google-plus"></i></a>
			</div>
			<div class="searchbtn clear">
			<form action="search.php" method="GET">
				<input type="text" name="keyword" placeholder="Search keyword..."/>
				<input type="submit" name="search" value="Search"/>
			</form>
			</div>
		</div>
	</div>
<div class="navsection templete">
	<!-- menu active code -->
	<?php 
	$path = $_SERVER['SCRIPT_FILENAME'];
	$title = basename($path);

	if (isset($_GET['pageId'])) {
		$pageId = $_GET['pageId'];
	}
	?>
	<ul>
		<li><a id="<?= $title == 'index.php' ? 'active' : ''; ?>" href="index.php">Home</a></li>
		<?php 
	        $allPage = $forpage->allPage();
	        if ($allPage) {
	            while ($page = $allPage->fetch_assoc()) {
	        ?>
            <li><a id="<?= $pageId == $page['id'] ? 'active' : ''; ?>" href="page.php?pageId=<?= $page['id']; ?>"><?= $page['name']; ?></a></li>
	        <?php
	            }
	        }
        ?>	
		<li><a id="<?= $title == 'contact.php' ? 'active' : ''; ?>" href="contact.php">Contact</a></li>
	</ul>
</div>