<!-- sidebar right side -->
		<div class="col-sm-4 mt-3">
			<aside>
				<div class="border rounded mb-3 category">
					<h2 class="px-3 py-2 border-bottom bg-light mb-0">Category</h2>
					<ul class="list-unstyled p-3 mb-0 d-flex flex-column">
						<?php 
						if (isset($catList)) {
							foreach ($catList as $value) {
							?>
							<li class="py-1"><a href="<?= BASE_URL; ?>/Index/catPost/<?= $value['id']; ?>"><?= $value['name']; ?></a></li>
							<?php
							}
						}
						?>
					</ul>
				</div>
				<div class="border rounded mb-3 latest_post">
					<h2 class="px-3 py-2 border-bottom bg-light mb-0">Latest Post</h2>
					<ul class="list-unstyled p-3 mb-0 d-flex flex-column">
						<?php 
						if (isset($latestPost)) {
							foreach ($latestPost as $value) {
							?>
							<li class="py-1"><a href="<?= BASE_URL; ?>/Index/postDetails/<?= $value['id']; ?>"><?= $value['title']; ?></a></li>
							<?php
							}
						}
						?>
					</ul>
				</div>
			</aside>
		</div>