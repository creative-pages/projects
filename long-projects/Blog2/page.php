<?php include 'inc/header.php'; ?>
<?php 
if (!isset($_GET['pageId']) || $_GET['pageId'] == NULL) {
    header("Location: 404.php");
} else {
    $id = $_GET['pageId'];
    $selectSinglePage = $forpage->selectSinglePage($id);
    $single_page = $selectSinglePage->fetch_assoc();
}
?>
	<div class="contentsection contemplete clear">
		<div class="maincontent clear">
			<div class="about">
				<h2><?= $single_page['name']; ?></h2>
				<?= $single_page['content']; ?>
			</div>
		</div>
		<?php include 'inc/sidebar.php'; ?>
	</div>
<?php include 'inc/footer.php'; ?>