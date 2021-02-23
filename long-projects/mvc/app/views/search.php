<div class="container mt-3">
	<div class="row">
		<div class="col-sm-6">
			<ul class="nav">
				<li class="nav-item">
					<a class="nav-link d-inline-block bg-primary text-white rounded" href="<?= BASE_URL; ?>">Home</a>
				</li>
			</ul>
		</div>
		<div class="col-sm-6">
			<form action="<?= BASE_URL; ?>/Index/search" method="GET" class="float-right">
				<input class="form-control w-auto d-inline" type="text" name="keyword" placeholder="Search here..">
				<select class="form-control w-auto d-inline" name="category">
					<option value="">Select Category</option>
					<?php 
						if (isset($catList)) {
							foreach ($catList as $value) {
							?>
							<option value="<?= $value['id']; ?>"><?= $value['name']; ?></option>
							<?php
							}
						}
						?>
				</select>
				<input class="btn btn-info mt-n1" type="submit" name="search" value="Search">
			</form>
		</div>
	</div>
</div>