<?php 

if (isset($_POST['calculate'])) {
	$date = $_POST["date"];
	$result = explode("-", $date);

		$yearCode = $result[0]-1900;
	$lip = $yearCode/4;
	switch ($yearCode%4) {
		case 0:
			$lip = $lip-1;
			break;
		
		default:
			$lip = $lip;
			break;
	}
		$lipYear = floor($lip);
	$month = $result[1];
		$dayCode = $result[2];
	
	switch ($month) {
		case 1:
			$monCode = 1;
			break;
		case 2:
			$monCode = 4;
			break;
		case 3:
			$monCode = 4;
			break;
		case 4:
			$monCode = 0;
			break;
		case 5:
			$monCode = 2;
			break;
		case 6:
			$monCode = 5;
			break;
		case 7:
			$monCode = 0;
			break;
		case 8:
			$monCode = 3;
			break;
		case 9:
			$monCode = 6;
			break;
		case 10:
			$monCode = 1;
			break;
		case 11:
			$monCode = 4;
			break;
		case 12:
			$monCode = 6;
			break;
	}

	$finalResult = $yearCode + $lipYear + $monCode + $dayCode;
	echo "<br>";
	$weekDays = $finalResult%7;

	switch ($weekDays) {
		case 0:
			$weekDay = "Saturday";
			break;
		case 1:
			$weekDay = "Sunday";
			break;
		case 2:
			$weekDay = "Monday";
			break;
		case 3:
			$weekDay = "Tuesday";
			break;
		case 4:
			$weekDay = "Wednesday";
			break;
		case 5:
			$weekDay = "Thursday";
			break;
		case 6:
			$weekDay = "Friday";
			break;
	}


}

 ?>


 <!DOCTYPE html>
 <html lang="en">
 <head>
 	<meta charset="UTF-8">
 	<title>Date To Day</title>
 	<link rel="stylesheet" href="css/bootstrap.css">
 </head>
 <body>

 	<div class="container">
 		<h2 class="mt-5 text-center">Today is <?php echo date("d-m-Y"); ?></h2>
 		<h2 class="px-2 py-1 bg-primary text-white mt-3 mb-3">Enter Your Date</h2>
 		<form action="" method="POST">
 			<input class="form-control w-25" type="date" name="date">
 			<input class="mt-3 btn btn-primary" type="submit" value="Submit" name="calculate">
 			<?php  if (isset($weekDay)) { echo '<h1 class="mt-3 text-center text-uppercase py-2 px-3 bg-primary text-white">' . $weekDay . '</h1>'; } ?>
 		</form>
 	</div>
 	
 </body>
 </html>