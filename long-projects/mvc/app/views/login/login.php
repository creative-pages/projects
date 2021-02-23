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
		<div class="container my-5">
			<div class="row">
				<div class="col-sm-4 offset-sm-4 shadow-lg py-3">
					<h2 class="mb-4 border-bottom border-primary text-center pb-2">MVC || Admin Login</h2>
					<form method="POST" action="<?= BASE_URL; ?>/Login/loginAuth">
						<input class="form-control mb-3" type="text" name="username" placeholder="Enter your username">
						<input class="form-control mb-3" type="password" name="password" placeholder="Enter your password">
						<input class="btn btn-primary float-right" type="submit" name="login" value="Login">
					</form>
				</div>
			</div>
		</div>
	</body>
</html>