<?php Session::checkLogin(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Admin Login</title>
	<link rel="stylesheet" href="<?= BASE_URL; ?>css/bootstrap.css">
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-sm-4 offset-sm-4">
				<form action="<?= BASE_URL; ?>Login/login" method="POST" class="border shadow-lg p-3">
					<h2 class="border-bottom text-center pb-2">Admin Login</h2>
					<input class="form-control mb-2" required="" type="text" name="username" placeholder="Enter Your Username">
					<input class="form-control mb-2" required="" type="password" name="password" placeholder="Enter Your Password">
					<input class="btn btn-primary float-right" type="submit" name="login" value="Login">
					<div class="clearfix"></div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>