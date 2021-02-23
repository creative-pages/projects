<h1 class="text-primary mt-3">
<i class="fa fa-users mr-1"></i>All Users <small>All Users</small>
</h1>
<ol class="breadcrumb">
	<li class="breadcrumb-item">
		<a href="index.php"><i class="fa fa-tachometer-alt mr-1"></i>Dashboard</a>
	</li>
	<li class="breadcrumb-item active"><i class="fa fa-users mr-1"></i>All Users</li>
</ol>

<div class="table-responsive">
	<table id="data" class="table table-bordered table-hover table-striped">
		<thead>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Email</th>
				<th>Username</th>
				<th>Photo</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$result = mysqli_query($dbconn, "SELECT * FROM `users`");
			while ($row = mysqli_fetch_assoc($result)) {
			?>
			
			<tr>
				<td><?= $row['id']; ?></td>
				<td><?= ucwords($row['name']); ?></td>
				<td><?= $row['email']; ?></td>
				<td><?= $row['username']; ?></td>
				<td>
					<img style="width: 100px;" src="images/<?= $row['photo']; ?>" alt="Student Image">
				</td>
				<td><?= $row['status']; ?></td>
			</tr>
			<?php
			}
			?>
		</tbody>
	</table>
</div>