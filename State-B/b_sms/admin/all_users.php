<?php 
require_once 'dbconn.php';

if (isset($_GET['delete_id'])) {
	$id = $_GET['delete_id'];
	$old_file = $_GET['old_file'];
	$result = mysqli_query($conn, "DELETE FROM `students` WHERE `id` = '$id'");
	if ($result) {
		unlink('../images/students/' . $old_file);
		header("Location: index.php?page=all_students");
	}
}
	
?>

<h1 class="text-primary">
	<a href="index.php" class="text-decoration-none"><i class="fa fa-home"></i> Dashboard</a>
	<small class="text-secondary">Statistics Overview</small>
</h1>
<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="index.php" class="text-decoration-none"><i class="fa fa-home"></i> Home</a></li>
	<li class="breadcrumb-item">All Users</li>
</ol>

<h3>All Users</h3>
<div class="table-responsive">
	<table id="data" class="table table-bordered table-striped table-hover">
		<thead>
			<tr>
				<th>Ser. No.</th>
				<th>Name</th>
				<th>Email</th>
				<th>Username</th>
				<th>Image</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
			<?php 
			$sl = 1;
			$all_users = mysqli_query($conn, "SELECT * FROM `users` ORDER BY `id` DESC");
			while ($row = mysqli_fetch_assoc($all_users)) {
			?>
			<tr>
				<td><?= $sl; ?></td>
				<td><?= $row['name']; ?></td>
				<td><?= $row['email']; ?></td>
				<td><?= $row['username']; ?></td>
				<td>
					<img style="width: 100px; height: 50px;" src="../images/<?= $row['image']; ?>" alt="">
				</td>
				<td>
					<?php 
					if ($row['status'] == 0) {
						echo "Inactive";
					} elseif ($row['status'] == 1) {
						echo "Active";
					}
					?>
				</td>
			</tr>
			<?php
			$sl++;
			}
			?>
		</tbody>
	</table>
</div>