	<h3 class="mt-2">Update Post</h3>
	<hr class="my-2">
<?php 
if (isset($view_post)) {
	foreach ($view_post as $value) {
		$id = $value['id'];
		$title = $value['title'];
		$content = $value['content'];
		$category = $value['cat_id'];
	}
}
?>
	<div class="container">
		<div class="row">
			<div class="col-sm-8 offset-sm-2">
				<form action="<?= BASE_URL; ?>/Admin/updatePost" method="POST">
					<?php
					if (isset($update_post)) {
						echo $update_post;
					}
					?>
					<table class="table table-borderless">
						<tr>
							<td class="pt-4">Post Title</td>
							<td>
								<input type="hidden" name="id" value="<?= isset($id) ? $id : ''; ?>">
								<input class="form-control" type="text" name="title" required="1" value="<?= isset($title) ? $title : ''; ?>" placeholder="Enter post title">
							</td>
						</tr>
						<tr>
							<td class="pt-4">Post Content</td>
							<td>
								<textarea name="content" class="form-control" rows="10" required="1" placeholder="Write your content"><?= isset($id) ? $content : ''; ?></textarea>
							</td>
						</tr>
						<tr>
							<td>Select Category</td>
							<td>
								<select class="form-control" name="cat_id">
									<option value="">Select Category</option>
									<?php 
										if (isset($catList)) {
											foreach ($catList as $value) {
											?>
											<option <?php if (isset($category)) { if ($category == $value['id']) { echo "selected"; } } ?> value="<?= $value['id']; ?>"><?= $value['name']; ?></option>
											<?php
											}
										}
										?>
								</select>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<input class="btn btn-primary" type="submit" name="update_post" value="Update">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>