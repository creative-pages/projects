<h2 class="mt-2">Add Category</h2>
<hr class="my-2">
<div class="container">
	<div class="row">
		<div class="col-sm-6 offset-sm-3">
			<form action="<?= BASE_URL; ?>Admin/addCategory" method="POST">
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
					?>
					<tr>
						<td class="pt-4">Category Name</td>
						<td>
							<input class="form-control" type="text" name="name" placeholder="Enter Category Name">
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
							<input class="btn btn-primary" type="submit" name="add_category" value="Add Category">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>