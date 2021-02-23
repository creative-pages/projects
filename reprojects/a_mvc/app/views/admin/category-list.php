<h2 class="mt-2">Category List</h2>
<hr class="my-2">

<table class="table table-bordered table-striped">
	<thead class="thead-dark">
		<tr>
			<th>Serial No.</th>
			<th>Category Name</th>
			<th>Date</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<?php 
		if (isset($cat_list)) {
		$sl = 1;
			foreach ($cat_list as $value) {
		?>
		<tr>
			<td><?= $sl; ?></td>
			<td><?= $value['name']; ?></td>
			<td><?= date("F-j-Y, g:i A", strtotime($value['date'])); ?></td>
			<td>
				<a class="btn btn-warning" href="<?= BASE_URL; ?>Admin/updateCategory/<?= $value['id']; ?>">Edit</a>
				<a class="btn btn-danger" href="<?= BASE_URL; ?>Admin/deleteCategory/<?= $value['id']; ?>" onclick="return confirm('Are You Sure To Delete?');">Delete</a>
			</td>
		</tr>
		<?php
		$sl++;
			}
		}
		?>
	</tbody>
</table>