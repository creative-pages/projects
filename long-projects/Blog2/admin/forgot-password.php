<?php 
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . "/../classes/AdminLogin.php");
$adminlogin = new AdminLogin();
if ($_SERVER['REQUEST_METHOD'] = 'POST' && isset($_POST['send_mail'])) {
	$recoveryMsg = $adminlogin->passwordRecovery($_POST);
}

?>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>Password Recovery</title>
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
			<h1>Password Recovery</h1>
			<div> 
				<input type="email" placeholder="Enter Your Email" name="email"/>
			</div>
			<div>
				<?php if (isset($recoveryMsg)) { echo $recoveryMsg; } ?>
			</div>
			<div>
				<input type="submit" name="send_mail" value="Send Mail" />
			</div>
		</form>
		<div class="button">
			<a href="login.php">Login</a>
		</div>
		<div class="button">
			<a href="#">Training with live project</a>
		</div><!-- button -->
	</section><!-- content -->
</div><!-- container -->
</body>
</html>