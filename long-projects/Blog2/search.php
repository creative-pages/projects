<?php include 'inc/header.php'; ?>
<?php include 'inc/slider.php'; ?>
<?php 
if ($_SERVER['REQUEST_METHOD'] = 'GET' && $_GET['search']) {
	$keyword = $_GET['keyword'];
	$searchPost = $post->searchPost($keyword);
}
?>
	<div class="contentsection contemplete clear">
		<div class="maincontent clear">
			<?php
			if ($searchPost) {
			while ($search_post = $searchPost->fetch_assoc()) {
			?>
			<div class="samepost clear">
				<h2><a href="post.php?postId=<?= $search_post['id']; ?>"><?= $search_post['title']; ?></a></h2>
				<h4><?= $format->formatDate($search_post['date']); ?>, By <a href="#"><?= $search_post['author']; ?></a></h4>
				 <a href="post.php?postId=<?= $search_post['id']; ?>">
				 	<img src="admin/uploads/<?= $search_post['image']; ?>" alt="post image"/>
				 </a>
				<p><?= $format->textShorten($search_post['content'], 400); ?>...</p>
				<div class="readmore clear">
					<a href="post.php?postId=<?= $search_post['id']; ?>">Read More</a>
				</div>
			</div>
			<?php
			}
		} else {
			echo "No search results found!";
		}
		?>

		</div>
		<?php include 'inc/sidebar.php'; ?>
	</div>
<?php include 'inc/footer.php'; ?>
	