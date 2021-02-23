	<h3 class="mt-2">Add New User</h3>
	<hr class="my-2">

	<div class="container">
		<div class="row">
			<div class="col-sm-6 offset-sm-3">
				<form action="<?= BASE_URL; ?>/User/addUser" method="POST">
					<?php
					if (isset($add_user)) {
						echo $add_user;
					}
					if (isset($user_errors)) {
						foreach ($user_errors as $key => $value) {
							switch ($key) {
								case 'username':
									$username = $value;
									break;
								case 'password':
									$password = $value;
									break;
								case 'level':
									$level = $value;
									break;
							}
						}
					}
					?>
					<table class="table table-borderless">
						<tr>
							<td class="pt-4">Username</td>
							<td>
								<input class="form-control" type="text" name="username"  placeholder="Enter username">
								<?php  if (isset($username)) {
									foreach ($username as $val) {
										echo $val . "<br>";
									} }
								?>
							</td>
						</tr>
						<tr>
							<td class="pt-4">Username</td>
							<td>
								<input class="form-control" type="password" name="password" placeholder="Enter password">
								<?php  if (isset($password)) {
									foreach ($password as $val) {
										echo $val . "<br>";
									} }
								?>
							</td>
						</tr>
						<tr>
							<td>User Role</td>
							<td>
								<select class="form-control" name="level">
									<option value="">Select Role</option>
									<option value="1">Admin</option>
									<option value="2">Author</option>
									<option value="3">Contributor</option>
								</select>
								<?php  if (isset($level)) {
									foreach ($level as $val) {
										echo $val . "<br>";
									} }
								?>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<input class="btn btn-primary" type="submit" name="add_user" value="Save">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>