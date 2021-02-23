	<h3 class="mt-2">Add Category</h3>
	<hr class="my-2">

	<div class="container">
		<div class="row">
			<div class="col-sm-6 offset-sm-3">
				<form action="<?= BASE_URL; ?>/Admin/addCategory" method="POST">
					<?php
					if (isset($msg)) {
						echo $msg;
					}
					?>
					<table class="table table-borderless">
						<tr>
							<td class="pt-4">Category Name</td>
							<td>
								<input class="form-control" type="text" name="name" required="1" placeholder="Enter category name">
							</td>
						</tr>
						<tr>
							<td class="pt-4">Category Title</td>
							<td>
								<input class="form-control" type="text" name="title" required="1" placeholder="Enter category title">
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<input class="btn btn-primary" type="submit" name="add_category" value="Save">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>