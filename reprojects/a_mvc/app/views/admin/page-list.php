<h2 class="mt-2">Post List</h2>
<hr class="my-2">

<table class="table table-bordered table-striped">
	<?php 
	if (isset($page_list)) {
	$sl = 1;
		foreach ($page_list as $value) {
	?>
	<tr>
		<td><?= $sl; ?></td>
		<td><?= $value['name']; ?></td>
		<td>
			<a class="btn btn-warning btn-sm" href="<?= BASE_URL; ?>Page/editPage/<?= $value['id']; ?>">Edit</a>
		</td>
		<td>
			<?php 
			if ($value['status'] == 1) {
			?>
			<a class="btn btn-success btn-sm" href="<?= BASE_URL; ?>Page/changeStatus/<?= $value['id']; ?>">Published</a>
			<?php
			} elseif($value['status'] == 2) {
			?>
			<a class="btn btn-warning btn-sm" href="<?= BASE_URL; ?>Page/changeStatus/<?= $value['id']; ?>">Unpublished</a>
			<?php
			}
			?>
		</td>
		<td>
			<a class="btn btn-danger btn-sm" href="<?= BASE_URL; ?>Page/deletePage/<?= $value['id']; ?>" onclick="return confirm('Are You Sure To Delete?');">Delete</a>
		</td>
		<td><?= date("F-j-Y", strtotime($value['date'])); ?></td>
	</tr>
	<?php
	$sl++;
		}
	}
	?>
</table>