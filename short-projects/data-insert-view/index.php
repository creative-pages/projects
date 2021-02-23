<?php
require_once 'dbname.php';

if (!$conn) {
	echo "Database connection failed.";
}

if (isset($_POST['send'])) {
	$name = $_POST['name'];
	$email = $_POST['email'];
	$image = $_FILES['image']['name'];
	$image_explode = explode('.', $image);
	$image_ex = end($image_explode);
	$file_name = strtolower($name) . date('-Y-m-d-H-i-s') . "." . $image_ex;


	$error = array();

	if (empty($name)) {
		$error['name'] = "Name is required.";
	}
	if (empty($email)) {
		$error['email'] = "Email is required.";
	}
	if (empty($image)) {
		$error['image'] = "Image is required.";
	}
	if (count($error) == 0) {
		$sql = "INSERT INTO `students`(`name`, `email`, `image`) VALUES ('$name', '$email', '$file_name')";
		$insert_data = mysqli_query($conn, $sql);
		if ($insert_data) {
			move_uploaded_file($_FILES['image']['tmp_name'], 'images/' . $file_name);
			$inserted = "Data inserted successfully.";
		} else {
			$insert_fail = "Data insert failed.";
		}
	}
}


?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>File</title>
	<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>

	<div class="container mt-5 pt-5">
		<div class="row">
			<div class="col-6 offset-3">
				<form action="" method="POST" enctype="multipart/form-data">
					<input class="form-control mb-3" type="text" name="name" placeholder="Enter Your Name">
					<?php if (isset($error['name'])) { echo '<div class="alert alert-warning">' . $error['name'] . '</div>'; } ?>
					<input class="form-control mb-3" type="email" name="email" placeholder="Enter Your E-mail">
					<?php if (isset($error['email'])) { echo '<div class="alert alert-warning">' . $error['email'] . '</div>'; } ?>
					<input class="form-control-file mb-3" type="file" name="image">
					<?php if (isset($error['image'])) { echo '<div class="alert alert-warning">' . $error['image'] . '</div>'; } ?>
					<input class="btn btn-primary mb-3" type="submit" name="send" value="Send">
					<?php if (isset($inserted)) { echo '<div class="alert alert-success">' . $inserted . '</div>'; } ?>
					<?php if (isset($insert_fail)) { echo '<div class="alert alert-warning">' . $insert_fail . '</div>'; } ?>
				</form>
				<table class="table table-striped table-hover mt-5">
					<tr>
						<th>Name</th>
						<th>E-mail</th>
						<th>Image</th>
					</tr>
					<?php
					$view_sql = "SELECT * FROM `students`";
					$result = mysqli_query($conn, $view_sql);
					while ($row = mysqli_fetch_assoc($result)) {
					?>
					<tr>
						<td><?= $row['name'];?></td>
						<td><?= $row['email'];?></td>
						<td>
							<img src="images/<?= $row['image'];?>" style="width: 100px; height: 50px;" alt="Student Image">
						</td>
					</tr>
					<?php
					}
					?>
				</table>
			</div>
		</div>
	</div>
	
</body>
</html>