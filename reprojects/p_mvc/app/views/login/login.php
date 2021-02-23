<?php 
Session::checkLogin();
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Admin Login</title>
	<link rel="stylesheet" href="<?= BASE_URL; ?>/css/bootstrap.css">
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-sm-4 offset-sm-4 border shadow-lg py-3 rounded">
				<h3 class="text-center border-bottom pb-2 mb-4">Admin Login</h3>
				<form action="<?= BASE_URL; ?>/Login/loginAuth" method="POST">
					<input class="form-control mb-2" type="text" name="username" placeholder="Enter your username">
					<input class="form-control mb-2" type="password" name="password" placeholder="Enter your password">
					<input class="btn btn-primary float-right" type="submit" name="admin_login" value="Login">
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>