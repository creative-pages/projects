<?php 

if ($view_post) {
	foreach ($view_post as $value) {
?>
<article class="border rounded p-3 mb-3">
	<img class="img-fluid w-100 rounded img-thumbnail" style="height: 150px;" src="<?= BASE_URL; ?>images/post/<?= $value['image']; ?>" alt="">
	<h3 class="my-2 border-bottom pb-2">
	<?= $value['title']; ?>
	</h3>
	<p class="mb-2"><?= $value['content']; ?></p>
	<h5>Category: <a class="text-decoration-none" href="<?= BASE_URL; ?>Website/postByCat/<?= $value['cat_id']; ?>"><?= $value['name']; ?></a></h5>
	<p class="mb-0">Post By: <?= ucfirst($value['post_by']); ?> on <?= date("F-j-Y, g:i A", strtotime($value['date'])); ?></p>
	<div class="clearfix"></div>
</article>
<?php
	}
}

?>