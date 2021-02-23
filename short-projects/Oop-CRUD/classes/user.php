<?php 

class User {
	public function __construct() {
		$hostname = "localhost";
		$username = "root";
		$password = "";
		$database_name = "oop";

		$this->conn = mysqli_connect($hostname, $username, $password, $database_name);
	}

	public function saveUser($data) {
		$name = $data['name'];
		$email = $data['email'];
		$password = $data['password'];

		$saveQuery = "INSERT INTO `users`(`name`, `email`, `password`) VALUES ('$name', '$email', '$password')";
		mysqli_query($this->conn, $saveQuery);
		$message = "Data save successfully.";
		return $message;
	}

	public function showUser() {
		return mysqli_query($this->conn, "SELECT * FROM `users`");
	}

	public function deleteUser($id) {
		mysqli_query($this->conn, "DELETE FROM `users` WHERE `id` = '$id'");
		header("Location: index.php");
	}

	public function editUser($id) {
		return mysqli_query($this->conn, "SELECT * FROM `users` WHERE `id` = '$id'");
	}

	public function editUserSave($data) {
		$id = $data['id'];
		$name = $data['name'];
		$email = $data['email'];
		$password = $data['password'];

		$saveUpdateQuery = "UPDATE `users` SET `name`='$name',`email`='$email',`password`='$password' WHERE `id` = '$id'";
		mysqli_query($this->conn, $saveUpdateQuery);
		header("Location: index.php");
	}
} 

?>