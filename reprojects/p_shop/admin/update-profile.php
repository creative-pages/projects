<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php
$id = Session::get('userId');
$userProfile = $adminLogin->userProfile($id);
$user_profile = $userProfile->fetch_assoc();
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_user'])) {
	$updateMsg = $adminLogin->updateUser($_POST);
}

?>
<div class="grid_10">
	<div class="box round first grid">
		<h2>Update Your Profile</h2>
		<div class="block">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 offset-sm-3">
						<form action="" method="POST" enctype="multipart/form-data">
							<?php if (isset($updateMsg)) { echo $updateMsg; } ?>
							<table class="table table-borderless">
								<tr>
									<input type="hidden" name="userId" value="<?= $user_profile['id']; ?>">
									<input type="hidden" name="old_file" value="<?= $user_profile['image']; ?>">
									<td class="pt-4">Name</td>
									<td>
										<input class="form-control" type="text" name="name" value="<?= $user_profile['name']; ?>">
										<?php if (isset($adminLogin->name)) { echo $adminLogin->name; } ?>
									</td>
								</tr>
								<tr>
									<td class="pt-4">Username</td>
									<td>
										<input class="form-control" type="text" name="username" value="<?= $user_profile['username']; ?>">
										<?php if (isset($adminLogin->username)) { echo $adminLogin->username; } ?>
									</td>
								</tr>
								<tr>
									<td class="pt-4">Email</td>
									<td>
										<input class="form-control" type="text" name="email" value="<?= $user_profile['email']; ?>">
										<?php if (isset($adminLogin->email)) { echo $adminLogin->email; } ?>
									</td>
								</tr>
								<tr>
									<td class="pt-4">Password</td>
									<td>
										<input class="form-control" type="password" name="password" value="<?= $user_profile['password']; ?>">
										<?php if (isset($adminLogin->password)) { echo $adminLogin->password; } ?>
									</td>
								</tr>
								<tr>
									<td class="pt-4">Image</td>
									<td>
										<input class="form-control" type="file" name="image">
										<img style="width: 250px;" src="uploads/users/<?= $user_profile['image']; ?>" alt="">
										<?php if (isset($adminLogin->image)) { echo $adminLogin->image; } ?>
									</td>
								</tr>
								<tr>
									<td>Level</td>
									<td>
										<?php
										if ($user_profile['level'] == '1') {
											echo "Admin";
										} elseif ($user_profile['level'] == '2') {
											echo "Author";
										} else {
											echo "Editor";
										}
										?>
									</td>
								</tr>
								<tr>
									<td></td>
									<td>
										<input class="btn btn-primary" type="submit" value="Update" name="update_user">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php include 'inc/footer.php';?>