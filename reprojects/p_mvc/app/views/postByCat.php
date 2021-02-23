<?php 
if ($catById) {
	foreach ($catById as $value) {
?>
<h3>Post From <span class="text-info"><?= $value['name']; ?></span> Category.</h3>
<hr>
<?php
	}
}
if ($cat_post) {
	foreach ($cat_post as $value) {
	?>
	<article class="border p-3 rounded mb-3">
		<h3 class="border-bottom pb-2"><a class="text-decoration-none" href="<?= BASE_URL; ?>/Index/postDetails/<?= $value['id']; ?>"><?= $value['title']; ?></a></h3>
		<p><?= substr($value['content'], 0, 250); ?>...</p>
		<a class="btn btn-primary float-right" href="<?= BASE_URL; ?>/Index/postDetails/<?= $value['id']; ?>">Read More..</a>
		<div class="clearfix"></div>
	</article>
	<?php
	}
} else {
	echo '<h3>No post available in this category!</h3>';
}
?>