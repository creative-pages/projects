<div class="container">
		<div class="row">
<!-- main content left side -->
<div class="col-sm-8">
	<h2 class="mb-0 mt-2">Post By Category</h2>
	<hr>
	<?php 
	if (isset($catName)) {
		foreach ($catName as $result) {
	?>
	<h3 class="mb-3 pb-2 d-inline-block border-bottom">Post From <span class="text-info"><?= $result['name']; ?></span> Category</h3>
	<?php } }
	?>
	<?php 
	if ($postByCat) {
		foreach ($postByCat as $value) {
	?>
	<article class="border p-3 rounded mb-3">
		<h2 class="border-bottom pb-2">
		<a class="text-decoration-none" href="<?= BASE_URL; ?>/Index/postDetails/<?= $value['id']; ?>"><?= $value['title']; ?></a>
		</h2>
		<p>
		<?php 
		$text = $value['content'];
		if (strlen($text) > 200) {
			$text = substr($text, 0, 250);
			echo $text . "...";
		}
		?>
		</p>
		<p class="float-left">Date: <?= date("F j Y, h:i A", strtotime($value['date'])); ?></p>
		<a class="btn btn-primary float-right" href="<?= BASE_URL; ?>/Index/postDetails/<?= $value['id']; ?>">Read More..</a>
		<div class="clearfix"></div>
	</article>
	<?php
		}
	} else {
		echo '<h3 class="text-center my-5 py-5">No post available in this category!</h3>';
	}
	?>
</div>