<?php
require_once "header.php";
?>
<!-- content HEADER -->
<!-- ========================================================= -->
<div class="content-header">
	<!-- leftside content header -->
	<div class="leftside-content-header">
		<ul class="breadcrumbs">
			<li><i class="fa fa-home" aria-hidden="true"></i><a href="index.php">Librarian Dashboard</a></li>
			<li><a href="javascript:avoid(0)">Students</a></li>
		</ul>
	</div>
</div>
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<div class="row animated fadeInUp">
	<div class="col-sm-12">
		<h4 class="section-subtitle pull-left"><b>All Students</b></h4>
		<div class="pull-right"><a href="print_all_students.php" target="_blank" class="btn btn-primary">Print</a></div>
		<div class="clearfix"></div>
		<div class="panel">
			<div class="panel-content">
				<div class="table-responsive">
					<table id="basic-table" class="data-table table table-striped nowrap table-hover" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Roll</th>
								<th>Reg. No.</th>
								<th>Email</th>
								<th>Username</th>
								<th>Phone</th>
								<th>Image</th>
								<th>Status</th>
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
								<td><?= $row['fname'] . " " . $row['lname']; ?></td>
								<td><?= $row['roll']; ?></td>
								<td><?= $row['reg']; ?></td>
								<td><?= $row['email']; ?></td>
								<td><?= $row['username']; ?></td>
								<td><?= $row['phone']; ?></td>
								<td>
									<img src="<?= $row['image']; ?>" alt="">
								</td>
								<td><?= $row['status'] == 1 ? 'Active':'Inactive'; ?></td>
								<td>
									<?php 
									if ($row['status'] == 1) {
									?>
									<a class="btn btn-warning btn-sm" href="status_inactive.php?id=<?= base64_encode($row['id']); ?>">Inactive</a>
									<?php
									} else {
									?>
									<a class="btn btn-success btn-sm" href="status_active.php?id=<?= base64_encode($row['id']); ?>">Active</a>
									<?php
									}
									
									?>
									
								</td>
							</tr>
							<?php
							}
							?>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<?php
require_once "footer.php";
?>