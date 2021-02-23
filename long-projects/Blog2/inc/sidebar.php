<div class="sidebar clear">
			<div class="samesidebar clear">
				<h2>Categories</h2>
					<ul>
						<?php 
						$allCategory = $category->allCategory();
						while ($allcategory = $allCategory->fetch_assoc()) {
						?>
						<li><a href="category-post.php?categoryId=<?= $allcategory['id']; ?>"><?= $allcategory['category_name']; ?></a></li>
						<?php
						}
						?>
					</ul>
			</div>
			
			<div class="samesidebar clear">
				<h2>Latest articles</h2>
				<?php 
					$latestPost = $post->latestPost();
					if ($latestPost) {
					while ($latest_post = $latestPost->fetch_assoc()) {
				?>
					<div class="popular clear">
						<h3><a href="post.php?postId=<?= $latest_post['id']; ?>"><?= $latest_post['title']; ?></a></h3>
						<a href="post.php?postId=<?= $latest_post['id']; ?>"><img src="admin/uploads/<?= $latest_post['image']; ?>" alt="post image"/></a>
						<div><?= $format->textShorten($latest_post['content'], 125); ?></div>
					</div>
				<?php 
						}
					}
				?>
	
			</div>
			
		</div>