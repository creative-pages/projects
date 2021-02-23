<?php 

class PostModel extends MModel {
	public function __construct() {
		parent::__construct();
	}
	public function addPost($table, $data) {
		return $this->db->insert($table, $data);
	}
	public function updatePost($table, $data, $cond) {
		return $this->db->update($table, $data, $cond);
	}
	public function deletePost($ptable, $cond) {
		return $this->db->delete($ptable, $cond);
	}
	public function postList($ptable, $ctable) {
		$sql = "SELECT $ptable.*, $ctable.`name` AS `cat_name`
				FROM $ptable
				INNER JOIN $ctable ON $ctable.`id` = $ptable.`cat_id` ORDER BY $ptable.`id` DESC";
		return $this->db->select($sql);
	}
	public function postById($table, $cond) {
		$sql = "SELECT * FROM $table WHERE $cond";
		return $this->db->select($sql);
	}
	public function allPost($table) {
		$sql = "SELECT * FROM $table ORDER BY `id` DESC";
		return $this->db->select($sql);
	}
	public function postDetails($table, $ctable, $cond) {
		$sql = "SELECT $table.*, $ctable.`name`
				FROM $table
				INNER JOIN $ctable ON $ctable.`id` = $table.`cat_id`
				WHERE $table.$cond";
		return $this->db->select($sql);
	}
	public function postByCat($table, $cond) {
		$sql = "SELECT * FROM $table WHERE $cond";
		return $this->db->select($sql);
	}
	public function latestPost($table) {
		$sql = "SELECT * FROM $table ORDER BY `id` DESC LIMIT 3";
		return $this->db->select($sql);
	}
	public function postBySearch($table, $keyword, $cat_id) {
		if (empty($keyword) && empty($cat_id)) {
			header("Location: " . BASE_URL);
		}
		if (isset($keyword) && !empty($keyword)) {
			$sql = "SELECT * FROM $table WHERE `title` LIKE '%$keyword%' || `content` LIKE '%$keyword%' ORDER BY `id` DESC";
		} elseif (isset($cat_id) && !empty($cat_id)) {
			$sql = "SELECT * FROM $table WHERE `cat_id` = $cat_id ORDER BY `id` DESC";
		}
		return $this->db->select($sql);
	}
}

?>