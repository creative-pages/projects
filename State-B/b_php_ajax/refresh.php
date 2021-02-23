<?php include_once 'inc/header.php'; ?>

<h3 class="text-center">Auto refresh div content</h3>
<hr>

<div class="container">
	<div class="row">
		<div class="col-sm-4 offset-sm-4">
			<form action="" method="POST">
				<label for="username">Content:</label>
				<textarea name="content" id="content" class="form-control" rows="5" placeholder="Write content"></textarea>
				<input type="submit" name="autosubmit" class="btn btn-primary mt-2" id="autosubmit" value="Post">
			</form>
			<br>
			<div id="contentstatus"></div>
		</div>
	</div>
</div>


<?php include_once 'inc/footer.php'; ?>