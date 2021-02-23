<?php require_once 'header.php'; ?>

<?php 

if (isset($_POST['add_blog'])) {
	$insert_blog = $blog->addBlog($_POST);
}

?>
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<div class="row animated fadeInUp">
	<div class="col-sm-8 col-sm-offset-2">
		<div class="panel">
			<div class="panel-content">
				<div class="row">
					<div class="col-md-12">
						<form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">
							<h3 class="mb-lg text-center">Add BLog</h3>
							<?= isset($insert_blog) ? $insert_blog : ''; ?>
							<hr>
							<div class="form-group">
								<label for="title" class="col-sm-3 control-label">Blog Title</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="title" id="title" placeholder="Enter blog title" required="">
								</div>
							</div>
							<div class="form-group">
								<label for="category_id" class="col-sm-3 control-label">Select Category</label>
								<div class="col-sm-9">
									<select class="form-control" name="category_id" id="category_id" required="">
										<option value="">Select Category</option>
										<?php 
										$active_category = $category->readActiveCategory();
										while ($row = mysqli_fetch_assoc($active_category)) {
										?>
										<option value="<?= $row['id']; ?>"><?= $row['category_name']; ?></option>
										<?php
										}
										?>
									</select>
								</div>
							</div>
							<div class="form-group">
                                <label for="content" class="control-label col-sm-3">Write Content</label>
                                <div class="col-sm-9">
                                	<textarea class="form-control" name="content" rows="10" id="content" placeholder="Write content" required=""></textarea>
                                </div>
                            </div>
							<div class="form-group">
								<label for="image" class="control-label col-sm-3">Select Image</label>
								<div class="col-sm-9">
									<input type="file" name="image" id="image" class="form-control" required="">
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
								<label for="post_by" class="control-label col-sm-3">Added By</label>
								<div class="col-sm-9">
									<input type="text" name="post_by" value="<?= ucfirst($_SESSION['username']); ?>" id="post_by" class="form-control" readonly="">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-9">
									<button type="submit" class="btn btn-primary" name="add_blog">Add Blog</button>
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