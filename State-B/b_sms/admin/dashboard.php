<?php 

// total students
$total_students = mysqli_query($conn, "SELECT * FROM `students`");
$total_students_result = mysqli_num_rows($total_students);

// total users
$total_users = mysqli_query($conn, "SELECT * FROM `users`");
$total_users_result = mysqli_num_rows($total_users);

?>

<h1 class="text-primary">
	<a href="index.php" class="text-decoration-none"><i class="fa fa-home"></i> Dashboard</a>
	<small class="text-secondary">Statistics Overview</small>
</h1>
<ol class="breadcrumb">
	<li class="breadcrumb-item"><i class="fa fa-home"></i> Home</li>
</ol>

<div class="row">
	<div class="col-sm-4">
		<div class="card">
			<div class="card-header bg-primary text-white">
				<div class="row">
					<div class="col-5">
						<i class="fa fa-users fa-6x"></i>
					</div>
					<div class="col-7">
						<span class="float-right" style="font-size: 40px;"><?= $total_students_result; ?></span>
						<div class="clearfix"></div>
						<h4 class="text-right mb-0 mt-1">All Students</h4>
					</div>
				</div>
			</div>
			<a href="index.php?page=all_students">
				<div class="card-footer">
					<p class="mb-0 float-left">View All Students</p>
					<span class="float-right">
						<i class="fa fa-arrow-right"></i>
					</span>
					<div class="clearfix"></div>
				</div>
			</a>
		</div>
	</div>
	<div class="col-sm-4">
		<div class="card">
			<div class="card-header bg-primary text-white">
				<div class="row">
					<div class="col-5">
						<i class="fa fa-users fa-6x"></i>
					</div>
					<div class="col-7">
						<span class="float-right" style="font-size: 40px;"><?= $total_users_result; ?></span>
						<div class="clearfix"></div>
						<h4 class="text-right mb-0 mt-1">All Users</h4>
					</div>
				</div>
			</div>
			<a href="index.php?page=all_users">
				<div class="card-footer">
					<p class="mb-0 float-left">View All Users</p>
					<span class="float-right">
						<i class="fa fa-arrow-right"></i>
					</span>
					<div class="clearfix"></div>
				</div>
			</a>
		</div>
	</div>
</div>
<hr>
<h3>New Students</h3>
<div class="table-responsive">
	<table id="data" class="table table-bordered table-striped table-hover">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Roll</th>
				<th>City</th>
				<th>Contact</th>
				<th>Photo</th>
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
				<td><?= $row['city']; ?></td>
				<td><?= $row['p_contact']; ?></td>
				<td>
					<img style="width: 100px; height: 50px;" src="../images/students/<?= $row['image']; ?>" alt="">
				</td>
			</tr>
			<?php
			}
			?>
		</tbody>
	</table>
</div>