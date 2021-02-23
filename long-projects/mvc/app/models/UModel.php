<?php 

class UModel extends MModel {
	public function __construct() {
		parent::__construct();
	}
	public function addUser($table, $data) {
		return $this->db->insert($table, $data);
	}
	public function updateUser($table, $data, $cond) {
		return $this->db->update($table, $data, $cond);
	}
	public function deleteUser($table, $cond) {
		return $this->db->delete($table, $cond);
	}
	public function userList($table) {
		$sql = "SELECT * FROM $table";
		return $this->db->select($sql);
	}
}

?>