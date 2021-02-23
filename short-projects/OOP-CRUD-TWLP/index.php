<?php include "header.php"; ?>
<?php 

spl_autoload_register(function($classes) {
	include "classes/" . $classes . ".php";
});

$students = new Students();

if (isset($_POST["create"])) {
	$name = $_POST['name'];
	$department = $_POST['department'];
	$age = $_POST['age'];

	$students->setName($name);
	$students->setDepartment($department);
	$students->setAge($age);

	if (!$students->insert()) {
		echo "Data not insert.";
	}
	
}

if (isset($_POST['update'])) {
	$id = $_POST["id"];
	$name = $_POST['name'];
	$department = $_POST['department'];
	$age = $_POST['age'];

	$students->setName($name);
	$students->setDepartment($department);
	$students->setAge($age);

	if (!$students->updateUser($id)) {
		echo "Data not updated.";
	}
}



?>


<div class="col-sm-5">
	<h4><a href="teacher.php">Create New For Teacher</a></h4>

<?php 
if (isset($_GET["action"]) && $_GET['action'] == 'delete') {
	$id = (int)$_GET['id'];
	if (!$students->deleteUser($id)) {
		echo "Data not deleted.";
	}
}
 ?>

<?php 
if (isset($_GET["action"]) && $_GET['action'] == 'update') {
	$id = (int)$_GET['id'];
	$result = $students->readById($id);
?>
<form action="" method="POST">
	<input type="hidden" name="id" value="<?php echo $result['id']; ?>">
		<table class="table table-borderless">
			<tr>
				<td class="pt-4">Name: </td>
				<td><input class="form-control" type="text" name="name" value="<?php echo $result['name']; ?>" required></td>
			</tr>
			<tr>
				<td class="pt-4">Department: </td>
				<td><input class="form-control" type="text" name="department" value="<?php echo $result['department']; ?>" required></td>
			</tr>
			<tr>
				<td class="pt-4">Age: </td>
				<td><input class="form-control" type="text" name="age" value="<?php echo $result['age']; ?>" required></td>
			</tr>
			<tr>
				<td></td>
				<td><input class="btn btn-primary" type="submit" name="update" value="Update"></td>
			</tr>
		</table>
	</form>
<?php 
} else {
?>


	<form action="" method="POST">
		<table class="table table-borderless">
			<tr>
				<td class="pt-4">Name: </td>
				<td><input class="form-control" type="text" name="name" placeholder="Your Name.." required></td>
			</tr>
			<tr>
				<td class="pt-4">Department: </td>
				<td><input class="form-control" type="text" name="department" placeholder="Your Department.." required></td>
			</tr>
			<tr>
				<td class="pt-4">Age: </td>
				<td><input class="form-control" type="text" name="age" placeholder="Your Age.." required></td>
			</tr>
			<tr>
				<td></td>
				<td><input class="btn btn-primary" type="submit" name="create" value="Submit"></td>
			</tr>
		</table>
	</form>
<?php } ?>
</div>
<div class="col-sm-7">
	<h4 class="mb-3">CRUD With PDO - Template & Database Design.</h4>
	<table class="table table-bordered table-striped">
		<tr>
			<th>No</th>
			<th>Name</th>
			<th>Department</th>
			<th>Age</th>
			<th>Action</th>
		</tr>
		<?php 

		foreach ($students->readAll() as $value) {

		?>
		<tr>
			<td><?php echo $value['id']; ?></td>
			<td><?php echo $value['name']; ?></td>
			<td><?php echo $value['department']; ?></td>
			<td><?php echo $value['age']; ?></td>
			<td>
				<a href="index.php?action=update&id=<?php echo $value['id']; ?>">Edit</a> ||
				<a href="index.php?action=delete&id=<?php echo $value['id']; ?>" onClick='return confirm("Are you sure to delete data?")'>Delete</a>
			</td>
		</tr>
		<?php
			
		}

		?>
	</table>
</div>



<?php include "footer.php"; ?>