<?php 

class PageModel extends MModel {
	public function addPage($table, $data) {
		return $this->db->insert($table, $data);
	}
	public function singlePage($table, $id) {
		$sql = "SELECT * FROM $table WHERE `id` = :id";
		$data = array(":id" => $id);
		return $this->db->select($sql, $data);
	}
	public function menuList($table) {
		$sql = "SELECT * FROM $table WHERE `status` = 1";
		return $this->db->select($sql);
	}
	public function pageList($table) {
		$sql = "SELECT * FROM $table";
		return $this->db->select($sql);
	}
	public function updatePage($table, $data, $cond) {
		return $this->db->update($table, $data, $cond);
	}

	// code for content
	public function selectContent($table, $id) {
		$sql = "SELECT * FROM $table WHERE `page_id` = $id";
		return $this->db->select($sql);
	}
	public function singleContent($table, $name) {
		$sql = "SELECT * FROM $table WHERE `name` = :name";
		$data = array(":name" => $name);
		return $this->db->select($sql, $data);
	}
	public function addContent($table, $data) {
		return $this->db->insert($table, $data);
	}
	public function deletePage($table, $cond) {
		return $this->db->delete($table, $cond);
	}
	public function deleteContent($table, $cond) {
		return $this->db->delete($table, $cond);
	}
	public function updateContent($table, $data, $cond) {
		return $this->db->update($table, $data, $cond);
	}
}

?>