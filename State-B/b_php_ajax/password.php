<?php include_once 'inc/header.php'; ?>

<h3 class="text-center">Create a show password button</h3>
<hr>

<div class="container">
	<div class="row">
		<div class="col-sm-4 offset-sm-4">
			<form action="" method="POST">
				<label for="username">Username:</label>
				<input type="text" name="username" id="username" class="form-control" placeholder="Enter your username">
				<label for="password">Password:</label>
				<input type="password" name="password" id="password" class="form-control" placeholder="Enter your password">
				<button type="button" class="btn btn-primary btn-sm mt-2" name="show_password" id="show_password">Show Password</button>
			</form>
		</div>
	</div>
</div>


<?php include_once 'inc/footer.php'; ?>