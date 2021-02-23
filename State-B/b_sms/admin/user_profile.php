
<?php 

if (isset($_POST['image_update'])) {
	$old_file = $user_info_result['image'];
	$id = $user_info_result['id'];

	$photo = $_FILES['image']['name'];
	$photo_exp = explode('.', $photo);
	$photo_ext = end($photo_exp);
	$image = date('ymdhis') . '.' . $photo_ext;

	if ($photo) {
		$result = mysqli_query($conn, "UPDATE `users` SET `image` = '$image' WHERE `id` = '$id'");
		if ($result) {
			unlink('../images/' . $old_file);
			move_uploaded_file($_FILES['image']['tmp_name'], '../images/' . $image);
			header("Location: index.php?page=user_profile");
		} else {
			$img_update_error = "Image update failed!";
		}
	}
}

?>

<h1 class="text-primary">
	<a href="index.php" class="text-decoration-none"><i class="fa fa-home"></i> Dashboard</a>
	<small class="text-secondary">Statistics Overview</small>
</h1>
<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="index.php" class="text-decoration-none"><i class="fa fa-home"></i> Home</a></li>
	<li class="breadcrumb-item">User Profile</li>
</ol>

<div class="row">
	<div class="col-sm-6">
		<table class="table table-bordered table-striped table-hover">
			<tr>
				<td>User ID</td>
				<td><?= $user_info_result['id']; ?></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><?= $user_info_result['name']; ?></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><?= $user_info_result['email']; ?></td>
			</tr>
			<tr>
				<td>Username</td>
				<td><?= $user_info_result['username']; ?></td>
			</tr>
			<tr>
				<td>Sign Up</td>
				<td><?= date("d-M-Y", strtotime($user_info_result['date_time'])); ?></td>
			</tr>
		</table>
		<a href="index.php?page=update_user" class="btn btn-primary float-right">Update Profile</a>
	</div>
	<div class="col-sm-6">
		<img style="width: 308px; height: 200px;" src="../images/<?= $user_info_result['image']; ?>" alt="">
		
		<form action="" method="POST" enctype="multipart/form-data">
			<h3 class="my-1"><label for="image">Photo</label></h3>
			<input type="file" name="image" class="form-control" id="image" style="width: 65%;" required="">
			<?php 
			if (isset($img_update_error)) {
				echo '<div class="alert alert-warning mb-0 mt-2">' . $img_update_error . '</div>';
			}
			?>
			<input type="submit" class="btn btn-primary mt-2" value="Upload" name="image_update">
		</form>
	</div>
</div>