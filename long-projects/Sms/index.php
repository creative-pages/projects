<?php include "admin/dbcon.php"; ?>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>SMS || Students Manaegment System</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
	
	
	<div class="container">
		<div class="clearfix">
			<a class="btn btn-primary float-right mt-2" href="admin/login.php">Login Admin</a>
		</div>
		<h1 class="text-center mt-3">Welcome to Students Management System.</h1>
		<div class="row">
			<div class="col-sm-4 offset-sm-4">
				<form action="" method="POST" class="mt-3">
					<table class="table table-bordered">
						<tr>
							<th class="text-center" colspan="2">Student Information</th>
						</tr>
						<tr>
							<td><label class="mt-1" for="class">Choose Class</label></td>
							<td>
								<select class="form-control" name="class" id="choose">
									<option value="0">Select</option>
									<option value="5">Five</option>
									<option value="6">Six</option>
									<option value="7">Seven</option>
									<option value="8">Eight</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><label class="mt-1" for="roll">Roll No</label></td>
							<td><input class="form-control" type="text" name="roll" id="roll" placeholder="Enter Roll No" pattern="[0-9]{6}"></td>
						</tr>
						<tr>
							<td class="text-center" colspan="2">
								<input class="btn btn-primary" type="submit" name="std_info" value="Show Info">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>

		<?php 
		if (isset($_POST["std_info"])) {
			$class = $_POST['class'];
			$roll = $_POST['roll'];
			$std_sql = mysqli_query($dbconn, "SELECT * FROM `students` WHERE `class` = '$class' and `roll` = '$roll'");
			if (mysqli_num_rows($std_sql) == 1) {
				$row = mysqli_fetch_assoc($std_sql);

			?>
			<hr class="m-0 mb-2">
				<div class="row">
			<div class="col-sm-6 offset-sm-3">
				<table class="table table-bordered">
					<tr>
						<td rowspan="5">
							<img class="img-thumbnail" style="width: 250px; height: 200px;" src="admin/student-image/<?= $row['photo']; ?>" alt="Student Image">
						</td>
						<td>Name</td>
						<td><?= ucwords($row['name']); ?></td>
					</tr>
					<tr>
						<td>Roll</td>
						<td><?= $row['roll']; ?></td>
					</tr>
					<tr>
						<td>Class</td>
						<td><?= $row['class']; ?></td>
					</tr>
					<tr>
						<td>City</td>
						<td><?= ucwords($row['city']); ?></td>
					</tr>
					<tr>
						<td>Phone</td>
						<td><?= $row['p_contact']; ?></td>
					</tr>
				</table>
			</div>
		</div>
			<?php
			} else {
			?>
			<script style="text/javascript">
				alert("Data not found.");
			</script>
			<?php
			}
		}
		?>

	</div>
	

	<!-- js files -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>