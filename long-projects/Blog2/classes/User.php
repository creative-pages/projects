<?php 
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . '/../lib/Database.php');
include_once ($filepath . '/../healper/Format.php');
class User {
	public $nameErr;
	public $usernameErr;
	public $emailErr;
	public $passwordErr;
	public $detailsErr;
	public $roleErr;

	private $db;
	private $fm;

	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	public function addUser($data) {
		$username = $this->fm->validation($data['username']);
		$username = mysqli_real_escape_string($this->db->link, $username);
		$email = $this->fm->validation($data['email']);
		$email = mysqli_real_escape_string($this->db->link, $email);
		$password = $this->fm->validation($data['password']);
		$password = mysqli_real_escape_string($this->db->link, $password);
		$role = $this->fm->validation($data['role']);
		$role = mysqli_real_escape_string($this->db->link, $role);

		if (empty($username)) {
			$this->usernameErr = '<div class="alert alert-warning">Username must be required.</div>';
		}
		if (empty($email)) {
			$this->emailErr = '<div class="alert alert-warning">Email must be required.</div>';
		}
		if (empty($password)) {
			$this->passwordErr = '<div class="alert alert-warning">This field is required.</div>';
		}
		if (empty($role)) {
			$this->roleErr = '<div class="alert alert-warning">Role is required.</div>';
		}

		if ($username && $password && $role && $email) {
			$usernameCheck = "SELECT * FROM `users` WHERE `username` = '$username'";
			$username_check = $this->db->select($usernameCheck);
			if ($username_check == NULL) {
				$emailCheck = "SELECT * FROM `users` WHERE `email` = '$email'";
				$email_check = $this->db->select($emailCheck);
				if ($email_check == NULL) {
					$query = "INSERT INTO `users`(`username`, `password`, `email`, `role`) VALUES('$username', '$password', '$email', '$role')";
					$result = $this->db->insert($query);
					if ($result) {
						$insertMsg = '<div class="alert alert-success">User added Successfully.</div>';
						return $insertMsg;
					} else {
						$insertMsg = '<div class="alert alert-danger">Failed to add user!</div>';
						return $insertMsg;
					}
				} else {
					$this->emailErr = '<div class="alert alert-warning">This email already exists!</div>';
				}
			} else {
				$this->usernameErr = '<div class="alert alert-warning">This username already exists!</div>';
			}
		}
	}
	public function updateUser($data) {
		$userId = Session::get("userId");
		$userRole = Session::get("userRole");

		$name = $this->fm->validation($data['name']);
		$name = mysqli_real_escape_string($this->db->link, $name);
		$username = $this->fm->validation($data['username']);
		$username = mysqli_real_escape_string($this->db->link, $username);
		$email = $this->fm->validation($data['email']);
		$email = mysqli_real_escape_string($this->db->link, $email);
		$details = $this->fm->validation($data['details']);
		$details = mysqli_real_escape_string($this->db->link, $details);

		if (empty($name)) {
			$this->nameErr = '<div class="alert alert-warning">Name must be required.</div>';
		}
		if (empty($username)) {
			$this->usernameErr = '<div class="alert alert-warning">Username must be required.</div>';
		}
		if (empty($email)) {
			$this->emailErr = '<div class="alert alert-warning">Email must be required.</div>';
		}
		if (empty($details)) {
			$this->detailsErr = '<div class="alert alert-warning">This field is required.</div>';
		}

		if ($name && $username && $email && $details) {
			$usernameCheck = "SELECT * FROM `users` WHERE `username` = '$username'";
			$username_check = $this->db->select($usernameCheck);
			if ($username_check) {
				$username_check_result = $username_check->fetch_assoc();
			}
			$selfUsername = "SELECT `username` FROM `users` WHERE `id` = '$userId' AND `role` = '$userRole'";
			$self_username = $this->db->select($selfUsername);
			if ($self_username) {
				$self_username_result = $self_username->fetch_assoc();
			}
			if ($username_check == NULL OR $username_check_result['username'] !== $username OR $self_username_result['username'] == $username) {
				$emailCheck = "SELECT * FROM `users` WHERE `email` = '$email'";
				$email_check = $this->db->select($emailCheck);
				if ($email_check) {
					$email_check_result = $email_check->fetch_assoc();
				}
				$selfEmail = "SELECT `email` FROM `users` WHERE `id` = '$userId' AND `role` = '$userRole'";
				$self_email = $this->db->select($selfEmail);
				if ($self_email) {
					$self_email_result = $self_email->fetch_assoc();
				}
				if ($email_check == NULL OR $email_check_result['email'] !== $email OR $self_email_result['email'] == $email) {
					$query = "UPDATE `users` SET `name`= '$name',`username`= '$username', `email`= '$email',`details`= '$details' WHERE `id` = '$userId' AND `role` = '$userRole'";
					$result = $this->db->UPDATE($query);
					if ($result) {
						$insertMsg = '<div class="alert alert-success">User updated Successfully.</div>';
						return $insertMsg;
					} else {
						$insertMsg = '<div class="alert alert-danger">Failed to update user!</div>';
						return $insertMsg;
					}
				} else {
					$this->emailErr = '<div class="alert alert-warning">This email already exists!</div>';
				}
			} else {
				$this->usernameErr = '<div class="alert alert-warning">This username already exists!</div>';
			}
		}
	}
	public function viewUserProfile($userId, $userRole) {
		$query = "SELECT * FROM `users` WHERE `id` = '$userId' AND `role` = '$userRole'";
		$result = $this->db->select($query);
		return $result;
	}
	public function allUser() {
		$query = "SELECT * FROM `users`";
		$result = $this->db->select($query);
		return $result;
	}
	public function deleteUser($id) {
		$query = "DELETE FROM `users` WHERE `id` = '$id'";
		$result = $this->db->delete($query);
		return $result;
	}
	public function viewSingleUser($id) {
		$query = "SELECT * FROM `users` WHERE `id` = '$id'";
		$result = $this->db->select($query);
		return $result;
	}
}

?>