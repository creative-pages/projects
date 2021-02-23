<?php require_once '../dbconn.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Print All Students</title>
	<link rel="stylesheet" href="../assets/vendor/bootstrap/css/bootstrap.css">
	<style>
		.print_area {
			width: 755px;
			height: 350px;
			margin: auto;
			box-sizing: border-box;
			page-break-after: always;
		}
	</style>
</head>
<body onload="window.print();">
	
	<?php 
	
	$result = mysqli_query($conn, "SELECT * FROM `students`");

	$sl = 1;
	$page = 1;
	$total = mysqli_num_rows($result);
	$per_page = 3;
	while ($row = mysqli_fetch_assoc($result)) {
		if ($sl % $per_page == 1) {
			echo pageHeader();
		}
	?>
			<tr>
				<td><?= $sl; ?></td>
				<td><?= $row['fname'] . ' ' . $row['lname']; ?></td>
				<td><?= $row['roll']; ?></td>
				<td><?= $row['reg']; ?></td>
				<td><?= $row['email']; ?></td>
				<td><?= $row['username']; ?></td>
				<td><?= $row['phone']; ?></td>
			</tr>
	<?php
		if ($sl % $per_page == 0 || $total == $per_page) {
			echo pageFooter($page++);
		}
		$sl++;
		}
	?>

</body>
</html>

<?php 
function pageHeader() {
	$data = '<div class="print_area">
		<div class="text-center">
			<h3>Full Stack Web Development.</h3>
		</div>
		<div class="date_info">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>Sl. No.</th>
						<th>Name</th>
						<th>Roll</th>
						<th>Reg.</th>
						<th>Email</th>
						<th>Username</th>
						<th>Phone</th>
					</tr>
				</thead>';
	return $data;
}
function pageFooter($page) {
	$data = '</table>
			<div class="page_info">Page:- ' . $page . '</div>
		</div>
	</div>';
	return $data;
}
?>