<?php 
include "../classes/AdminLogin.php";

$adminLogin = new AdminLogin();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	$adminUser = $_POST['adminUser'];
	$adminPassword = md5($_POST['adminPassword']);
	$loginCheck = $adminLogin->adminLogin($adminUser, $adminPassword);
}

?>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/stylelogin.css" media="screen" />
</head>
<body>
<div class="container">
	<section id="content">
		<form action="login.php" method="post">
			<h1>Admin Login</h1>
			<div>
				<input type="text" placeholder="Username" name="adminUser"/>
			</div>
			<div>
				<input type="password" placeholder="Password" name="adminPassword"/>
				<?php if (isset($loginCheck)) { echo $loginCheck; } ?>
			</div>
			<div>
				<input type="submit" value="Log in" />
			</div>
		</form><!-- form -->
		<div class="button">
			<a href="#">Training with live project</a>
		</div><!-- button -->
	</section><!-- content -->
</div><!-- container -->
</body>
</html>