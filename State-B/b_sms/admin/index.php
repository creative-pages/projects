<?php 
require_once "dbconn.php";

session_start();

if (isset($_GET['action']) && $_GET['action'] == 'logout') {
	session_start();
	session_destroy();
	header("Location: login.php");
}

if (!isset($_SESSION['user_email'])) {
	header("Location: login.php");
}

// user information
$user_email = $_SESSION['user_email'];
$user_info = mysqli_query($conn, "SELECT * FROM `users` WHERE `email` = '$user_email'");
$user_info_result = mysqli_fetch_assoc($user_info);

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>SMS || Welcome To Dashboard</title>
	<link rel="stylesheet" href="../css/bootstrap.css">
	<link rel="stylesheet" href="../css/fontawesome.min-all.css">
	<link rel="stylesheet" href="../css/dataTables.bootstrap4.min.css">
</head>
<body>
	<div class="container-fluid bg-light">
		<nav class="navbar navbar-expand-sm">
			<a class="navbar-brand" href="index.php">
	          <h3 class="mb-0">SMS</h3>
	      	</a>
	      	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	        	<span class="navbar-toggler-icon"></span>
	      	</button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item">
                <a class="nav-link text-secondary" href="index.php?page=user_profile">Welcome: <i class="fa fa-user"></i> <?= $user_info_result['name']; ?></a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-secondary" href="index.php?page=add_user"><i class="fa fa-user-plus"></i> Add User</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-secondary" href="index.php?page=user_profile"><i class="fa fa-user"></i> Profile</a>
              </li>
              <li class="nav-item">
              	<a class="nav-link text-secondary" href="index.php?action=logout"><i class="fa fa-power-off"></i> Logout</a>
              </li>
            </ul>
          </div>
        </nav>
	</div>
	<div class="container-fluid mt-3">
		<div class="row">
			<div class="col-sm-3">
				<div class="list-group">
					<a href="index.php?page=dashboard" class="list-group-item active text-decoration-none"><i class="fa fa-home"></i> Dashboard</a>
					<a href="index.php?page=add_student" class="list-group-item text-decoration-none"><i class="fa fa-user-plus"></i> Add Student</a>
					<a href="index.php?page=all_students" class="list-group-item text-decoration-none"><i class="fa fa-users"></i> All Students</a>
					<a href="index.php?page=all_users" class="list-group-item text-decoration-none"><i class="fa fa-users"></i> All Users</a>
				</div>
			</div>
			<div class="col-sm-9" style="min-height: 500px;">
				<?php 
				if (isset($_GET['page'])) {
					$page = $_GET['page'] . '.php';
				} else {
					$page = 'dashboard.php';
				}
				
				if (file_exists($page)) {
					require_once $page;
				} else {
					echo '<br><br><br><br><br><br><br>';
					echo '<h1 class="text-center text-danger">404</h1>';
					echo '<h1 class="text-center">File Not Found!</h1>';
				}
				?>
			</div>
		</div>
	</div>
	<footer class="bg-primary text-white py-3 mt-4">
		<div class="container">
			<p class="mb-0 text-center">Copyright &copy; <?= date("Y"); ?> - Students Management System. All Rights Are Reserver.</p>
		</div>
	</footer>

	<!-- script file -->
	<script src="../js/jquery-3.5.1.js"></script>
	<script src="../js/jquery.dataTables.min.js"></script>
	<script src="../js/dataTables.bootstrap4.min.js"></script>
	<script>
		$(document).ready(function() {
		    $('#data').DataTable();
		} );
	</script>
</body>
</html>