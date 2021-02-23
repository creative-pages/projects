<h1 class="text-primary mt-3">
<i class="fa fa-user mr-1"></i>User Profile <small>User Profile</small>
</h1>
<ol class="breadcrumb">
	<li class="breadcrumb-item">
		<a href="index.php"><i class="fa fa-tachometer-alt mr-1"></i>Dashboard</a>
	</li>
	<li class="breadcrumb-item active"><i class="fa fa-user mr-1"></i>User Profile</li>
</ol>
<?php
$session_user = $_SESSION['user_login'];
$user_data = mysqli_query($dbconn, "SELECT * FROM `users` WHERE `username` = '$session_user'");
$row = mysqli_fetch_assoc($user_data);
?>
<div class="row">
	<div class="col-sm-6">
		<table class="table table-bordered">
			<tr>
				<td>User Id</td>
				<td><?= $row['id']; ?></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><?= ucwords($row['name']); ?></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><?= $row['email']; ?></td>
			</tr>
			<tr>
				<td>Username</td>
				<td><?= $row['username']; ?></td>
			</tr>
			<tr>
				<td>Status</td>
				<td><?= ucwords($row['status']); ?></td>
			</tr>
			<tr>
				<td>Signup Date</td>
				<td><?= $row['date_time']; ?></td>
			</tr>
		</table>
		<a class="btn btn-primary float-right btn-sm" href="#">Edit Profile</a>
	</div>
	<div class="col-sm-6">
		<a href="">
			<img src="images/<?= $row['photo']; ?>" class="img-thumbnail" alt="Image">
		</a>
		<?php
		if (isset($_POST['upload'])) {
			$photo = explode(".", $_FILES['photo']['name']);
			$extension = end($photo);
			$photo_name = $session_user . "." . $extension;

			$up_photo = mysqli_query($dbconn, "UPDATE `users` SET `photo`= '$photo_name' WHERE `username` = '$session_user'");
			if ($up_photo) {
				move_uploaded_file($_FILES['photo']['tmp_name'], "images/".$photo_name);
			}
			
		}
		
		?>
		<form action="" method="POST" enctype="multipart/form-data">
			<h4 class="mt-3">Profile Picture</h4>
			<div class="custom-file">
				<input class="mt-2" type="file" class="custom-file-input" id="photo" name="photo" required="">
				<label class="custom-file-label mt-2" for="photo">Choose file</label>
				<br>
				<br>
				<input class="btn btn-primary mb-5" type="submit" value="Upload" name="upload">
			</div>
		</form>
	</div>
</div>