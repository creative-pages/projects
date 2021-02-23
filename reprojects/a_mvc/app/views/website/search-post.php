<?php 

if ($search_post) {
	foreach ($search_post as $value) {
?>
<article class="border rounded p-3 mb-3">
	<a href="<?= BASE_URL; ?>Website/postDetails/<?= $value['id']; ?>">
		<img class="img-fluid w-100 rounded img-thumbnail" style="height: 150px;" src="<?= BASE_URL; ?>images/post/<?= $value['image']; ?>" alt="">
	</a>
	<h3 class="my-2 border-bottom pb-2">
	<a class="text-decoration-none" href="<?= BASE_URL; ?>Website/postDetails/<?= $value['id']; ?>"><?= $value['title']; ?></a>
	</h3>
	<p class="mb-2"><?= substr($value['content'], 0, 250); ?>...</p>
	<h5>Category: <a class="text-decoration-none" href="<?= BASE_URL; ?>Website/postByCat/<?= $value['cat_id']; ?>"><?= $value['name']; ?></a></h5>
	<p class="mb-0">Post By: <?= ucfirst($value['post_by']); ?> on <?= date("F-j-Y, g:i A", strtotime($value['date'])); ?></p>
	<a class="btn btn-primary float-right" href="<?= BASE_URL; ?>Website/postDetails/<?= $value['id']; ?>">Read More..</a>
	<div class="clearfix"></div>
</article>
<?php
	}
} else {
	echo '<h3 class="mt-5 text-center pt-5">No Search Post Found!</h3>';
}

?>