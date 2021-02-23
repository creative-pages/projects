<?php 
require_once 'admin/dbconn.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>SMS || Students Management System</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/fontawesome.min-all.css">
</head>
<body>
	
	<div class="container">
		<a href="admin/login.php" class="float-right btn btn-primary my-4">Admin Login</a>
		<div class="clearfix"></div>
		<h1 class="text-center mb-4">Welcome To Students Management System</h1>
		<div class="row">
			<div class="col-sm-4 offset-sm-4">
				<form action="" method="POST">
					<table class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th colspan="2" class="text-center">Student Information</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<label for="class" class="control-label mt-2">Choose Class</label>
								</td>
								<td>
									<select class="form-control" name="class" id="class" required="">
										<option value="">Select Class</option>
										<option value="5">Five</option>
										<option value="6">Six</option>
										<option value="7">Seven</option>
										<option value="8">Eight</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<label for="roll" class="label-control mt-2">Roll</label>
								</td>
								<td>
									<input type="text" name="roll" id="roll" placeholder="Enter roll" class="form-control" pattern="[0-9]{6}" required="">
								</td>
							</tr>
							<tr>
								<td colspan="2" class="text-center">
									<input type="submit" name="student_info" value="Show Info" class="btn btn-primary ml-2">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>

		<?php 
		if (isset($_POST['student_info'])) {
			$class = $_POST['class'];
			$roll = $_POST['roll'];

			$std_info = mysqli_query($conn, "SELECT * FROM `students` WHERE `class` = '$class' AND `roll` = '$roll'");
			if (mysqli_num_rows($std_info) > 0) {
				$std_info_result = mysqli_fetch_assoc($std_info);
			?>
			<hr>
			<br>
			<div class="row">
				<div class="col-sm-6 offset-sm-3">
					<table class="table table-bordered table-striped table-hover">
						<tr>
							<td rowspan="6">
								<img class="img-thumbnail" style="width: 250px; height: 220px;" src="images/200717031058.png" alt="">
							</td>
						</tr>
						<tr>
							<td>Name</td>
							<td><?= $std_info_result['name']; ?></td>
						</tr>
						<tr>
							<td>Roll</td>
							<td><?= $std_info_result['roll']; ?></td>
						</tr>
						<tr>
							<td>Class</td>
							<td><?= $std_info_result['class']; ?></td>
						</tr>
						<tr>
							<td>City</td>
							<td><?= $std_info_result['city']; ?></td>
						</tr>
						<tr>
							<td>Contact</td>
							<td><?= $std_info_result['p_contact']; ?></td>
						</tr>
					</table>
				</div>
			</div>
			<?php
			} else {
				echo "<hr>";
				echo '<h1 class="text-center text-danger">No information found!</h1>';
			}
		}
		?>
		
	</div>

	<!-- script -->
	<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>