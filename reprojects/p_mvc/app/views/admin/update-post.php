<h3 class="mb-0 px-3">Update Post</h3>
<hr class="my-2">
<div class="container">
	<div class="row">
		<div class="col-sm-8 offset-sm-2">
			<form action="<?= BASE_URL; ?>/Admin/updatePost/4" method="POST">
				<?php 
				if (isset($update_post)) {
					echo $update_post;
				}
				if (isset($post_errors)) {
					foreach ($post_errors as $key => $value) {
						switch ($key) {
							case 'title':
								$titleErr = $value;
								break;
							case 'content':
								$contentErr = $value;
								break;
							case 'category':
								$categoryErr = $value;
								break;
						}
					}
				}
				?>
				<?php 
				if (isset($view_post)) {
					foreach ($view_post as $value) {
						$id = $value['id'];
						$title = $value['title'];
						$content = $value['content'];
						$cat_id = $value['cat'];
					}
				}
				?>
				<table class="table table-borderless">
					<tr>
						<td class="pt-4">Post Title</td>
						<td>
							<input type="hidden" name="id" value="<?= isset($id) ? $id : ''; ?>">
							<input class="form-control" value="<?= isset($title) ? $title : ''; ?>" type="text" name="title" placeholder="Enter post title">
							<?php  if (isset($titleErr)) {
								foreach ($titleErr as $val) {
									echo $val . "<br>";
								} }
							?>
						</td>
					</tr>
					<tr>
						<td class="pt-4">Post Content</td>
						<td>
							<textarea name="content" class="form-control" rows="10" placeholder="Content will be here.."><?= isset($content) ? $content : ''; ?></textarea>
							<?php  if (isset($contentErr)) {
								foreach ($contentErr as $val) {
									echo $val . "<br>";
								} }
							?>
						</td>
					</tr>
					<tr>
						<td>Select Category</td>
						<td>
							<select class="form-control" name="category">
								<option value="">Select Category</option>
								<?php 
								foreach ($cat as $value) {
								?>
								<option <?php if (isset($cat_id)) { if ($cat_id == $value['id']) { echo "selected"; } } ?> value="<?= $value['id']; ?>"><?= $value['name']; ?></option>
								<?php
								}
								?>
							</select>
							<?php  if (isset($categoryErr)) {
								foreach ($categoryErr as $val) {
									echo $val . "<br>";
								} }
							?>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input class="btn btn-primary" type="submit" name="update_post" value="Update Post">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
