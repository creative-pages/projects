<?php
	if (isset($_POST['input_month'])) {
		$mont = $_POST['month'];
		
			switch (strtolower($mont)) {
				case 'january':
					$months = "January has 31 days.";
					break;
				case 'february':
					$months = "Normally February has 28 days. But in Leap Year February has 29 days.";
					break;
				case 'march':
					$months = "March has 31 days.";
					break;
				case 'april':
					$months = "April has 30 days.";
					break;
				case 'may':
					$months = "May has 31 days.";
					break;
				case 'june':
					$months = "June has 30 days.";
					break;
				case 'july':
					$months = "July has 31 days.";
					break;
				case 'august':
					$months = "August has 31 days.";
					break;
				case 'september':
					$months = "September has 30 days.";
					break;
				case 'october':
					$months = "October has 31 days.";
					break;
				case 'november':
					$months = "November has 30 days.";
					break;
				case 'december':
					$months = "December has 31 days.";
					break;
				default:
					$months = "Invalid";
					break;
			}
		}
 
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Month To Days</title>
		<link rel="stylesheet" href="css/bootstrap.css">
	</head>
	<body>
		<div class="container mt-5 pt-5">
			<h1 class="bg-success p-2 mb-5 text-center text-white">Check total number of days in a month.</h1>
			<form action="" method="POST">
				<input type="text" name="month" placeholder="Input any month" class="form-control">
				<input type="submit" name="input_month" class="btn btn-primary mb-5 mt-3">
			</form>
			<?php
			if (isset($months)) {
				echo '<h2 class="bg-primary text-white text-center p-3 mt-3">' . $months . '</h2>';
			}
			?>
		</div>
	</body>
</html>