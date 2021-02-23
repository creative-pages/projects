</div>
		<div class="col-sm-4">
			<aside class="border rounded mb-3">
				<h4 class="bg-light px-3 py-2 border-bottom">Category List</h4>
				<ul class="nav flex-column">
					<?php 
					foreach ($cat_list as $value) {
					?>
					<li class="nav-item"><a class="nav-link" href="<?= BASE_URL; ?>/Index/postByCat/<?= $value['id']; ?>"><?= $value['name']; ?></a></li>
					<?php
					}
					?>
				</ul>
			</aside>
			<aside class="border rounded mb-3">
				<h4 class="bg-light px-3 py-2 border-bottom">Latest Post</h4>
				<ul class="nav flex-column">
					<?php 
					foreach ($latest_post as $value) {
					?>
					<li class="nav-item"><a class="nav-link" href="<?= BASE_URL; ?>/Index/postDetails/<?= $value['id']; ?>"><?= $value['title']; ?></a></li>
					<?php
					}
					?>
				</ul>
			</aside>