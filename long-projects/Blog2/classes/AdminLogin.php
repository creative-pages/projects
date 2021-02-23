<?php 
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . "/../lib/Session.php");
Session::checkLogin();
include_once ($filepath . '/../lib/Database.php');
include_once ($filepath . '/../healper/Format.php');
class AdminLogin {
	private $db;
	private $fm;

	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	public function adminLogin($data) {
		$username = $this->fm->validation($data['username']);
		$username = mysqli_real_escape_string($this->db->link, $data['username']);
		$password = $this->fm->validation($data['password']);
		$password = mysqli_real_escape_string($this->db->link, $data['password']);
		$query = "SELECT * FROM `users` WHERE `username` = '$username' AND `password` = '$password'";
		$result = $this->db->select($query);
		if ($result != false) {
			$value = $result->fetch_assoc();
			Session::set('login', true);
			Session::set('userId', $value['id']);
			Session::set('username', $value['username']);
			Session::set('userRole', $value['role']);
			header("Location: index.php");
		} else {
			$loginMsg = '<div class="alert alert-warning">Username or Password is wrong!</div>';
			return $loginMsg;
		}
	}
	public function passwordRecovery($data) {
		$email = $this->fm->validation($data['email']);
		$email = mysqli_real_escape_string($this->db->link, $data['email']);

		if (!empty($email)) {
			$query = "SELECT * FROM `users` WHERE `email` = '$email'";
			$result = $this->db->select($query);
			if ($result != false) {
				$value = $result->fetch_assoc();
				$userId = $value['id'];
				$username = $value['username'];

				$text = substr($email, 0, 3);
				$rand = rand(10000, 99999);
				$newpass = $text . $rand;

				$update_query = "UPDATE `users` SET `password` = '$newpass' WHERE `id` = '$userId'";
				$update_result = $this->db->update($update_query);
				$from = 'Blog Post';
				$headers = "From: $from\n";
				$headers .= 'MIME-Version: 1.0' . "r\n";
				$headers .= 'Content-type: text/html; charset=iso-8859-1' . "r\n";
				$subject = "Your Password";
				$message = "Your Username is: " . $username . " and Password is: " . $newpass . ". Please visit website to login.";
				$sendMail = mail($email, $subject, $message, $headers);
				if ($sendMail) {
					$recoveryMsg = '<div class="alert alert-success">Please check your email.</div>';
					return $recoveryMsg;
				} else {
					$recoveryMsg = '<div class="alert alert-warning">Failed to send recover password!</div>';
					return $recoveryMsg;
				}
			} else {
				$recoveryMsg = '<div class="alert alert-warning">Email Not Found!</div>';
				return $recoveryMsg;
			}
		} else {
			$recoveryMsg = '<div class="alert alert-warning">Please enter your email.</div>';
			return $recoveryMsg;
		}
	}
}

?>