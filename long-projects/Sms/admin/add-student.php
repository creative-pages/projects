<h1 class="text-primary mt-3">
<i class="fa fa-user-plus mr-1"></i>Add Student <small>New Student</small>
</h1>
<ol class="breadcrumb">
	<li class="breadcrumb-item">
		<a href="index.php"><i class="fa fa-tachometer-alt mr-1"></i>Dashboard</a>
	</li>
	<li class="breadcrumb-item active"><i class="fa fa-user-plus mr-1"></i>Add Student</li>
</ol>


<?php 

if (isset($_POST['add_student'])) {
	$name = $_POST['name'];
	$roll = $_POST['roll'];
	$class = $_POST['class'];
	$city = $_POST['city'];
	$phone = $_POST['phone'];

	$photo = explode(".", $_FILES['photo']['name']);
	$extention = end($photo);
	$photo_name = $roll . "." . $extention;

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
		$sql = "INSERT INTO `students`(`name`, `roll`, `class`, `city`, `p_contact`, `photo`) VALUES ('$name', '$roll', '$class', '$city', '$phone', '$photo_name')";
		$result = mysqli_query($dbconn, $sql);
		if ($result) {
			$inserSucc = "Data inserted successfully.";
			move_uploaded_file($_FILES["photo"]["tmp_name"], "student-image/" . $photo_name);
		} else {
			$inserErr = "Data does not insert.";
		}
		
	}
	

}


?>


<div class="row">
	<div class="col-sm-8 offset-sm-2">
		<?php if (isset($inserSucc)) { echo '<div class="alert alert-success mb-0 mt-1">' . $inserSucc . '</div>'; } ?>
		<?php if (isset($inserErr)) { echo '<div class="alert alert-warning mb-0 mt-1">' . $inserErr . '</div>'; } ?>
		<form action="" method="POST" enctype="multipart/form-data">
			<div class="from-group row">
				<label class="col-sm-2 col-form-label mt-3" for="name">Name</label>
				<div class="col-sm-10">
					<input class="form-control mt-3" type="text" name="name" id="name" placeholder="Enter Your Name" value="<?php if (isset($name)) { echo $name; } ?>">
					<?php if (isset($inputErr["name"])) { echo '<div class="alert alert-warning mb-0 mt-1">' . $inputErr["name"] . '</div>'; } ?>
				</div>
			</div>
			<div class="from-group row">
				<label class="col-sm-2 col-form-label mt-3" for="roll">Roll</label>
				<div class="col-sm-10">
					<input class="form-control mt-3" type="text" name="roll" id="roll" placeholder="Enter Your Roll" pattern="[0-9]{6}" value="<?php if (isset($roll)) { echo $roll; } ?>">
					<?php if (isset($inputErr["roll"])) { echo '<div class="alert alert-warning mb-0 mt-1">' . $inputErr["roll"] . '</div>'; } ?>
				</div>
			</div>
			<div class="from-group row">
				<label class="col-sm-2 col-form-label mt-3" for="class">Class</label>
				<div class="col-sm-10">
					<select class="form-control mt-3" name="class" id="class">
						<option value="0">Select</option>
						<option value="5">Five</option>
						<option value="6">Six</option>
						<option value="7">Seven</option>
						<option value="8">Eight</option>
					</select>
					<?php if (isset($inputErr["class"])) { echo '<div class="alert alert-warning mb-0 mt-1">' . $inputErr["class"] . '</div>'; } ?>
				</div>
			</div>
			<div class="from-group row">
				<label class="col-sm-2 col-form-label mt-3" for="city">City</label>
				<div class="col-sm-10">
					<input class="form-control mt-3" type="text" name="city" id="city" placeholder="Enter Your City" value="<?php if (isset($city)) { echo $city; } ?>">
					<?php if (isset($inputErr["city"])) { echo '<div class="alert alert-warning mb-0 mt-1">' . $inputErr["city"] . '</div>'; } ?>
				</div>
			</div>
			<div class="from-group row">
				<label class="col-sm-2 col-form-label mt-3" for="phone">Phone</label>
				<div class="col-sm-10">
					<input class="form-control mt-3" type="text" name="phone" id="phone" placeholder="Enter Your Phone Number" pattern="01[3|4|5|6|7|8|9][0-9]{8}" value="<?php if (isset($phone)) { echo $phone; } ?>">
					<?php if (isset($inputErr["phone"])) { echo '<div class="alert alert-warning mb-0 mt-1">' . $inputErr["phone"] . '</div>'; } ?>
				</div>
			</div>
			<div class="from-group row">
				<label class="col-sm-2 col-form-label mt-2" for="photo">Photo</label>
				<div class="col-sm-10">
					<div class="custom-file">
						<input class="mt-2" type="file" class="custom-file-input" id="photo" name="photo">
						<label class="custom-file-label mt-2" for="photo">Choose file</label>
					</div>
				</div>
			</div>
			<div class="from-group row">
				<label class="col-sm-2 col-form-label"></label>
				<div class="col-sm-10">
					<input class="btn btn-primary mt-3" type="submit" name="add_student" value="Add Student">
				</div>
			</div>
		</form>
	</div>
</div>