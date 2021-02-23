<?php 

require_once "classes/user.php";

$user = new User();

if (isset($_POST['save_user'])) {
	$data = $_POST;
	$message = $user->saveUser($data);
}

$show_user = $user->showUser();


?>




<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>OOP</title>
	<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-sm-6 offset-sm-3">
				<form action="" method="POST" class="mt-5">
					<input class="form-control mb-2" type="text" name="name" placeholder="Enter Name">
					<input class="form-control mb-2" type="email" name="email" placeholder="Enter Email">
					<input class="form-control mb-2" type="password" name="password" placeholder="Enter Password">
					<input class="btn btn-primary" type="submit" value="Save User" name="save_user">
				</form>

				<?php if (isset($message)) { echo "<h3>" . $message . "</h3>"; } ?>

				<hr>

				<table class="table table-bordered">
					<tr>
						<th>Name</th>
						<th>Email</th>
						<th>Action</th>
					</tr>
					<?php 
						while ($row = mysqli_fetch_assoc($show_user)) {
					?>
					<tr>
						<td><?= $row['name']; ?></td>
						<td><?= $row['email']; ?></td>
						<td>
							<a class="btn btn-warning" href="edit.php?id=<?= $row['id']; ?>">Edit</a>
							<a class="btn btn-danger" href="delete.php?id=<?= $row['id']; ?>">Delete</a>
						</td>
					</tr>
					<?php
						}
					?>
				</table>
			</div>
		</div>
	</div>
	
</body>
</html>