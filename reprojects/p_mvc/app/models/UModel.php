<?php 

class UModel extends MModel {
	public function ___construct() {
		parent::___construct();
	}
	public function updateUi($table, $data, $cond) {
		return $this->db->update($table, $data, $cond);
	}
	public function getColor($table) {
		$sql = "SELECT * FROM $table";
		return $this->db->select($sql);
	}
}

?>