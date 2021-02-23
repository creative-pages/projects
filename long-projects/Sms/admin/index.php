<?php
require_once "dbcon.php";
session_start();
if (!isset($_SESSION['user_login'])) {
	header("location: login.php");
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>SMS || Dashboard</title>
		<link rel="stylesheet" href="../css/bootstrap.css">
		<link rel="stylesheet" href="../css/fontawesome-all.css">
		<link rel="stylesheet" href="../css/dataTables.bootstrap4.min.css">
		<link rel="stylesheet" href="../css/style.css">
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="index.php">SMS</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link" href="#"><i class="fa fa-user mr-1"></i>Welcome: Arif Hossain</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="registration.php"><i class="fa fa-user-plus mr-1"></i>Add User</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="index.php?page=user-profile"><i class="fa fa-user mr-1"></i>Profile</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="logout.php"><i class="fa fa-power-off mr-1"></i>Logout</a>
					</li>
				</ul>
			</div>
		</nav>
		
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-3">
					<div class="list-group">
						<a href="index.php?page=dashboard" class="list-group-item list-group-item-action active">
							<i class="fa fa-tachometer-alt mr-1"></i>Dashboard
						</a>
						<a href="index.php?page=add-student" class="list-group-item list-group-item-action">
							<i class="fa fa-user-plus mr-1"></i>Add Student
						</a>
						<a href="index.php?page=all-student" class="list-group-item list-group-item-action">
							<i class="fa fa-users mr-1"></i>All Student
						</a>
						<a href="index.php?page=all-user" class="list-group-item list-group-item-action">
							<i class="fa fa-user mr-1"></i>All User
						</a>
					</div>
				</div>
				<div class="col-sm-9" style="min-height: 500px;">
					

					<?php 

						if (isset($_GET['page'])) {
							$page = $_GET['page']. ".php";
						} else {
							$page = "dashboard.php";
						}
						

						if (file_exists($page)) {
							require_once "$page";
						} else {
							require_once "404.php";
						}
						
					 ?>


				</div>
			</div>
		</div>
		<footer class="py-3 bg-success">
			<div class="container">
				<p class="text-center text-white mb-0">Copyright &copy; <?php echo date("Y"); ?> Students Management System. All Rights Are Reserved.</p>
			</div>
		</footer>
		<script src="../js/jquery-3.3.1.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/jquery.dataTables.min.js"></script>
		<script src="../js/dataTables.bootstrap4.min.js"></script>
		<script src="../js/main.js"></script>
		
	</body>
</html>