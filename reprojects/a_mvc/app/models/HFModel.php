<?php 

class HFModel extends MModel {
	public function tiSuLo($table) {
		$sql = "SELECT * FROM $table";
		return $this->db->select($sql);
	}
	public function catById($table, $id) {
		$sql = "SELECT * FROM $table WHERE `id` = :id";
		$data = array(":id" => $id);
		return $this->db->select($sql, $data);
	}
	public function addCategory($table, $data) {
		return $this->db->insert($table, $data);
	}
	public function updateCategory($table, $data, $cond) {
		return $this->db->update($table, $data, $cond);
	}
	public function deleteCategory($table, $cond) {
		return $this->db->delete($table, $cond);
	}
}

?>