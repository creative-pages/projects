<?php include_once 'inc/header.php'; ?>

<h3 class="text-center">Auto save data</h3>
<hr>

<div class="container">
	<div class="row">
		<div class="col-sm-4 offset-sm-4">
			<form action="" method="POST">
				<label for="content">Content:</label>
				<textarea name="content" id="content" class="form-control" rows="5" placeholder="Write content"></textarea>
				<input type="hidden" name="contentid" id="contentid">
			</form>
			<br>
			<div id="autostatus"></div>
		</div>
	</div>
</div>


<?php include_once 'inc/footer.php'; ?>