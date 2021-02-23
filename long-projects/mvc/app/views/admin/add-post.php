	<h3 class="mt-2">Add Post</h3>
	<hr class="my-2">

	<div class="container">
		<div class="row">
			<div class="col-sm-8 offset-sm-2">
				<form action="<?= BASE_URL; ?>/Admin/addPost" method="POST">
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
								case 'cat_id':
									$cat_id = $value;
									break;
							}
						}
					}
					?>
					<table class="table table-borderless">
						<tr>
							<td class="pt-4">Post Title</td>
							<td>
								<input class="form-control" type="text" name="title"  placeholder="Enter post title">
								<?php  if (isset($title)) {
									foreach ($title as $val) {
										echo $val . "<br>";
									} }
								?>
							</td>
						</tr>
						<tr>
							<td class="pt-4">Post Content</td>
							<td>
								<textarea name="content" class="form-control" rows="10"  placeholder="Write your content"></textarea>
								<?php  if (isset($content)) {
									foreach ($content as $val) {
										echo $val . "<br>";
									} }
								?>
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
											<option value="<?= $value['id']; ?>"><?= $value['name']; ?></option>
											<?php
											}
										}
										?>
								</select>
								<?php  if (isset($cat_id)) {
									foreach ($cat_id as $val) {
										echo $val . "<br>";
									} }
								?>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<input class="btn btn-primary" type="submit" name="add_post" value="Save">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>