<h2 class="mb-0">Post Details</h2>
<hr>
<?php 
foreach ($post_details as $value) {
?>
<article class="border p-3 rounded mb-3">
	<h3 class="border-bottom pb-2"><?= $value['title']; ?></h3>
	<h5>Category: <a href="<?= BASE_URL; ?>/Index/postByCat/<?= $value['cat']; ?>"><?= $value['category_name']; ?></a></h5>
	<p><?= $value['content']; ?></p>
	<p>Posted on: <?= date("F-j-Y, g:i A", strtotime($value['date'])); ?></p>
	<div class="clearfix"></div>
</article>
<?php
}
?>