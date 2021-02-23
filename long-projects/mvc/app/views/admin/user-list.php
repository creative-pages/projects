<h3 class="mt-2">User List</h3>
	<hr class="my-2">
<table class="table table-bordered table-striped">
	<thead class="thead-dark">
		<tr>
			<th>Se. No</th>
			<th>User Name</th>
			<th>Level</th>
			<th>Date</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<?php 
		$sl = 1;
		foreach ($user as $value) {
		?>
		<tr>
			<td><?= $sl; ?></td>
			<td><?= $value['username']; ?></td>
			<td>
				<?php 
				if ($value['level'] == 1) {
					echo "Admin";
				} elseif ($value['level'] == 2) {
					echo "Author";
				} else {
					echo "Contributor";
				}
				?>
			</td>
			<td><?= date("F-j-Y, g:i A", strtotime($value['date'])); ?></td>
			<td>
				<a class="btn btn-warning btn-sm" href="<?= BASE_URL; ?>/User/updateUser/<?= $value['id']; ?>">Edit</a>
				<a class="btn btn-danger btn-sm" href="<?= BASE_URL; ?>/User/deleteUser/<?= $value['id']; ?>" onclick="return confirm('Are you sure to delete?');">Delete</a>
			</td>
		</tr>
		<?php
		$sl++;
		}
		?>
	</tbody>
</table>