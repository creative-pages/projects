<h2 class="mt-2">Post List</h2>
<hr class="my-2">

<table class="table table-bordered table-striped">
	<thead class="thead-dark">
		<tr>
			<th>S. N.</th>
			<th>Post Title</th>
			<th>Content</th>
			<th>Image</th>
			<th>Category</th>
			<th>Status</th>
			<th>Post By</th>
			<th>Date</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<?php 
		if (isset($post_list)) {
		$sl = 1;
			foreach ($post_list as $value) {
		?>
		<tr>
			<td><?= $sl; ?></td>
			<td style="width: 150px;"><?= $value['title']; ?></td>
			<td style="width: 200px;"><?= substr($value['content'], 0, 50); ?>...</td>
			<td>
				<img style="width: 80px;" src="<?= BASE_URL; ?>images/post/<?= $value['image']; ?>" alt="">
			</td>
			<td><?= $value['name']; ?></td>
			<td>
				<?php 
				if ($value['status'] == 1) {
				?>
				<a class="btn btn-success btn-sm" href="<?= BASE_URL; ?>Admin/changeStatus/<?= $value['id']; ?>">Published</a>
				<?php
				} elseif($value['status'] == 2) {
				?>
				<a class="btn btn-warning btn-sm" href="<?= BASE_URL; ?>Admin/changeStatus/<?= $value['id']; ?>">Unpublished</a>
				<?php
				}
				?>
			</td>
			<td><?= ucfirst($value['post_by']); ?></td>
			<td><?= date("F-j-Y", strtotime($value['date'])); ?></td>
			<td>
				<a class="btn btn-warning btn-sm" href="<?= BASE_URL; ?>Admin/updatePost/<?= $value['id']; ?>">Edit</a>
				<a class="btn btn-danger btn-sm" href="<?= BASE_URL; ?>Admin/deletePost/<?= $value['id']; ?>" onclick="return confirm('Are You Sure To Delete?');">Delete</a>
			</td>
		</tr>
		<?php
		$sl++;
			}
		}
		?>
	</tbody>
</table>