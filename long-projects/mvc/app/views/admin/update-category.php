	<h3 class="mt-2">Update Category</h3>
	<hr class="my-2">
<?php 
if (isset($upCat)) {
	foreach ($upCat as $value) {
		$id = $value['id'];
		$name = $value['name'];
		$title = $value['title'];
	}
}
?>
<div class="container">
	<div class="row">
		<div class="col-sm-6 offset-sm-3">
			<form action="<?= BASE_URL; ?>/Admin/updateCategory" method="POST">
				<?php 
				if (isset($updateCat)) {
					echo $updateCat;
				}
				?>
				<table class="table table-borderless">
					<tr>
						<td class="pt-4">Category Name</td>
						<td>
							<input type="hidden" name="id" value="<?= isset($id) ? $id : ''; ?>">
							<input class="form-control" type="text" name="name" required="1" value="<?= isset($name) ? $name : ''; ?>" placeholder="Enter category name">
						</td>
					</tr>
					<tr>
						<td class="pt-4">Category Title</td>
						<td>
							<input class="form-control" type="text" name="title" required="1" value="<?= isset($title) ? $title : ''; ?>" placeholder="Enter category title">
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input class="btn btn-primary" type="submit" name="update_category" value="Update">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>