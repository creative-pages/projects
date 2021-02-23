<?php 

$conn = mysqli_connect('localhost', 'root', '', 'students');

extract($_POST);

// show all data
if (isset($_POST['readrecord'])) {
	$data = '<table class="table table-bordered table-striped">
					<tr>
						<td>Serial No.</td>
						<td>Name</td>
						<td>Department</td>
						<td>Age</td>
						<td>Create Date</td>
						<td>Action</td>';
	$all_students = "SELECT * FROM `std_info` order by `id` DESC";
	$result = mysqli_query($conn, $all_students);
	if (mysqli_num_rows($result) > 0) {
		$num = 1;
		while ($row = mysqli_fetch_assoc($result)) {
			$data .= '<tr>
						  <td>' . $num . '</td>
						  <td>' . $row['name'] . '</td>
						  <td>' . $row['department'] . '</td>
						  <td>' . $row['age'] . '</td>
						  <td>' . $row['updated_at'] . '</td>
						  <td>
								<button type="button" onclick="getUserData(' . $row['id'] . ')" class="btn btn-warning">Edit</button>
								<button type="button" onclick="deleteUser(' . $row['id'] . ')" class="btn btn-danger">Delete</button>
						  </td>
					  </td>';
			$num++;
		}
	}
	$data .= '</table>';
	echo $data;
}

// insert data
if (isset($_POST['name']) && isset($_POST['department']) && isset($_POST['age'])) {
	$query = "INSERT INTO `std_info`(`name`, `department`, `age`) VALUES('$name', '$department', '$age')";
	mysqli_query($conn, $query);
}

// delete data
if (isset($_POST['deleteId'])) {
	$query = "DELETE FROM `std_info` WHERE `id` = '$deleteId'";
	mysqli_query($conn, $query);
}

// select data
if (isset($_POST['id']) && $_POST['id'] != "") {
	$user_id = $_POST['id'];
	$userQuery = "SELECT * FROM `std_info` WHERE `id` = '$user_id'";
	if (!$result = mysqli_query($conn, $userQuery)) {
		exit(mysqli_error());
	}

	$response = array();

	if (mysqli_num_rows($result) > 0) {
		while ($row = mysqli_fetch_assoc($result)) {
			$response = $row;
		}
	} else {
		$response['status'] = 200;
		$response['message'] = 'Data not found!';
	}
	echo json_encode($response);
} else {
	$response['status'] = 200;
	$response['message'] = 'Invalid Request!';
}

// update data
if (isset($_POST['update_user_id'])) {
	$update_user_id = $_POST['update_user_id'];
	$name = $_POST['updatename'];
	$department = $_POST['updatedepartment'];
	$age = $_POST['updateage'];

	$query = "UPDATE `std_info` SET `name` = '$name', `department` = '$department', `age` = '$age' WHERE `id` = '$update_user_id'";
	mysqli_query($conn, $query);
}

?>