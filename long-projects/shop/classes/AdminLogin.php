<?php 
$filepath = realpath(dirname(__FILE__));
include ($filepath . "/../lib/Session.php");
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
	public function adminLogin($adminUser, $adminPassword) {
		$adminUser = $this->fm->validation($adminUser);
		$adminPassword = $this->fm->validation($adminPassword);
		$adminUser = mysqli_real_escape_string($this->db->link, $adminUser);
		$adminPassword = mysqli_real_escape_string($this->db->link, $adminPassword);
		if (empty($adminUser) || empty($adminPassword)) {
			$loginMsg = '<div class="alert alert-warning">Username or Password must not be empty!</div>';
			return $loginMsg;
		} else {
			$query = "SELECT * FROM `admin` WHERE `adminUser` = '$adminUser' AND `adminPassword` = '$adminPassword'";
			$result = $this->db->select($query);
			if ($result != false) {
				$value = $result->fetch_assoc();
				Session::set("adminlogin", true);
				Session::set("adminId", $value['adminId']);
				Session::set("adminUser", $value['adminUser']);
				Session::set("adminName", $value['adminName']);
				header("Location: dashboard.php");
			} else {
				$loginMsg = '<div class="alert alert-warning">Username or Password not match!</div>';
				return $loginMsg;
			}
		}
	}
}

?>