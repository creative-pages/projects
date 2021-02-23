<div class="container">
		<div class="row">
<!-- main content left side -->
<div class="col-sm-8">
	<h2 class="mb-0 mt-2">Post Details</h2>
	<hr>

	<?php 
	if (isset($singlePost)) {
		foreach ($singlePost as $value) {
	?>
	<article class="border p-3 rounded mb-3">
		<h2 class="border-bottom pb-2"><?= $value['title']; ?></h2>
		<p>Category: <a href="<?= BASE_URL; ?>/Index/catPost/<?= $value['cat_id']; ?>"><?= $value['name']; ?></a></p>
		<p><?= $value['content']; ?></p>
		<p>Posted on: <?= date("F j Y, h:i A", strtotime($value['date'])); ?></p>
	</article>
	<?php
		}
	}
	?>
</div>