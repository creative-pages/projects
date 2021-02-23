<?php 
$path = realpath(dirname(__FILE__));
include_once ($path . '/../lib/Session.php');
Session::checkLogin();
include_once ($path . '/../classes/AdminLogin.php');
$adminLogin = new AdminLogin();

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['admin_login'])) {
	$adminLogin->adminLogin($_POST);
}

?>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>Shop || Admin Login</title>
    <link rel="stylesheet" type="text/css" href="css/stylelogin.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" media="screen" />
</head>
<body>
<div class="container">
	<section id="content">
		<form action="" method="post">
			<h1>Admin Login</h1>
			<div>
				<input type="text" placeholder="Username or Email" name="usernameEmail"/>
				<?php if (isset($adminLogin->usernameEmail)) { echo $adminLogin->usernameEmail; } ?>
			</div>
			<div>
				<input type="password" placeholder="Password" name="password"/>
				<?php if (isset($adminLogin->password)) { echo $adminLogin->password; } ?>
			</div>
			<div>
				<input class="float-none" type="submit" name="admin_login" value="Log in" />
			</div>
		</form><!-- form -->
		<div class="button">
			<a href="#">Training with live project</a>
		</div><!-- button -->
	</section><!-- content -->
</div><!-- container -->
</body>
</html>