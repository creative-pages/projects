<?php 
require_once 'dbconn.php';

if (isset($_POST['update_user'])) {
	$user_id = $_POST['user_id'];

	$name = $_POST['name'];
	$email = $_POST['email'];
	$username = $_POST['username'];
	$password = $_POST['password'];
	$c_password = $_POST['c_password'];


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

	if (count($input_errors) == 0) {
		$email_check = mysqli_query($conn, "SELECT * FROM `users` WHERE `email` = '$email'");
		$self_email = mysqli_query($conn, "SELECT * FROM `users` WHERE `id` = '$user_id'");
		$self_email_result = mysqli_fetch_assoc($self_email);
		if (mysqli_num_rows($email_check) == 0 OR $self_email_result['email'] == $email) {
			$username_check = mysqli_query($conn, "SELECT * FROM `users` WHERE `username` = '$username'");
			$self_username = mysqli_query($conn, "SELECT * FROM `users` WHERE `id` = '$user_id'");
			$self_username_result = mysqli_fetch_assoc($self_username);
			if (mysqli_num_rows($username_check) == 0 OR $self_username_result['username'] == $username) {
				if (strlen($username) > 5) {
					if (strlen($password) > 5) {
						if ($password == $c_password) {
							$result = mysqli_query($conn, "UPDATE `users` SET `name`= '$name',`email`= '$email',`username`= '$username',`password`= '$password' WHERE `id` = '$user_id'");
							if ($result) {
								$success = "User added successfully.";
								session_destroy();
								header("Location: login.php");
							} else {
								$error = "User updated failed!";
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

<h1 class="text-primary">
	<a href="index.php" class="text-decoration-none"><i class="fa fa-home"></i> Dashboard</a>
	<small class="text-secondary">Statistics Overview</small>
</h1>
<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="index.php" class="text-decoration-none"><i class="fa fa-home"></i> Home</a></li>
	<li class="breadcrumb-item">All Students</li>
</ol>

<div class="row">
	<div class="col-sm-6 offset-sm-3">
		<?php if (isset($success)) { echo '<div class="alert alert-success">' . $success . '</div>'; } elseif (isset($error)) { echo '<div class="alert alert-warning">' . $error . '</div>'; }
		?>
		<form action="" method="POST" enctype="multipart/form-data">
			<div class="form-group row">
				<label for="name" class="label-control col-sm-3 mt-2">Name</label>
				<div class="col-sm-9">
					<input type="hidden" name="user_id" value="<?= $user_info_result['id']; ?>">
					<input type="text" class="form-control" name="name" id="name" value="<?= $user_info_result['name']; ?>" placeholder="Enter Name">
					<?php if (isset($input_errors['name'])) { echo '<div class="alert alert-warning mb-0">' . $input_errors['name'] . '</div>'; } ?>
				</div>
			</div>
			<div class="form-group row">
				<label for="email" class="label-control col-sm-3 mt-2">Email</label>
				<div class="col-sm-9">
					<input type="email" class="form-control" name="email" id="email" value="<?= $user_info_result['email']; ?>" placeholder="Enter Email">
					<?php if (isset($input_errors['email'])) { echo '<div class="alert alert-warning mb-0">' . $input_errors['email'] . '</div>'; } ?>
				</div>
			</div>
			<div class="form-group row">
				<label for="username" class="label-control col-sm-3 mt-2">Username</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" name="username" id="username" value="<?= $user_info_result['username']; ?>" placeholder="Enter Username">
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
				<div class="col-sm-9 offset-sm-3">
					<input type="submit" class="btn btn-primary" name="update_user" value="Update">
				</div>
			</div>
		</form>
	</div>
</div>