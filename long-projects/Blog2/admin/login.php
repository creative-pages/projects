<?php 
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . "/../classes/AdminLogin.php");
$adminlogin = new AdminLogin();
if ($_SERVER['REQUEST_METHOD'] = 'POST' && isset($_POST['adminLogin'])) {
	$loginMsg = $adminlogin->adminLogin($_POST);
}

?>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>Admin Login</title>
    <link rel="stylesheet" type="text/css" href="css/stylelogin.css" media="screen" />
    <style>
    	/* my css for admin login */
		.alert {
		  position: relative;
		  padding: 0.75rem 1.25rem;
		  margin: 0px 10px;
		  border: 1px solid transparent;
		  border-radius: 0.25rem;
		}
		.alert-warning {
		  color: #856404;
		  background-color: #fff3cd;
		  border-color: #ffeeba;
		}
		.alert-success {
		  color: #155724;
		  background-color: #d4edda;
		  border-color: #c3e6cb;
		}
    </style>
</head>
<body>
<div class="container">
	<section id="content">
		<form action="" method="POST">
			<h1>Admin Login</h1>
			<div>
				<input type="text" placeholder="Username" name="username"/>
			</div>
			<div> 
				<input type="password" placeholder="Password" name="password"/>
			</div>
			<div>
				<?php if (isset($loginMsg)) { echo $loginMsg; } ?>
			</div>
			<div>
				<input type="submit" name="adminLogin" value="Log in" />
			</div>
		</form>
		<div class="button">
			<a href="forgot-password.php">Forgot Password?</a>
		</div>
		<div class="button">
			<a href="#">Training with live project</a>
		</div><!-- button -->
	</section><!-- content -->
</div><!-- container -->
</body>
</html>