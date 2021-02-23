<?php require_once 'header.php'; ?>

<?php 

if (isset($_POST['add_category'])) {
	$insert_category = $category->addCategory($_POST);
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
							<h3 class="mb-lg text-center">Add Category</h3>
							<?= isset($insert_category) ? $insert_category : ''; ?>
							<hr>
							<div class="form-group">
								<label for="name" class="col-sm-3 control-label">Category Name</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="category_name" id="name" placeholder="Enter category name" required="">
									<?= isset($category->category_name) ? $category->category_name : ''; ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">Status</label>
								<div class="col-sm-9">
									<div class="form-check">
										<input type="radio" id="active" name="status" value="1" required="">
										<label for="active" class="form-check-label">Active</label>
									</div>
									<div class="form-check">
										<input type="radio" id="inactive" name="status" value="2" required="">
										<label for="inactive" class="form-check-label">Inactive</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-9">
									<button type="submit" class="btn btn-primary" name="add_category">Add</button>
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