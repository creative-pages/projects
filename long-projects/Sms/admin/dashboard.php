<h1 class="text-primary mt-3">
<i class="fa fa-tachometer-alt mr-1"></i>Dashboard <small>Statistics Overview</small>
</h1>
<ol class="breadcrumb">
	<li class="breadcrumb-item active"><i class="fa fa-tachometer-alt mr-1"></i>Dashboard</li>
</ol>

<?php 

$count_students = mysqli_query($dbconn, "SELECT * FROM `students`");
$total_student = mysqli_num_rows($count_students);

$count_users = mysqli_query($dbconn, "SELECT * FROM `users`");
$total_users = mysqli_num_rows($count_users);

?>

<div class="row">
	<div class="col-sm-4">
		<div class="card">
			<div class="card-header bg-primary text-white">
				<div class="row">
					<div class="col-6">
						<i class="fa fa-tachometer-alt fa-5x"></i>
					</div>
					<div class="col-6 text-right">
						<span style="font-size: 35px;"><?= $total_student; ?></span>
						<br>
						<span>All Students</span>
					</div>
				</div>
			</div>
			<a href="index.php?page=all-student">
				<div class="card-footer">
					<span class="float-left">View All Students</span>
					<span class="float-right"><i class="fa fa-angle-right"></i></span>
					<div class="clearfix"></div>
				</div>
			</a>
		</div>
	</div>
	<div class="col-sm-4">
		<div class="card">
			<div class="card-header bg-primary text-white">
				<div class="row">
					<div class="col-6">
						<i class="fa fa-tachometer-alt fa-5x"></i>
					</div>
					<div class="col-6 text-right">
						<span style="font-size: 35px;"><?= $total_users; ?></span>
						<br>
						<span>All Users</span>
					</div>
				</div>
			</div>
			<a href="index.php?page=all-user">
				<div class="card-footer">
					<span class="float-left">View All Users</span>
					<span class="float-right"><i class="fa fa-angle-right"></i></span>
					<div class="clearfix"></div>
				</div>
			</a>
		</div>
	</div>
</div>
<hr>
<h3>New Students</h3>
<div class="table-responsive">
	<table id="data" class="table table-bordered table-hover table-striped">
		<thead>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Roll</th>
				<th>City</th>
				<th>Contact</th>
				<th>Photo</th>
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
				<td><?= ucwords($row['city']); ?></td>
				<td><?= $row['p_contact']; ?></td>
				<td>
					<img style="width: 100px;" src="student-image/<?= $row['photo']; ?>" alt="Student Image">
				</td>
			</tr>
			<?php
			}
			?>
		</tbody>
	</table>
</div>