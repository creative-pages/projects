<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add_user'])) {
	$addUser = $adminLogin->addUser($_POST);
}

?>
<div class="grid_10">
	<div class="box round first grid">
		<h2>Add New User</h2>
		<div class="block">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 offset-sm-3">
						<form action="" method="POST">
							<?php if (isset($addUser)) { echo $addUser; } ?>
							<table class="table table-borderless">
								<tr>
									<td class="pt-4">Username</td>
									<td>
										<input class="form-control" type="text" name="username" placeholder="Enter username">
										<?php if (isset($adminLogin->username)) { echo $adminLogin->username; } ?>
									</td>
								</tr>
								<tr>
									<td class="pt-4">Password</td>
									<td>
										<input class="form-control" type="password" name="password" placeholder="Enter password">
										<?php if (isset($adminLogin->password)) { echo $adminLogin->password; } ?>
									</td>
								</tr>
								<tr>
									<td>Level</td>
									<td>
										<select class="form-control" name="level">
											<option value="">Select Role</option>
											<option value="1">Admin</option>
											<option value="2">Author</option>
											<option value="3">Editor</option>
										</select>
										<?php if (isset($adminLogin->level)) { echo $adminLogin->level; } ?>
									</td>
								</tr>
								<tr>
									<td></td>
									<td>
										<input class="btn btn-primary" type="submit" value="Add New User" name="add_user">
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