<h3 class="mt-2">Post List</h3>
	<hr class="my-2">
<table class="table table-bordered table-striped">
	<thead class="thead-dark">
		<tr>
			<th>Se. No</th>
			<th>Title</th>
			<th>Content</th>
			<th>Category</th>
			<th>Date</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<?php 
		$sl = 1;
		foreach ($post as $value) {
		?>
		<tr>
			<td><?= $sl; ?></td>
			<td><?= $value['title']; ?></td>
			<td style="width: 300px;"><?= substr($value['content'], 0, 120); ?>...</td>
			<td><?= $value['cat_name']; ?></td>
			<td><?= date("F-j-Y, g:i A", strtotime($value['date'])); ?></td>
			<td style="width: 150px;">
				<a class="btn btn-warning btn-sm" href="<?= BASE_URL; ?>/Admin/updatePost/<?= $value['id']; ?>">Edit</a>
				<a class="btn btn-danger btn-sm" href="<?= BASE_URL; ?>/Admin/deletePost/<?= $value['id']; ?>" onclick="return confirm('Are you sure to delete?');">Delete</a>
			</td>
		</tr>
		<?php
		$sl++;
		}
		?>
	</tbody>
</table>