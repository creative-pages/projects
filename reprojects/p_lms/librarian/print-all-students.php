<?php 
require_once "../dbconn.php";

$students = mysqli_query($dbconn, "SELECT * FROM `students`");

?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Print All Students</title>
		<style>
			body {
				margin: 0px;
			}
			.print-area {
				width: 750px;
				height: 400px;
				margin: auto;
				box-sizing: border-box;
				page-break-after: always;
			}
			header {
				text-align: center;
			}
			.page-info {
				text-align: center;
				margin: 0px;
			}
			.data-info {}
			.data-info table {
				border-collapse: collapse;
				width: 100%;
			}
			.data-info table th,
			.data-info table td {
				border: 1px solid black;
				padding: 4px;
				line-height: 1em;
			}
		</style>
	</head>
	<body onload="window.print()">
		
		<?php
		$sl = 1;
		$page = 1;
		$total = mysqli_num_rows($students);
		$per_page = 4;
		while ($row = mysqli_fetch_assoc($students)) {
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
		</tr>
		<?php
		if ($sl % $per_page == 0 or $total == $per_page) {
				echo pageFooter($page++);
			}
		$sl++;
		}
		?>
		
		
	</body>
</html>
<?php
function pageHeader() {
	$data = '<div class="print-area">
				<header>
						<h3>LMS || Library Management System</h3>
				</header>
				<div class="data-info">
						<table>
								<tr>
										<th>Se. No.</th>
										<th>Name</th>
										<th>Roll No.</th>
										<th>Reg. No.</th>
										<th>Email</th>
								</tr>';
				return $data;
			}
	function pageFooter($page) {
		$data = '
						</table>
						<div class="page-info">Page :-' . $page . '</div>
				</div>
		</div>';
	return $data;
}
?>