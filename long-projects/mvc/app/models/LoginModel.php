<?php 

class LoginModel extends MModel {
	public function __construct() {
		parent::__construct();
	}
	public function userControl($utable, $username, $password) {
		$sql = "SELECT * FROM $utable WHERE `username` = ? AND `password` = ?";
		return $this->db->affectedRows($sql, $username, $password);
	}
	public function getUserData($utable, $username, $password) {
		$sql = "SELECT * FROM $utable WHERE `username` = ? AND `password` = ?";
		return $this->db->selectUserData($sql, $username, $password);
	}
}

?>