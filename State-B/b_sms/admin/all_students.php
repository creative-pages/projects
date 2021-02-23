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
	<li class="breadcrumb-item">All Students</li>
</ol>

<h3>All Students</h3>
<div class="table-responsive">
	<table id="data" class="table table-bordered table-striped table-hover">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Roll</th>
				<th>Class</th>
				<th>City</th>
				<th>Contact</th>
				<th>Photo</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<?php 
			$all_students = mysqli_query($conn, "SELECT * FROM `students` ORDER BY `id` DESC");
			while ($row = mysqli_fetch_assoc($all_students)) {
			?>
			<tr>
				<td><?= $row['id']; ?></td>
				<td><?= $row['name']; ?></td>
				<td><?= $row['roll']; ?></td>
				<td><?= $row['class']; ?></td>
				<td><?= $row['city']; ?></td>
				<td><?= $row['p_contact']; ?></td>
				<td>
					<img style="width: 100px; height: 50px;" src="../images/students/<?= $row['image']; ?>" alt="">
				</td>
				<td>
					<a href="index.php?page=update_student&edit_id=<?= $row['id']; ?>" class="btn btn-warning btn-sm"><i class="fa fa-pencil"></i> Edit</a>
					<a href="all_students.php?delete_id=<?= $row['id']; ?>&old_file=<?= $row['image']; ?>" class="btn btn-danger btn-sm" onclick="return confirm('Are your sure to delete?');"><i class="fa fa-trash"></i> Delete</a>
				</td>
			</tr>
			<?php
			}
			?>
		</tbody>
	</table>
</div>