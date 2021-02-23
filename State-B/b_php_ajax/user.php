<?php include_once 'inc/header.php'; ?>

<h3 class="text-center">Check username availability</h3>
<hr>

<div class="container">
	<div class="row">
		<div class="col-sm-4 offset-sm-4">
			<form action="" method="POST">
				<label for="username">Username:</label>
				<input type="text" name="username" id="username" class="form-control" placeholder="Enter your username">
			</form>
			<div id="userstatus"></div>
		</div>
	</div>
</div>


<?php include_once 'inc/footer.php'; ?>