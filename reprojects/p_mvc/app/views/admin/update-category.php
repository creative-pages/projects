<h3 class="mb-0 px-3">Update Category</h3>
<hr class="my-2">

<div class="container">
	<div class="row">
		<div class="col-sm-6 offset-sm-3">
			<form action="<?= BASE_URL; ?>/Admin/updateCategory" method="POST">
				<?php 
				if (isset($update_category)) {
					echo $update_category;
				}
				?>
				<?php 
				if (isset($view_cat)) {
					foreach ($view_cat as $value) {
						$cat_id = $value['id'];
						$name = $value['name'];
						$title = $value['title'];
					}
				}
				?>
				<table class="table table-borderless">
					<tr>
						<td class="pt-4">Category Name</td>
						<td>
							<input type="hidden" name="cat_id" value="<?= isset($cat_id) ? $cat_id : ''; ?>">
							<input class="form-control" required="" value="<?= isset($name) ? $name : ''; ?>" type="text" name="name" placeholder="Enter category name">
						</td>
					</tr>
					<tr>
						<td class="pt-4">Category Title</td>
						<td>
							<input class="form-control" required="" value="<?= isset($title) ? $title : ''; ?>" type="text" name="title" placeholder="Enter category title">
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input class="btn btn-primary" type="submit" name="update_category" value="Update Category">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>