<?php 

if (isset($_GET['edit_id'])) {
	$id = $_GET['edit_id'];

	$single_student = mysqli_query($conn, "SELECT * FROM `students` WHERE `id` = '$id'");
	$single_student_result = mysqli_fetch_assoc($single_student);
}

if (isset($_POST['update_student'])) {
	$id = $_POST['old_id'];
	$old_file = $_POST['old_file'];

	$name = $_POST['name'];
	$roll = $_POST['roll'];
	$class = $_POST['class'];
	$city = $_POST['city'];
	$p_contact = $_POST['p_contact'];
	
	$photo = $_FILES['image']['name'];
	$photo_exp = explode('.', $photo);
	$photo_ext = end($photo_exp);
	$image = date('ymdhis') . '.' . $photo_ext;

	$input_errors = array();
	if (empty($name)) {
		$input_errors['name'] = "Name is required!";
	}
	if (empty($roll)) {
		$input_errors['roll'] = "Roll is required!";
	}
	if (empty($class)) {
		$input_errors['class'] = "Class is required!";
	}
	if (empty($city)) {
		$input_errors['city'] = "City is required!";
	}
	if (empty($p_contact)) {
		$input_errors['p_contact'] = "Parent contact is required!";
	}

	if (count($input_errors) == 0) {
		$check_roll = mysqli_query($conn, "SELECT * FROM `students` WHERE `roll` = '$roll'");
		$self_roll = mysqli_query($conn, "SELECT * FROM `students` WHERE `id` = '$id'");
		$self_roll_result = mysqli_fetch_assoc($self_roll);
		if (mysqli_num_rows($check_roll) == 0 OR $self_roll_result['roll'] == $roll) {
			if ($photo) {
				$result = mysqli_query($conn, "UPDATE `students` SET `name`= '$name',`roll`= '$roll',`class`= '$class',`city`= '$city',`p_contact`= '$p_contact',`image`= '$image' WHERE `id` = '$id'");
				if ($result) {
					unlink('../images/students/' . $old_file);
					move_uploaded_file($_FILES['image']['tmp_name'], '../images/students/' . $image);
					$success = "Student updated successfully.";
				} else {
					$error = "Student does not updated!";
				}
			} else {
				$result = mysqli_query($conn, "UPDATE `students` SET `name`= '$name',`roll`= '$roll',`class`= '$class',`city`= '$city',`p_contact`= '$p_contact' WHERE `id` = '$id'");
				if ($result) {
					$success = "Student updated successfully.";
				} else {
					$error = "Student does not updated!";
				}
			}
		} else {
			$input_errors['roll'] = "Please select another roll.";
		}
	}
}

?>

<h1 class="text-primary">
	<a href="index.php" class="text-decoration-none"><i class="fa fa-home"></i> Dashboard</a>
	<small class="text-secondary">Statistics Overview</small>
</h1>
<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="index.php" class="text-decoration-none"><i class="fa fa-home"></i> Home</a></li>
	<li class="breadcrumb-item"><a href="index.php?page=all_students" class="text-decoration-none"><i class="fa fa-users"></i> All Students</a></li>
	<li class="breadcrumb-item">Update Student</li>
</ol>

<div class="row">
	<div class="col-sm-6 offset-sm-3">
		<?php 
		if (isset($success)) {
			echo '<div class="alert alert-success">' . $success . '</div>';
		} elseif (isset($error)) {
			echo '<div class="alert alert-warning">' . $error . '</div>';
		}
		?>
		<form action="" method="POST" enctype="multipart/form-data">
			<div class="form-group row">
				<label for="name" class="label-control col-sm-2 mt-2">Name</label>
				<div class="col-sm-10">
					<input type="hidden" name="old_id" value="<?= $single_student_result['id']; ?>">
					<input type="hidden" name="old_file" value="<?= $single_student_result['image']; ?>">
					<input class="form-control" type="text" name="name" id="name" value="<?= $single_student_result['name']; ?>" placeholder="Enter name">
					<?php if (isset($input_errors['name'])) { echo '<div class="alert alert-warning mb-0">' . $input_errors['name'] . '</div>'; } ?>
				</div>
			</div>
			<div class="form-group row">
				<label for="roll" class="label-control col-sm-2 mt-2">Roll</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" name="roll" id="roll" value="<?= $single_student_result['roll']; ?>" placeholder="Enter roll" pattern="[0-9]{6}">
					<?php if (isset($input_errors['roll'])) { echo '<div class="alert alert-warning mb-0">' . $input_errors['roll'] . '</div>'; } ?>
				</div>
			</div>
			<div class="form-group row">
				<label for="class" class="label-control col-sm-2 mt-2">Class</label>
				<div class="col-sm-10">
					<select class="form-control" name="class" id="class">
						<option value="">Select Class</option>
						<option <?= $single_student_result['class'] == 5 ? 'selected' : ''; ?> value="5">Five</option>
						<option <?= $single_student_result['class'] == 6 ? 'selected' : ''; ?> value="6">Six</option>
						<option <?= $single_student_result['class'] == 7 ? 'selected' : ''; ?> value="7">Seven</option>
						<option <?= $single_student_result['class'] == 8 ? 'selected' : ''; ?> value="8">Eight</option>
					</select>
					<?php if (isset($input_errors['class'])) { echo '<div class="alert alert-warning mb-0">' . $input_errors['class'] . '</div>'; } ?>
				</div>
			</div>
			<div class="form-group row">
				<label for="city" class="label-control col-sm-2 mt-2">City</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" name="city" id="city" value="<?= $single_student_result['city']; ?>" placeholder="Enter city">
					<?php if (isset($input_errors['city'])) { echo '<div class="alert alert-warning mb-0">' . $input_errors['city'] . '</div>'; } ?>
				</div>
			</div>
			<div class="form-group row">
				<label for="p_contact" class="label-control col-sm-2 mt-2">Contact</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" name="p_contact" id="p_contact" value="<?= $single_student_result['p_contact']; ?>" placeholder="Enter parent contact" pattern="01[3|4|5|6|7|8|9][0-9]{8}">
					<?php if (isset($input_errors['p_contact'])) { echo '<div class="alert alert-warning mb-0">' . $input_errors['p_contact'] . '</div>'; } ?>
				</div>
			</div>
			<div class="form-group row">
				<label for="image" class="label-control col-sm-2 mt-2">Image</label>
				<div class="col-sm-10">
					<input class="form-control" type="file" name="image" id="image">
					<img style="width: 350px; height: 150px;" src="../images/students/<?= $single_student_result['image']; ?>" alt="">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-10 offset-sm-2">
					<input class="btn btn-primary" type="submit" name="update_student" value="Update Student">
				</div>
			</div>
		</form>
	</div>
</div>