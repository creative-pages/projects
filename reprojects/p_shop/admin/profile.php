<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php
$id = Session::get('userId');
$userProfile = $adminLogin->userProfile($id);
$user_profile = $userProfile->fetch_assoc();
?>
<div class="grid_10">
	<div class="box round first grid">
		<h2>Your Profile</h2>
		<div class="block">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 offset-sm-3">
						<table class="table table-striped table-hover">
							<tr>
								<td>Name</td>
								<td><?= $user_profile['name']; ?></td>
							</tr>
							<tr>
								<td>Username</td>
								<td><?= $user_profile['username']; ?></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><?= $user_profile['email']; ?></td>
							</tr>
							<tr>
								<td>Image</td>
								<td>
									<img style="width: 250px;" src="uploads/users/<?= $user_profile['image']; ?>" alt="">
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
									<a class="btn btn-primary" href="update-profile.php">Update</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php include 'inc/footer.php';?>