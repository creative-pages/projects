<div class="container">
	<h2>Category List</h2>
	<hr>

	<?php 
	foreach ($cat as $value) {
		echo $value['name'] . "<br>";
	}
	?>
</div>