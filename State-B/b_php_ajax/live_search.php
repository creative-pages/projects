<?php include_once 'inc/header.php'; ?>

<h3 class="text-center">Live data search</h3>
<hr>

<div class="container">
	<div class="row">
		<div class="col-sm-4 offset-sm-4">
			<form action="" method="POST">
				<label for="livesearch">Type Keyword:</label>
				<input type="text" name="livesearch" id="livesearch" class="form-control" placeholder="Enter your keyword">
			</form>
			<div id="livestatus"></div>
		</div>
	</div>
</div>


<?php include_once 'inc/footer.php'; ?>