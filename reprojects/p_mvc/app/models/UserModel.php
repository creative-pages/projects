<?php 

class UserModel extends MModel {
	public function ___construct() {
		parent::___construct();
	}
	public function userList($table) {
		$sql = "SELECT * FROM $table";
		return $this->db->select($sql);
	}
	public function addUser($table, $data) {
		return $this->db->insert($table, $data);
	}
	public function deleteUser($table, $cond) {
		return $this->db->delete($table, $cond);
	}
}

?>