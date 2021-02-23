<h3 class="mb-0 px-3">Category List</h3>
<hr class="my-2">
<div class="px-3">
	<table class="table table-bordered">
		<thead class="thead-dark">
			<tr>
				<th>Serial No.</th>
				<th>Username</th>
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
					<a class="btn btn-danger btn-sm" href="<?= BASE_URL; ?>/User/deleteUser/<?= $value['id']; ?>" onclick="return confirm('Are you sure to delete?');">Delete</a>
				</td>
			</tr>
			<?php
			$sl++;
			}
			?>
		</tbody>
	</table>
</div>