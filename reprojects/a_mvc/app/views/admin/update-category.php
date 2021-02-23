<h2 class="mt-2">Home</h2>
<hr class="my-2">
<div class="container">
	<div class="row">
		<div class="col-sm-6 offset-sm-3">
			<form action="<?= BASE_URL; ?>Admin/updateCategory" method="POST">
				<table class="table table-borderless">
					<?php 
					if (isset($add_category)) {
						echo $add_category;
					}

					if (isset($cat_errors)) {
						foreach ($cat_errors as $key => $value) {
						    switch ($key) {
						    	case 'name':
						    		$name = $value;
						    		break;
						    }
						}
					}

					if (isset($catById)) {
						foreach ($catById as $value) {
							$id = $value['id'];
							$cat_name = $value['name'];
						}
					}
					?>
					<tr>
						<td class="pt-4">Category Name</td>
						<td>
							<input type="hidden" name="id" value="<?= isset($id) ? $id : ''; ?>">
							<input class="form-control" type="text" value="<?= isset($cat_name) ? $cat_name : ''; ?>" name="name" placeholder="Enter Category Name">
							<?php  if (isset($name)) {
								foreach ($name as $val) {
									echo $val;
								} }
							?>
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