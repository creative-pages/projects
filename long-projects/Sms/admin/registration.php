<?php 
session_start();
include "dbcon.php";


if (isset($_POST['registration'])) {
	$name = $_POST['name'];
	$email = $_POST['email'];
	$username = $_POST['username'];
	$password = $_POST['password'];
	$c_password = $_POST['c_password'];
	$photo = explode(".", $_FILES['photo']['name']);
	$extension = end($photo);
	$photo_name = $username . "." . $extension;


	$inputErr = array();
	if (empty($name)) {
		$inputErr["name"] = "Name is required.";
	}
	if (empty($email)) {
		$inputErr["email"] = "Email is required.";
	}
	if (empty($username)) {
		$inputErr["username"] = "Username is required.";
	}
	if (empty($password)) {
		$inputErr["password"] = "Password is required.";
	}
	if (empty($c_password)) {
		$inputErr["c_password"] = "Confirm password is required.";
	}

	if (count($inputErr) == 0) {
		$email_check = mysqli_query($dbconn, "SELECT * FROM `users` WHERE `email` = '$email'");
		if (mysqli_num_rows($email_check) == 0) {
			$username_check = mysqli_query($dbconn, "SELECT * FROM `users` WHERE `username` = '$username'");
			if (mysqli_num_rows($username_check) == 0) {
				if (strlen($username) >= 8) {
					if (strlen($password) >= 8) {
						if ($password == $c_password) {
							$password = md5($password);
							$sql = "INSERT INTO `users`(`name`, `email`, `username`, `password`, `photo`, `status`) VALUES ('$name', '$email', '$username', '$password', '$photo_name', 'inactive')";
							$result = mysqli_query($dbconn, $sql);
							if (!$result) {
								$_SESSION['insertErr'] = "Data does not insert.";
							} else {
								$_SESSION['insertSucc'] = "Data inserted successfully.";
								move_uploaded_file($_FILES["photo"]["tmp_name"], 'images/'. $photo_name);
								header("Location: registration.php");
							}
							
						} else {
							$inputErr["c_password"] = "Confirm password does not match.";
						}
						
					} else {
						$inputErr["password"] = "Password more than 8 character.";
					}
					
				} else {
					$inputErr["username"] = "Username more than 8 character.";
				}
				
			} else {
				$inputErr["username"] = "This username has been taken.";
			}
		} else {
			$inputErr["email"] = "This email has been taken.";
		}
		
	}
	
	
} 



?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>SMS || Admin Registration</title>
		<link rel="stylesheet" href="../css/bootstrap.min.css">
		<link rel="stylesheet" href="../css/style.css">
	</head>
	<body>
		
		
		<div class="container">
			<h1 class="text-center mt-4">Students Management System.</h1>
			<div class="row">
				<div class="col-sm-6 offset-sm-3">
					<form action="" method="POST" enctype="multipart/form-data" class="mt-5">
					<?php if (isset($_SESSION['insertSucc'])) { echo '<div class="alert alert-success mb-0 mt-1">' . $_SESSION['insertSucc'] . '</div>'; } ?>
					<?php if (isset($_SESSION['insertErr'])) { echo '<div class="alert alert-warning mb-0 mt-1">' . $_SESSION['insertErr'] . '</div>'; } ?>
						<div class="from-group row">
							<label class="col-sm-2 col-form-label mt-3" for="name">Name</label>
							<div class="col-sm-10">
								<input class="form-control mt-3" type="text" name="name" id="name" placeholder="Enter Your Name" value="<?php if (isset($name)) { echo $name; } ?>">
								<?php if (isset($inputErr["name"])) { echo '<div class="alert alert-warning mb-0 mt-1">' . $inputErr["name"] . '</div>'; } ?>
							</div>
						</div>
						<div class="from-group row">
							<label class="col-sm-2 col-form-label mt-3" for="email">Email</label>
							<div class="col-sm-10">
								<input class="form-control mt-3" type="email" name="email" id="email" placeholder="Enter Your Email" value="<?php if (isset($email)) { echo $email; } ?>">
								<?php if (isset($inputErr["email"])) { echo '<div class="alert alert-warning mb-0 mt-1">' . $inputErr["email"] . '</div>'; } ?>
							</div>
						</div>
						<div class="from-group row">
							<label class="col-sm-2 col-form-label mt-3" for="username">Username</label>
							<div class="col-sm-10">
								<input class="form-control mt-3" type="text" name="username" id="username" placeholder="Enter Your Username" value="<?php if (isset($username)) { echo $username; } ?>">
								<?php if (isset($inputErr["username"])) { echo '<div class="alert alert-warning mb-0 mt-1">' . $inputErr["username"] . '</div>'; } ?>
							</div>
						</div>
						<div class="from-group row">
							<label class="col-sm-2 col-form-label mt-3" for="password">Password</label>
							<div class="col-sm-10">
								<input class="form-control mt-3" type="password" name="password" id="password" placeholder="Enter Your Password" value="<?php if (isset($password)) { echo $password; } ?>">
								<?php if (isset($inputErr["password"])) { echo '<div class="alert alert-warning mb-0 mt-1">' . $inputErr["password"] . '</div>'; } ?>
							</div>
						</div>
						<div class="from-group row">
							<label class="col-sm-2 col-form-label" for="c_password">Confirm Password</label>
							<div class="col-sm-10">
								<input class="form-control mt-3" type="password" name="c_password" id="c_password" placeholder="Confirm Your Password" value="<?php if (isset($c_password)) { echo $c_password; } ?>">
								<?php if (isset($inputErr["c_password"])) { echo '<div class="alert alert-warning mb-0 mt-1">' . $inputErr["c_password"] . '</div>'; } ?>
							</div>
						</div>
						<div class="from-group row">
							<label class="col-sm-2 col-form-label mt-2" for="photo">Photo</label>
							<div class="col-sm-10">
								<div class="custom-file">
									<input class="mt-2" type="file" class="custom-file-input" id="photo" name="photo">
									<label class="custom-file-label mt-2" for="photo">Choose file</label>
								</div>
							</div>
						</div>
						<div class="from-group row">
							<label class="col-sm-2 col-form-label"></label>
							<div class="col-sm-10">
								<input class="btn btn-primary mt-3" type="submit" name="registration" value="Registration">
							</div>
						</div>
					</form>
					<h4 class="mt-3">If you have an account? then please <a href="login.php">login</a>.</h4>
				</div>
			</div>
		</div>
		<footer class="mt-4">
			<hr>
			<p class="text-center">Copyright &copy; 2018-<?php echo date("Y"); ?> All Rights Reserved.</p>
		</footer>
		
		<!-- js files -->
		<script src="../js/jquery-3.3.1.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
	</body>
</html>