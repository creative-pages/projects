<h2 class="mt-2">Add Page</h2>
<hr class="my-2">
<div class="container">
	<div class="row">
		<div class="col-sm-6 offset-sm-3">
			<form action="<?= BASE_URL; ?>Page/addPage" method="POST">
				<table class="table table-borderless">
					<?php 
					if (isset($add_page)) {
						echo $add_page;
					}
					?>
					<tr>
						<td class="pt-4">Page Name</td>
						<td>
							<input class="form-control" type="text" name="name" placeholder="Enter Page Name">
						</td>
					</tr>
					<tr>
						<td class="pt-4">Title</td>
						<td>
							<input class="form-control" type="text" name="title" placeholder="Enter Page Title">
						</td>
					</tr>
					<tr>
						<td class="pt-4">Description</td>
						<td>
							<input class="form-control" type="text" name="description" placeholder="Enter Description Name">
						</td>
					</tr>
					<tr>
						<td class="pt-4">Keywords</td>
						<td>
							<input class="form-control" type="text" name="keywords" placeholder="Enter Page Keywords">
						</td>
					</tr>
					<tr>
						<td class="pt-4">Tags</td>
						<td>
							<input class="form-control" type="text" name="tags" placeholder="Enter Page Tags">
						</td>
					</tr>
					<tr>
						<td class="pt-4">Author</td>
						<td>
							<input class="form-control" type="text" name="author" placeholder="Enter Page Author">
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input class="btn btn-primary" type="submit" name="add_page" value="Add Page">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>