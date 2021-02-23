<?php 

class UiModel extends MModel {
	public function __construct() {
		parent::__construct();
	}
	public function updateBackground($table, $data, $cond) {
		return $this->db->update($table, $data, $cond);
	}
	public function getColor($table) {
		$sql = "SELECT * FROM $table";
		return $this->db->select($sql);
	}
}

?>