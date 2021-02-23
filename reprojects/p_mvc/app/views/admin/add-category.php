<h3 class="mb-0 px-3">Add Category</h3>
<hr class="my-2">
<div class="container">
	<div class="row">
		<div class="col-sm-6 offset-sm-3">
			<form action="<?= BASE_URL; ?>/Admin/insertCategory" method="POST">
				<?php 
				if (isset($add_category)) {
					echo $add_category;
				}
				?>
				<table class="table table-borderless">
					<tr>
						<td class="pt-4">Category Name</td>
						<td>
							<input class="form-control" required="" type="text" name="name" placeholder="Enter category name">
						</td>
					</tr>
					<tr>
						<td class="pt-4">Category Title</td>
						<td>
							<input class="form-control" required="" type="text" name="title" placeholder="Enter category title">
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input class="btn btn-primary" type="submit" name="add_category" value="Add Category">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
