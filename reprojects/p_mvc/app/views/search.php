<div class="container mt-3">
	<div class="row">
		<div class="col-sm-5">
			<ul class="nav">
				<li class="nav-item">
					<a href="<?= BASE_URL; ?>" class="nav-link bg-primary text-white rounded">Home</a>
				</li>
			</ul>
		</div>
		<div class="col-sm-7">
			<form class="d-flex" action="<?= BASE_URL; ?>/Index/search" method="GET">
				<input class="form-control" type="text" name="keyword" placeholder="Search post...">
				<select class="form-control ml-2" name="cat_id">
					<option value="">Select Category</option>
					<?php 
					foreach ($cat_list as $value) {
					?>
					<option value="<?= $value['id']; ?>"><?= $value['name']; ?></option>
					<?php
					}
					?>
				</select>
				<input class="btn btn-primary ml-2" type="submit" name="search_post" value="Search">
			</form>
		</div>
	</div>
</div>
<div class="container pt-3">
	<div class="row">
		<div class="col-sm-8">