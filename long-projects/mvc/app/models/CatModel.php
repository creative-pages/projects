<?php 

class CatModel extends MModel {
	public function __construct() {
		parent::__construct();
	}
	public function catList($ctable) {
		$sql = "SELECT * FROM $ctable ORDER BY `id` DESC";
		return $this->db->select($sql);
	}
	public function catById($table, $cond) {
		$sql = "SELECT * FROM $table WHERE $cond";
		return $this->db->select($sql);
	}
	public function insertCat($table, $data) {
		return $this->db->insert($table, $data);
	}
	public function updateCat($table, $data, $cond) {
		return $this->db->update($table, $data, $cond);
	}
	public function deleteCat($table, $cond) {
		return $this->db->delete($table, $cond);
	}
}

?>