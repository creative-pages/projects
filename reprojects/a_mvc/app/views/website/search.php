<div class="container mt-3">
	<div class="row">
		<div class="col-sm-6">
			<ul class="nav">
				<li class="nav-item">
					<a class="bg-primary d-block text-white px-3 py-2 mr-2 rounded text-decoration-none" href="<?= BASE_URL; ?>" class="nav-link">Home</a>
				</li>
			<?php 
				if ($menu) {
					foreach ($menu as $value) {
				?>
				<li class="nav-item">
					<a class="bg-primary d-block text-white px-3 py-2 mr-2 rounded text-decoration-none" href="<?= BASE_URL; ?>Website/page/<?= $value['id']; ?>" class="nav-link"><?= $value['name']; ?></a>
				</li>
				<?php
					}
				}
			?>
			</ul>
		</div>
		<div class="col-sm-6">
			<form action="<?= BASE_URL; ?>Website/searchPost" method="GET" class="d-flex">
				<input class="form-control" type="text" name="keyword" placeholder="Search here">
				<select class="form-control ml-2" name="category">
					<option value="">Select Category</option>
					<?php 
						if ($category) {
							foreach ($category as $value) {
						?>
						<option value="<?= $value['id']; ?>"><?= $value['name']; ?></option>
						<?php
							}
						}
					?>
				</select>
				<input class="btn btn-primary ml-2" type="submit" name="search" value="Search">
			</form>
		</div>
	</div>
</div>
<div class="container pt-3">
	<div class="row">
		<div class="col-sm-8">