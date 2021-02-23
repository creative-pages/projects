<?php include 'inc/header.php'; ?>
<?php include 'inc/slider.php'; ?>

	<div class="contentsection contemplete clear">
		<div class="maincontent clear">
			<?php 
			$per_page = 3;
			if (isset($_GET['page'])) {
				$page = $_GET['page'];
			} else {
				$page = 1;
			}
			$start_from = ($page - 1) * $per_page;

			$allPostLimit = $post->allPostLimit($start_from, $per_page);
			while ($posts = $allPostLimit->fetch_assoc()) {
			?>
			<div class="samepost clear">
				<h2><a href="post.php?postId=<?= $posts['id']; ?>"><?= $posts['title']; ?></a></h2>
				<h4><?= $format->formatDate($posts['date']); ?>, By <a href="#"><?= $posts['author']; ?></a></h4>
				 <a href="post.php?postId=<?= $posts['id']; ?>">
				 	<img src="admin/uploads/<?= $posts['image']; ?>" alt="post image"/>
				 </a>
				<p><?= $format->textShorten($posts['content'], 400); ?>...</p>
				<div class="readmore clear">
					<a href="post.php?postId=<?= $posts['id']; ?>">Read More</a>
				</div>
			</div>
			<?php
			}
			?>
<!-- pagination start -->
<style>
  a {
  	text-decoration: none;
  }
	.pagination {
  display: -ms-flexbox;
  display: flex;
  justify-content: center;
  padding-left: 0;
  list-style: none;
  border-radius: 0.25rem;
}

.page-link {
  position: relative;
  display: block;
  padding: 0.5rem 0.75rem;
  margin-left: -1px;
  line-height: 1.25;
  color: #007bff;
  background-color: #fff;
  border: 1px solid #dee2e6;
}

.page-link:hover {
  z-index: 2;
  color: #0056b3;
  text-decoration: none;
  background-color: #e9ecef;
  border-color: #dee2e6;
}

.page-link:focus {
  z-index: 2;
  outline: 0;
  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}

.page-item:first-child .page-link {
  margin-left: 0;
  border-top-left-radius: 0.25rem;
  border-bottom-left-radius: 0.25rem;
}

.page-item:last-child .page-link {
  border-top-right-radius: 0.25rem;
  border-bottom-right-radius: 0.25rem;
}
</style>
<?php 
$allPost = $post->allPost();
$total_rows = mysqli_num_rows($allPost);
$total_pages = ceil($total_rows/$per_page);

echo '<span class="pagination"><a class="page-link" href="index.php?page=1">First Page</a> ';
for ($i=1; $i <= $total_pages; $i++) { 
	echo '<a class="page-link" href="index.php?page=' . $i . '">' . $i . '</a> ';
}
echo '<a class="page-link" href="index.php?page=' . $total_pages . '">Last Page</a></span>';
?>
<!-- pagination end -->
		</div>
		<?php include 'inc/sidebar.php'; ?>
	</div>
<?php include 'inc/footer.php'; ?>
	