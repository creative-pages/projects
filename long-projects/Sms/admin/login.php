<?php 
session_start();
include "dbcon.php";

if (isset($_SESSION['user_login'])) {
	header("location: index.php");
}

if (isset($_POST['login'])) {
	$username = $_POST["username"];
	$password = $_POST["password"];

	$username_check = mysqli_query($dbconn, "SELECT * FROM `users` WHERE `username` = '$username'");
	if (mysqli_num_rows($username_check) == 1) {
		$row = mysqli_fetch_assoc($username_check);
		if ($row["password"] == md5($password)) {
			if ($row["status"] == "active") {
				$_SESSION['user_login'] = $username;
				header("Location: index.php");
			} else {
				$statusIn = "Status does not active.";
			}
			
		} else {
			$passwordErr = "Password does not match.";
		}
	} else {
		$usernameErr = "Username does not match.";
	}
	

}



?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>SMS || Students Manaegment System</title>
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	
	
	<div class="container">
		<h1 class="text-center mt-4">Students Management System.</h1>
		<div class="row">
			<div class="col-sm-4 offset-sm-4">
				<form action="" method="POST" class="mt-5">
					<h3 class="text-center mb-3">Admin Login Form</h3>
					<input class="form-control" type="text" name="username" placeholder="Enter Your Username" value="<?php if (isset($username)) { echo $username; } ?>" required="" >
					<?php if (isset($usernameErr)) { echo '<div class="alert alert-warning mb-0 mt-1">' . $usernameErr . '</div>'; } ?>
					<input class="form-control mt-2" type="password" name="password" placeholder="Enter Your Password" value="<?php if (isset($password)) { echo $password; } ?>" required="">
					<?php if (isset($passwordErr)) { echo '<div class="alert alert-warning mb-0 mt-1">' . $passwordErr . '</div>'; } ?>
					<input class="btn btn-primary float-right mt-2" type="submit" name="login" value="Login">
				</form>
				<?php if (isset($statusIn)) { echo '<div class="alert alert-warning mb-0 mt-5">' . $statusIn . '</div>'; } ?>
				<p class="mt-2">Don't have an account?<br>
				Go for <a href="registration.php" class="font-italic">Registration</a>.</p>
			</div>
		</div>
	</div>
	

	<!-- js files -->
	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>