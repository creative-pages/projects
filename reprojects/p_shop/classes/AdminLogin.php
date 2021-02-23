<?php 
$path = realpath(dirname(__FILE__));
include_once ($path . "/../lib/Session.php");
Session::init();
include_once ($path . "/../lib/Database.php");
include_once ($path . "/../helpers/Format.php");

class AdminLogin {
	// for user login
	public $usernameEmail;
	public $password;
	// for user update
	public $name;
	public $username;
	public $email;
	public $level;
	// public $password; use from before password property
	public $image;
	public $old_password;

	public $db;
	public $fm;

	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	public function adminLogin($data) {
		$usernameEmail = $this->fm->validation($data['usernameEmail']);
		$usernameEmail = mysqli_real_escape_string($this->db->link, $usernameEmail);
		$password = $this->fm->validation($data['password']);
		$password = mysqli_real_escape_string($this->db->link, $password);


		if (empty($usernameEmail)) {
			$this->usernameEmail = '<div class="alert alert-warning mx-4">Please enter your Username or Email.</div>';
		}
		if (empty($password)) {
			$this->password = '<div class="alert alert-warning mx-4">Please enter your Password.</div>';
		}

		if ($usernameEmail !== '' && $password !== '') {
			$usernameEmailCheck = "SELECT * FROM `users` WHERE `username` = '$usernameEmail' || `email` = '$usernameEmail'";
			$username_email_check = $this->db->select($usernameEmailCheck);
			if ($username_email_check != false) {
				$passwordCheck = $username_email_check->fetch_assoc();
				if ($passwordCheck['password'] == $password) {
					Session::set('login', true);
					Session::set('userId', $passwordCheck['id']);
					Session::set('userName', $passwordCheck['name']);
					Session::set('username', $passwordCheck['username']);
					Session::set('userlevel', $passwordCheck['level']);
					header("Location: index.php");
				} else {
					$this->password = '<div class="alert alert-warning mx-4">Password does not matched!</div>';
				}
			} else {
				$this->usernameEmail = '<div class="alert alert-warning mx-4">Username or Email is wrong!</div>';
			}
		}
	}
	public function userProfile($id) {
		$id = $this->fm->validation($id);
		$id = mysqli_real_escape_string($this->db->link, $id);
		$query = "SELECT * FROM `users` WHERE `id` = '$id'";
		$result = $this->db->select($query);
		return $result;
	}
	public function addUser($data) {
		$username = $this->fm->validation($data['username']);
		$username = mysqli_real_escape_string($this->db->link, $username);
		$password = $this->fm->validation($data['password']);
		$password = mysqli_real_escape_string($this->db->link, $password);
		$level = $this->fm->validation($data['level']);
		$level = mysqli_real_escape_string($this->db->link, $level);

		if (empty($username)) {
			$this->username = '<div class="alert alert-warning mb-0">Username is required.</div>';
		} elseif (is_numeric($username)) {
			$this->username = '<div class="alert alert-warning mb-0">Username can not be numeric.</div>';
			return false;
		} elseif (strlen($username) < 5 || strlen($username) > 15) {
			$this->username = '<div class="alert alert-warning mb-0">Username should be minimum 5 characters and less than 15 characters.</div>';
			return false;
		}
		if (empty($password)) {
			$this->password = '<div class="alert alert-warning mb-0">Password is required.</div>';
		} elseif (strlen($password) < 10 || strlen($password) > 150) {
			$this->password = '<div class="alert alert-warning mb-0">Password should be minimum 10 characters and less than 150 characters.</div>';
			return false;
		}
		if (empty($level)) {
			$this->level = '<div class="alert alert-warning mb-0">Please select user level.</div>';
		}


		if ($username && $password && $level) {
			$usernameCheck = "SELECT * FROM `users` WHERE `username` = '$username'";
			$username_check = $this->db->select($usernameCheck);
			if ($username_check == NULL) {
				$query = "INSERT INTO `users`(`username`, `password`, `level`) VALUES ('$username', '$password', '$level')";
				$result = $this->db->insert($query);
				if ($result) {
					$addMsg = '<div class="alert alert-success mb-0">User Added successfully.</div>';
					return $addMsg;
				} else {
					$addMsg = '<div class="alert alert-warning mb-0">User does not added.</div>';
					return $addMsg;
				}
			} else {
				$this->username = '<div class="alert alert-warning mb-0">This username already exists!</div>';
			}
		}

	}
	public function updateUser($data) {
		$userId = $this->fm->validation($data['userId']);
		$userId = mysqli_real_escape_string($this->db->link, $userId);
		$old_file = $this->fm->validation($data['old_file']);
		$old_file = mysqli_real_escape_string($this->db->link, $old_file);

		$name = $this->fm->validation($data['name']);
		$name = mysqli_real_escape_string($this->db->link, $name);
		$username = $this->fm->validation($data['username']);
		$username = mysqli_real_escape_string($this->db->link, $username);
		$email = $this->fm->validation($data['email']);
		$email = mysqli_real_escape_string($this->db->link, $email);
		$password = $this->fm->validation($data['password']);
		$password = mysqli_real_escape_string($this->db->link, $password);

		$permited = array('jpg', 'jpeg', 'png', 'gif');
		$file_name = $_FILES['image']['name'];
		$file_size = $_FILES['image']['size'];
		$file_tmp = $_FILES['image']['tmp_name'];
		$file_exp = explode(".", $file_name);
		$file_ext = strtolower(end($file_exp));
		$image = substr(md5(time()), 0, 10) . '.' . $file_ext;

		if (empty($name)) {
			$this->name = '<div class="alert alert-warning mb-0">Name is required.</div>';
		} elseif (is_numeric($name)) {
			$this->name = '<div class="alert alert-warning mb-0">Name can not be numeric.</div>';
			return false;
		} elseif (strlen($name) > 50) {
			$this->name = '<div class="alert alert-warning mb-0">Name should be less than 50 characters.</div>';
			return false;
		}
		if (empty($username)) {
			$this->username = '<div class="alert alert-warning mb-0">Username is required.</div>';
		} elseif (is_numeric($username)) {
			$this->username = '<div class="alert alert-warning mb-0">Username can not be numeric.</div>';
			return false;
		} elseif (strlen($username) < 5 || strlen($username) > 15) {
			$this->username = '<div class="alert alert-warning mb-0">Username should be minimum 5 characters and less than 15 characters.</div>';
			return false;
		}
		if (empty($email)) {
			$this->email = '<div class="alert alert-warning mb-0">Email is required.</div>';
		} elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
			$this->email = '<div class="alert alert-warning mb-0">Please enter a valid email.</div>';
			return false;
		}
		if (empty($password)) {
			$this->password = '<div class="alert alert-warning mb-0">Password is required.</div>';
		} elseif (strlen($password) < 10 || strlen($password) > 150) {
			$this->password = '<div class="alert alert-warning mb-0">Password should be minimum 10 characters and less than 150 characters.</div>';
			return false;
		}
		if ($name && $username && $email && $password) {
			$usernameCheck = "SELECT * FROM `users` WHERE `username` = '$username'";
			$username_check = $this->db->select($usernameCheck);
			if ($username_check) {
				$username_check_result = $username_check->fetch_assoc();
			}
			$selfUsername = "SELECT * FROM `users` WHERE `id` = '$userId'";
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
				$selfEmail = "SELECT * FROM `users` WHERE `id` = '$userId'";
				$self_email = $this->db->select($selfEmail);
				if ($self_email) {
					$self_email_result = $self_email->fetch_assoc();
				}
				if ($email_check == NULL OR $email_check_result['email'] !== $email OR $self_email_result['email'] == $email) {
					if ($file_name) {
						if ($file_size > 5048567) {
							$this->image = '<div class="alert alert-warning mb-0">Image size should be less than 5mb!</div>';
						} elseif (in_array($file_ext, $permited) == false) {
							$this->image = '<div class="alert alert-warning mb-0">You can upload only:- ' . implode(', ', $permited) . '</div>';
						} else {
							$query = "UPDATE `users` SET `name`= '$name',`username`= '$username',`email`= '$email',`password`= '$password', `image`= '$image' WHERE `id` = '$userId'";
							$result = $this->db->update($query);
							if ($result) {
								if ($old_file) {
									unlink("uploads/users/" . $old_file);
								}
								move_uploaded_file($file_tmp, 'uploads/users/' . $image);
								$updateMsg = '<div class="alert alert-success mb-0">Profile updated successfully.</div>';
								return $updateMsg;
							} else {
								$updateMsg = '<div class="alert alert-warning mb-0">Profile does not updated.</div>';
								return $updateMsg;
							}
						}
					} else {
						$query = "UPDATE `users` SET `name`= '$name',`username`= '$username',`email`= '$email',`password`= '$password' WHERE `id` = '$userId'";
						$result = $this->db->update($query);
						if ($result) {
							$updateMsg = '<div class="alert alert-success mb-0">Profile updated successfully.</div>';
							return $updateMsg;
						} else {
							$updateMsg = '<div class="alert alert-warning mb-0">Profile does not updated.</div>';
							return $updateMsg;
						}
					}
				} else {
					$this->email = '<div class="alert alert-warning mb-0">This email already exists!</div>';
				}
			} else {
				$this->username = '<div class="alert alert-warning mb-0">This username already exists!</div>';
			}
		}

	}
	public function changePassword($data) {
		$id = $this->fm->validation($data['id']);
		$id = mysqli_real_escape_string($this->db->link, $id);
		$password_match = $this->fm->validation($data['password_match']);
		$password_match = mysqli_real_escape_string($this->db->link, $password_match);

		$old_password = $this->fm->validation($data['old_password']);
		$old_password = mysqli_real_escape_string($this->db->link, $old_password);
		$new_password = $this->fm->validation($data['new_password']);
		$new_password = mysqli_real_escape_string($this->db->link, $new_password);

		if (empty($old_password)) {
			$this->old_password = '<div class="alert alert-warning mb-0 w-50">Please enter your old password.</div>';
		}
		if (empty($new_password)) {
			$this->password = '<div class="alert alert-warning mb-0 w-50">Please enter new password.</div>';
		} elseif (strlen($new_password) < 10 || strlen($new_password) > 150) {
			$this->password = '<div class="alert alert-warning mb-0 w-50">Password should be minimum 10 characters and less than 150 characters.</div>';
			return false;
		}

		if ($old_password && $new_password) {
			if ($old_password == $password_match) {
				$query = "UPDATE `users` SET `password` = '$new_password' WHERE `id` = '$id'";
				$result = $this->db->update($query);
				if ($result) {
					$updateMsg = '<div class="alert alert-success mb-0 w-50">Password changed successfully.</div>';
					return $updateMsg;
				} else {
					$updateMsg = '<div class="alert alert-warning mb-0 w-50">Password does not changed.</div>';
					return $updateMsg;
				}
			} else {
				$this->old_password = '<div class="alert alert-warning mb-0 w-50">Password does not matched!</div>';
			}
		}
	}
}

?>