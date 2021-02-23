<?php include 'inc/header.php'; ?>
<?php 
if (!isset($_GET['postId']) || $_GET['postId'] == NULL) {
	header("Location: 404.php");
} else {
	$id = $_GET['postId'];
	$singlePost = $post->singlePost($id);
}
?>
	<div class="contentsection contemplete clear">
		<div class="maincontent clear">
			<div class="about">
				<?php 
				$singlepost = $singlePost->fetch_assoc();
 				?>
				<h2><?php echo $singlepost['title']; ?></h2>
				<h4><?php echo $format->formatDate($singlepost['date']); ?>, By <?php echo $singlepost['author']; ?></h4>
				<img src="admin/uploads/<?php echo $singlepost['image']; ?>" alt="MyImage"/>
				<div><?php echo $singlepost['content']; ?></div>

				<div class="relatedpost clear">
					<h2>Related articles</h2>
					<?php 
					$id = $singlepost['category_id'];
					$relatedPost = $post->relatedPost($id);
					if ($relatedPost) {
						while ($relatedpost = $relatedPost->fetch_assoc()) {
					?>
						<a href="post.php?postId=<?= $relatedpost['id']; ?>"><img src="admin/uploads/<?= $relatedpost['image']; ?>" alt="post image"/></a>
					<?php
						}
					} else {
						echo "No related post available!";
					}
					?>
				</div>
	</div>

		</div>
		<?php include 'inc/sidebar.php'; ?>
	</div>
<?php include 'inc/footer.php'; ?>