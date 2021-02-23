<?php include 'inc/header.php'; ?>
<?php 
if (!isset($_GET['categoryId']) || $_GET['categoryId'] == NULL) {
	header("Location: 404.php");
} else {
	$id = $_GET['categoryId'];
	$postByCategory = $post->postByCategory($id);
}
?>
	<div class="contentsection contemplete clear">
		<div class="maincontent clear">
			<?php
			if ($postByCategory) {
			while ($post_by_category = $postByCategory->fetch_assoc()) {
			?>
			<div class="samepost clear">
				<h2><a href="post.php?postId=<?= $post_by_category['id']; ?>"><?= $post_by_category['title']; ?></a></h2>
				<h4><?= $format->formatDate($post_by_category['date']); ?>, By <a href="#"><?= $post_by_category['author']; ?></a></h4>
				 <a href="post.php?postId=<?= $post_by_category['id']; ?>">
				 	<img src="admin/uploads/<?= $post_by_category['image']; ?>" alt="post image"/>
				 </a>
				<p><?= $format->textShorten($post_by_category['content'], 400); ?>...</p>
				<div class="readmore clear">
					<a href="post.php?postId=<?= $post_by_category['id']; ?>">Read More</a>
				</div>
			</div>
			<?php
				}
			} else {
				echo "No post available in this category!";
			}
			?>
		</div>
		<?php include 'inc/sidebar.php'; ?>
	</div>
<?php include 'inc/footer.php'; ?>
	