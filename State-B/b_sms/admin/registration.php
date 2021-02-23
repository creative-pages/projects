<?php 
require_once 'dbconn.php';

if (isset($_POST['admin_register'])) {
	$name = $_POST['name'];
	$email = $_POST['email'];
	$username = $_POST['username'];
	$password = $_POST['password'];
	$c_password = $_POST['c_password'];

	$photo = $_FILES['image']['name'];
	$photo_exp = explode('.', $photo);
	$photo_ext = end($photo_exp);
	$image = date('ymdhis') . '.' . $photo_ext;

	$input_errors = array();

	if (empty($name)) {
		$input_errors['name'] = "Name is required!";
	}
	if (empty($email)) {
		$input_errors['email'] = "Email is required!";
	}
	if (empty($username)) {
		$input_errors['username'] = "Username is required!";
	}
	if (empty($password)) {
		$input_errors['password'] = "Password is required!";
	}
	if (empty($c_password)) {
		$input_errors['c_password'] = "Confirm Password is required!";
	}
	if (empty($photo)) {
		$input_errors['image'] = "Image is required!";
	}

	if (count($input_errors) == 0) {
		$email_check = mysqli_query($conn, "SELECT * FROM `users` WHERE `email` = '$email'");
		$username_check = mysqli_query($conn, "SELECT * FROM `users` WHERE `username` = '$username'");
		if (mysqli_num_rows($email_check) == 0) {
			if (mysqli_num_rows($username_check) == 0) {
				if (strlen($username) > 5) {
					if (strlen($password) > 5) {
						if ($password == $c_password) {
							$result = mysqli_query($conn, "INSERT INTO `users`(`name`, `email`, `username`, `password`, `image`) VALUES ('$name', '$email', '$username', '$password', '$image')");
							if ($result) {
								move_uploaded_file($_FILES['image']['tmp_name'], '../images/' . $image);
								$success = "Registration successfull.";
							} else {
								$error = "Registration failed!";
							}
						} else{
							$input_errors['c_password'] = "Confirm password does not match!";
						}
					} else {
						$input_errors['password'] = "Password should be minimum 6 characters!";
					}
				} else {
					$input_errors['username'] = "Username should be minimum 6 characters!";
				}
			} else {
				$input_errors['username'] = "This username have already exists!";
			}
		} else {
			$input_errors['email'] = "This email have already exists!";
		}
	}
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>SMS || Admin Registration</title>
	<link rel="stylesheet" href="../css/bootstrap.css">
</head>
<body>

	<div class="container">
		<h1 class="text-center mt-5 mb-4">Students Management System</h1>
		<div class="row">
			<div class="col-sm-6 offset-sm-3">
				<h2 class="text-center">Admin Registration</h2>
				<?php if (isset($success)) { echo '<div class="alert alert-success">' . $success . '</div>'; } elseif (isset($error)) { echo '<div class="alert alert-warning">' . $error . '</div>'; }
				?>
				<hr>
				<form action="" method="POST" enctype="multipart/form-data">
					<div class="form-group row">
						<label for="name" class="label-control col-sm-3 mt-2">Name</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="name" id="name" value="<?= isset($name) ? $name : ''; ?>" placeholder="Enter Name">
							<?php if (isset($input_errors['name'])) { echo '<div class="alert alert-warning mb-0">' . $input_errors['name'] . '</div>'; } ?>
						</div>
					</div>
					<div class="form-group row">
						<label for="email" class="label-control col-sm-3 mt-2">Email</label>
						<div class="col-sm-9">
							<input type="email" class="form-control" name="email" id="email" value="<?= isset($email) ? $email : ''; ?>" placeholder="Enter Email">
							<?php if (isset($input_errors['email'])) { echo '<div class="alert alert-warning mb-0">' . $input_errors['email'] . '</div>'; } ?>
						</div>
					</div>
					<div class="form-group row">
						<label for="username" class="label-control col-sm-3 mt-2">Username</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="username" id="username" value="<?= isset($username) ? $username : ''; ?>" placeholder="Enter Username">
							<?php if (isset($input_errors['username'])) { echo '<div class="alert alert-warning mb-0">' . $input_errors['username'] . '</div>'; } ?>
						</div>
					</div>
					<div class="form-group row">
						<label for="password" class="label-control col-sm-3 mt-2">Password</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" name="password" id="password" placeholder="Enter Password">
							<?php if (isset($input_errors['password'])) { echo '<div class="alert alert-warning mb-0">' . $input_errors['password'] . '</div>'; } ?>
						</div>
					</div>
					<div class="form-group row">
						<label for="c_password" class="label-control col-sm-3 mt-2">Confirm Pass.</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" name="c_password" id="c_password" placeholder="Enter Confirm Password">
							<?php if (isset($input_errors['c_password'])) { echo '<div class="alert alert-warning mb-0">' . $input_errors['c_password'] . '</div>'; } ?>
						</div>
					</div>
					<div class="form-group row">
						<label for="image" class="label-control col-sm-3 mt-2">Image</label>
						<div class="col-sm-9">
							<input type="file" class="form-control" name="image" id="image">
							<?php if (isset($input_errors['image'])) { echo '<div class="alert alert-warning mb-0">' . $input_errors['image'] . '</div>'; } ?>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-9 offset-sm-3">
							<input type="submit" class="btn btn-primary" name="admin_register" value="Register">
						</div>
					</div>
					<p class="text-center">If you have an account, then please <a href="login.php">Login</a>.</p>
					<hr>
					<p class="text-center">Copyright &copy; <?php echo date('Y'); ?> All Rights Reserved.</p>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>