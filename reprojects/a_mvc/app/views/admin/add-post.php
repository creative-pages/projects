<h2 class="mt-2">Add Post</h2>
<hr class="my-2">
<div class="container">
	<div class="row">
		<div class="col-sm-8 offset-sm-2">
			<form action="<?= BASE_URL; ?>Admin/addPost" method="POST" enctype="multipart/form-data">
				<table class="table table-borderless">
					<?php 
					if (isset($add_post)) {
						echo $add_post;
					}

					if (isset($post_errors)) {
						foreach ($post_errors as $key => $value) {
						    switch ($key) {
						    	case 'title':
						    		$title = $value;
						    		break;
						    	case 'content':
						    		$content = $value;
						    		break;
						    	case 'category':
						    		$category = $value;
						    		break;
						    	case 'status':
						    		$status = $value;
						    		break;
						    }
						}
					}
					?>
					<tr>
						<td class="pt-4">Post Title</td>
						<td>
							<input class="form-control" type="text" name="title" placeholder="Enter post title">
							<?php  if (isset($title)) {
								foreach ($title as $val) {
									echo $val;
								} }
							?>
						</td>
					</tr>
					<tr>
						<td class="pt-4">Post Content</td>
						<td>
							<textarea name="content" class="form-control" rows="10" placeholder="Post content will be here"></textarea>
							<?php  if (isset($content)) {
								foreach ($content as $val) {
									echo $val;
								} }
							?>
						</td>
					</tr>
					<tr>
						<td class="pt-4">Image</td>
						<td>
							<input type="file" name="image" class="form-control">
						</td>
					</tr>
					<tr>
						<td>Select Category</td>
						<td>
							<select name="category" class="form-control">
								<option value="">Select Category</option>
								<?php 
								if ($cat_list) {
									foreach ($cat_list as $value) {
								?>
								<option value="<?= $value['id']; ?>"><?= $value['name']; ?></option>
								<?php
									}
								}
								?>
							</select>
							<?php  if (isset($category)) {
								foreach ($category as $val) {
									echo $val;
								} }
							?>
						</td>
					</tr>
					<tr>
						<td>Status</td>
						<td>
							<select name="status" class="form-control">
								<option value="">Select Status</option>
								<option value="1">Published</option>
								<option value="2">Unpublished</option>
							</select>
							<?php  if (isset($status)) {
								foreach ($status as $val) {
									echo $val;
								} }
							?>
						</td>
					</tr>
					<tr>
						<td>User</td>
						<td>
							<input type="text" class="form-control" name="post_by" value="<?= Session::get('userName'); ?>" readonly="">
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input class="btn btn-primary" type="submit" name="add_post" value="Add Post">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>