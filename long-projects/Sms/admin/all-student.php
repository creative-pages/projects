<h1 class="text-primary mt-3">
<i class="fa fa-users mr-1"></i>All Students <small>All Students</small>
</h1>
<ol class="breadcrumb">
	<li class="breadcrumb-item">
		<a href="index.php"><i class="fa fa-tachometer-alt mr-1"></i>Dashboard</a>
	</li>
	<li class="breadcrumb-item active"><i class="fa fa-users mr-1"></i>All Students</li>
</ol>

<div class="table-responsive">
	<table id="data" class="table table-bordered table-hover table-striped">
		<thead>
			<tr>
				<th>Id</th>
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
			$result = mysqli_query($dbconn, "SELECT * FROM `students`");
			while ($row = mysqli_fetch_assoc($result)) {
			?>
			
			<tr>
				<td><?= $row['id']; ?></td>
				<td><?= ucwords($row['name']); ?></td>
				<td><?= $row['roll']; ?></td>
				<td><?= $row['class']; ?></td>
				<td><?= ucwords($row['city']); ?></td>
				<td><?= $row['p_contact']; ?></td>
				<td>
					<img style="width: 100px;" src="student-image/<?= $row['photo']; ?>" alt="Student Image">
				</td>
				<td>
					<a class="btn btn-warning btn-sm" href="index.php?page=update-student&id=<?= base64_encode($row['id']); ?>">Edit</a>
					&nbsp;&nbsp;
					<a class="btn btn-danger btn-sm" href="delete-student.php?id=<?= base64_encode($row['id']); ?>">Delete</a>
				</td>
			</tr>
			<?php
			}
			?>
		</tbody>
	</table>
</div>