<?php include_once 'inc/header.php'; ?>

<h3 class="text-center">Auto complete textbox</h3>
<hr>

<div class="container">
	<div class="row">
		<div class="col-sm-4 offset-sm-4">
			<form action="" method="POST">
				<label for="skill">Skill:</label>
				<input type="text" name="skill" id="skill" class="form-control" placeholder="Enter your skill">
			</form>
			<div id="skillstatus"></div>
		</div>
	</div>
</div>


<?php include_once 'inc/footer.php'; ?>