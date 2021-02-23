<?php 
require_once 'dbconn.php';
session_start();

if (isset($_SESSION['user_email'])) {
	header("Location: index.php");
}

if (isset($_POST['admin_login'])) {
	$email_username = $_POST['email_username'];
	$password = $_POST['password'];

	$input_errors = array();

	if (empty($email_username)) {
		$input_errors['email_username'] = "Email or Username is required!";
	}
	if (empty($password)) {
		$input_errors['password'] = "Password is required!";
	}

	if (count($input_errors) == 0) {
		$email_username_check = mysqli_query($conn, "SELECT * FROM `users` WHERE `email` = '$email_username' || `username` = '$email_username'");
		mysqli_num_rows($email_username_check);
		if (mysqli_num_rows($email_username_check) > 0) {
			$email_username_result = mysqli_fetch_assoc($email_username_check);
			if ($email_username_result['password'] == $password) {
				if ($email_username_result['status'] == 1) {
					$_SESSION['user_email'] = $email_username_result['email'];
					$_SESSION['user_username'] = $email_username_result['username'];
					header("Location: index.php");
				} else {
					$input_errors['status'] = "Your status is not active!";
				}
			} else {
				$input_errors['password'] = "Password is wrong for this Email or Username!";
			}
		} else {
			$input_errors['email_username'] = "Email or Username is not match!";
		}
	}
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>SMS || Admin Login</title>
	<link rel="stylesheet" href="../css/bootstrap.css">
</head>
<body>

	<div class="container">
		<h1 class="text-center mt-5 mb-4">Students Management System</h1>
		<div class="row">
			<div class="col-sm-4 offset-sm-4">
				<h2 class="text-center">Admin Login</h2>
				<hr>
				<form action="" method="POST">
					<input type="text" name="email_username" value="<?= isset($email_username) ? $email_username : ''; ?>" placeholder="Enter Email or Username" class="form-control mt-3">
					<?php if (isset($input_errors['email_username'])) { echo '<div class="alert alert-warning mb-0">' . $input_errors['email_username'] . '</div>'; } ?>
					<input type="password" name="password" placeholder="Enter Password" class="form-control mt-3">
					<?php if (isset($input_errors['password'])) { echo '<div class="alert alert-warning mb-0">' . $input_errors['password'] . '</div>'; } ?>
					<?php if (isset($input_errors['status'])) { echo '<div class="alert alert-warning mb-0">' . $input_errors['status'] . '</div>'; } ?>

					<input type="submit" name="admin_login" class="btn btn-primary float-right mt-3" value="Login">
					<div class="clearfix"></div>
					<p class="mt-2">Don't have an account? Please <a href="registration.php">Register</a></p>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>