<?php 

require_once "classes/user.php";

$user = new User();

$id = $_GET["id"];

$edit_user = $user->editUser($id);

$edit_user = mysqli_fetch_assoc($edit_user);

if (isset($_POST["update_user"])) {
	$user->editUserSave($_POST);
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Edit User</title>
	<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-sm-6 offset-sm-3">
				<form action="" method="POST" class="mt-5">
					<input type="hidden" name="id" value="<?= $edit_user['id']; ?>">
					<input class="form-control mb-2" type="text" name="name" value="<?= $edit_user['name']; ?>">
					<input class="form-control mb-2" type="email" name="email" value="<?= $edit_user['email']; ?>">
					<input class="form-control mb-2" type="password" name="password" placeholder="Enter Password">
					<input class="btn btn-primary" type="submit" value="Update User" name="update_user">
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>