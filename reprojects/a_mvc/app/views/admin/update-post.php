<h2 class="mt-2">Update Post</h2>
<hr class="my-2">
<div class="container">
	<div class="row">
		<div class="col-sm-8 offset-sm-2">
			<form action="<?= BASE_URL; ?>Admin/updatePost" method="POST" enctype="multipart/form-data">
				<table class="table table-borderless">
					<?php 
					if (isset($update_post)) {
						echo $update_post;
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

					if (isset($view_post)) {
						foreach ($view_post as $value) {
							$id = $value['id'];
							$vtitle = $value['title'];
							$vcontent = $value['content'];
							$vimage = $value['image'];
							$vcat_id = $value['cat_id'];
							$vstatus = $value['status'];
							$vpost_by = $value['post_by'];
						}
					}
					?>
					<tr>
						<td class="pt-4">Post Title</td>
						<td>
							<input type="hidden" name="id" value="<?= isset($id) ? $id : ''; ?>">
							<input type="hidden" name="old_file" value="<?= isset($vimage) ? $vimage : ''; ?>">
							<input class="form-control" type="text" name="title" placeholder="Enter post title" value="<?= isset($vtitle) ? $vtitle : ''; ?>">
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
							<textarea name="content" class="form-control" rows="10" placeholder="Post content will be here"><?= isset($vcontent) ? $vcontent : ''; ?></textarea>
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
						<td></td>
						<td>
							<img style="width: 300px;" src="<?= BASE_URL; ?>images/post/<?= isset($vimage) ? $vimage : ''; ?>" alt="">
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
								<option 
								<?php 
								if (isset($vcat_id)) {
									if ($vcat_id == $value['id']) {
										echo "selected";
									}
								}
								?>
								 value="<?= $value['id']; ?>"><?= $value['name']; ?></option>
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
								<option 
								<?php 
								if (isset($vstatus)) {
									if ($vstatus == 1) {
										echo "selected";
									}
								}
								?>
								 value="1">Published</option>
								<option 
								<?php 
								if (isset($vstatus)) {
									if ($vstatus == 2) {
										echo "selected";
									}
								}
								?>
								 value="2">Unpublished</option>
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
							<input type="text" class="form-control" name="post_by" value="<?= isset($vpost_by) ? $vpost_by : ''; ?>" readonly="">
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