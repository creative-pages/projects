<?php

	if (isset($_POST['v_c'])) {
		$letter = $_POST['letter'];

		$letter = strtolower($letter);


		if (ctype_alpha($letter) == true) {
			if ($letter == 'a' || $letter == 'e' || $letter == 'i' || $letter == 'o' || $letter == 'u') {
				$result = strtoupper($letter) . " is a vowel.";
			} else {
				$result = strtoupper($letter) . " is a consonant.";
			}
		} else {
			$result = "Invalid";
		}
	}

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Vowel Or Consonant</title>
	<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>

	<div class="container mt-5 pt-5">
		<h1 class="p-2 text-center text-white bg-success mb-5">Check an alphabet is vowel or consonant.</h1>
		<form action="" method="POST">
			<input class="form-control" type="text" name="letter" placeholder="Input Your Letter">
			<input class="btn btn-primary mt-3" type="submit" value="Check" name="v_c">
		</form>
		<?php if (isset($result)) { echo '<h2 class="p-3 text-center bg-primary text-white mt-4">' . $result . '</h2>'; }
		 ?>
	</div>
	
</body>
</html>