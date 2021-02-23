<?php 
require_once "../dbconn.php ";

$result = mysqli_query($dbconn, "SELECT * FROM `students`");

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Print All Students</title>
	<link rel="stylesheet" href="../assets/vendor/bootstrap/css/bootstrap.css">
	<style>
		body {
			margin: 0px;
		}
		.print-area {
			width: 755px;
			height: 1050px;
			margin: auto;
			box-sizing: border-box;
			page-break-after: always;
		}
	</style>
</head>

<body onload="window.print()">
<?php


$sl = 1;
$page = 1;
$total = mysqli_num_rows($result);
$per_page = 4;
while ($row = mysqli_fetch_assoc($result)) {
	if ($sl % $per_page == 1) {
		echo page_header();
	}
?>
<tr>
					<td><?= $sl; ?></td>
					<td><?= $row['fname']. " " . $row['lname']; ?></td>
					<td><?= $row['roll']; ?></td>
					<td><?= $row['email']; ?></td>
					<td><?= $row['username']; ?></td>
					<td><?= $row['phone']; ?></td>
				</tr>
<?php
if ($sl % $per_page == 0 || $total == $per_page) {
		echo page_footer($page++);
	}
$sl++;
}

?>
			
	
</body>
</html>

<?php 

function page_header() {
	$data = '<div class="print-area">
		<header>
			<h1 class="text-center">Creative Hover It.</h1>
		</header>
		<div class="table-info">
			<table class="table table-bordered">
				<tr>
					<th>Se. No.</th>
					<th>Name</th>
					<th>Roll</th>
					<th>Email</th>
					<th>Username</th>
					<th>Phone</th>
				</tr>';
	return $data;
}
function page_footer($page) {
	$data = '</table>
		</div>
		<div class="page-info text-center">Page :- ' . $page . '</div>
	</div>';
	return $data;
}

?>