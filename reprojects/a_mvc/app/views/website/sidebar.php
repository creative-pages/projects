</div>
		<div class="col-sm-4">
			<aside class="border rounded mb-3">
				<h3 class="bg-light px-3 py-2 border-bottom">Category List</h3>
				<ul class="nav">
					<li class="nav-item">
						<?php 
						if ($category) {
							foreach ($category as $value) {
						?>
						<a href="<?= BASE_URL; ?>Website/postByCat/<?= $value['id']; ?>" class="nav-link"><?= $value['name']; ?></a>
						<?php
							}
						}
						?>
					</li>
				</ul>
			</aside>
			<aside class="border rounded">
				<h3 class="bg-light px-3 py-2 border-bottom">Latest Post</h3>
				<?php 
				if ($latest_post) {
					foreach ($latest_post as $value) {
				?>
				<a class="text-decoration-none border-bottom p-3 d-block" href="<?= BASE_URL; ?>Website/postDetails/<?= $value['id']; ?>">
					<div class="d-flex">
						<img class="img-fluid rounded img-thumbnail" style="width: 100px; height: 50px;" src="<?= BASE_URL; ?>images/post/<?= $value['image']; ?>" alt="">
						<h4 class="mt-2 ml-2"><?= $value['title']; ?></h4>
					</div>
					<p class="mb-0"><?= substr($value['content'], 0, 85); ?>...</p>
				</a>
				<?php
					}
				}

				?>
			</aside>
		</div>
	