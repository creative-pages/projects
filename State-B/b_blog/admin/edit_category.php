<?php require_once 'header.php'; ?>

<?php 

if (isset($_GET['edit_id'])) {
	$id = $_GET['edit_id'];
	$single_category = $category->singleCategory($id);
	$single_row = mysqli_fetch_assoc($single_category);
}

if (isset($_POST['update_category'])) {
	$update_category = $category->updateCategory($_POST);
}

?>
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<div class="row animated fadeInUp">
	<div class="col-sm-6 col-sm-offset-3">
		<div class="panel">
			<div class="panel-content">
				<div class="row">
					<div class="col-md-12">
						<form class="form-horizontal" action="" method="POST">
							<h3 class="mb-lg text-center">Update Category</h3>
							<?= isset($update_category) ? $update_category : ''; ?>
							<hr>
							<div class="form-group">
								<label for="name" class="col-sm-3 control-label">Category Name</label>
								<div class="col-sm-9">
									<input type="hidden" name="id" value="<?= $single_row['id']; ?>">
									<input type="text" class="form-control" name="category_name" id="name" value="<?= $single_row['category_name']; ?>" placeholder="Enter category name" required="">
									<?= isset($category->category_name) ? $category->category_name : ''; ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">Status</label>
								<div class="col-sm-9">
									<div class="form-check">
										<input <?= $single_row['status'] == '1' ? 'checked' : ''; ?> type="radio" id="active" name="status" value="1" required="">
										<label for="active" class="form-check-label">Active</label>
									</div>
									<div class="form-check">
										<input <?= $single_row['status'] == '2' ? 'checked' : ''; ?> type="radio" id="inactive" name="status" value="2" required="">
										<label for="inactive" class="form-check-label">Inactive</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-9">
									<button type="submit" class="btn btn-primary" name="update_category">Update</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<?php require_once 'footer.php'; ?>