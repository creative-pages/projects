<?php include 'inc/header.php' ?>
<h2>Add Category</h2>
<hr>
<?php 
if (isset($msg)) {
	echo $msg;
}
?>
<div class="container">
	<div class="row">
		<div class="col-sm-6 offset-sm-3">
			<form action="http://localhost/mvc/Category/insertCategory" method="POST">
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
<?php include 'inc/footer.php' ?>