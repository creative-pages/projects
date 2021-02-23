<h1 class="text-primary mt-3">
<i class="fa fa-user-plus mr-1"></i>Update Student <small>Update Student</small>
</h1>
<ol class="breadcrumb">
	<li class="breadcrumb-item">
		<a href="index.php"><i class="fa fa-tachometer-alt mr-1"></i>Dashboard</a>
	</li>
	<li class="breadcrumb-item">
		<a href="index.php?page=all-student"><i class="fa fa-users mr-1"></i>All Students</a>
	</li>
	<li class="breadcrumb-item active"><i class="fa fa-user-plus mr-1"></i>Update Student</li>
</ol>


<?php 


$id = base64_decode($_GET['id']);

$up_sql = mysqli_query($dbconn, "SELECT * FROM `students` WHERE `id` = '$id'");
$row = mysqli_fetch_assoc($up_sql);

if (isset($_POST['update_student'])) {
	$name = $_POST['name'];
	$roll = $_POST['roll'];
	$class = $_POST['class'];
	$city = $_POST['city'];
	$phone = $_POST['phone'];


	$inputErr = array();
	if (empty($name)) {
		$inputErr["name"] = "Name is required.";
	}
	if (empty($roll)) {
		$inputErr["roll"] = "Roll is required.";
	}
	if (empty($class)) {
		$inputErr["class"] = "Class is required.";
	}
	if (empty($city)) {
		$inputErr["city"] = "City is required.";
	}
	if (empty($phone)) {
		$inputErr["phone"] = "Phone Number is required.";
	}


	if (count($inputErr) == 0) {
		$result = mysqli_query($dbconn, "UPDATE `students` SET `name`= '$name',`roll`= '$roll',`class`= '$class',`city`= '$city',`p_contact`= '$phone' WHERE `id` = '$id'");
		if ($result) {
			$updateSucc = "Data updated successfully.";
			header("Location: index.php?page=all-student");
		} else {
			$updateErr = "Data does not update.";
		}
		
	}
	

}


?>


<div class="row">
	<div class="col-sm-8 offset-sm-2">
		<?php if (isset($updateSucc)) { echo '<div class="alert alert-success mb-0 mt-1">' . $updateSucc . '</div>'; } ?>
		<?php if (isset($updateErr)) { echo '<div class="alert alert-warning mb-0 mt-1">' . $updateErr . '</div>'; } ?>
		<form action="" method="POST" enctype="multipart/form-data">
			<div class="from-group row">
				<label class="col-sm-2 col-form-label mt-3" for="name">Name</label>
				<div class="col-sm-10">
					<input class="form-control mt-3" type="text" name="name" id="name" placeholder="Enter Your Name" value="<?php if (isset($row['name'])) { echo $row['name']; } ?>">
					<?php if (isset($inputErr["name"])) { echo '<div class="alert alert-warning mb-0 mt-1">' . $inputErr["name"] . '</div>'; } ?>
				</div>
			</div>
			<div class="from-group row">
				<label class="col-sm-2 col-form-label mt-3" for="roll">Roll</label>
				<div class="col-sm-10">
					<input class="form-control mt-3" type="text" name="roll" id="roll" placeholder="Enter Your Roll" pattern="[0-9]{6}" value="<?php if (isset($row['roll'])) { echo $row['roll']; } ?>">
					<?php if (isset($inputErr["roll"])) { echo '<div class="alert alert-warning mb-0 mt-1">' . $inputErr["roll"] . '</div>'; } ?>
				</div>
			</div>
			<div class="from-group row">
				<label class="col-sm-2 col-form-label mt-3" for="class">Class</label>
				<div class="col-sm-10">
					<select class="form-control mt-3" name="class" id="class">
						<option value="0">Select</option>
						<option <?php echo $row['class'] == '5' ? 'selected=""' : ''; ?> value="5">Five</option>
						<option <?php echo $row['class'] == '6' ? 'selected=""' : ''; ?> value="6">Six</option>
						<option <?php echo $row['class'] == '7' ? 'selected=""' : ''; ?> value="7">Seven</option>
						<option <?php echo $row['class'] == '8' ? 'selected=""' : ''; ?> value="8">Eight</option>
					</select>
					<?php if (isset($inputErr["class"])) { echo '<div class="alert alert-warning mb-0 mt-1">' . $inputErr["class"] . '</div>'; } ?>
				</div>
			</div>
			<div class="from-group row">
				<label class="col-sm-2 col-form-label mt-3" for="city">City</label>
				<div class="col-sm-10">
					<input class="form-control mt-3" type="text" name="city" id="city" placeholder="Enter Your City" value="<?php if (isset($row['city'])) { echo $row['city']; } ?>">
					<?php if (isset($inputErr["city"])) { echo '<div class="alert alert-warning mb-0 mt-1">' . $inputErr["city"] . '</div>'; } ?>
				</div>
			</div>
			<div class="from-group row">
				<label class="col-sm-2 col-form-label mt-3" for="phone">Phone</label>
				<div class="col-sm-10">
					<input class="form-control mt-3" type="text" name="phone" id="phone" placeholder="Enter Your Phone Number" pattern="01[3|4|5|6|7|8|9][0-9]{8}" value="<?php if (isset($row['p_contact'])) { echo $row['p_contact']; } ?>">
					<?php if (isset($inputErr["phone"])) { echo '<div class="alert alert-warning mb-0 mt-1">' . $inputErr["phone"] . '</div>'; } ?>
				</div>
			</div>
			<div class="from-group row">
				<label class="col-sm-2 col-form-label"></label>
				<div class="col-sm-10">
					<input class="btn btn-primary mt-3" type="submit" name="update_student" value="Update Student">
				</div>
			</div>
		</form>
	</div>
</div>