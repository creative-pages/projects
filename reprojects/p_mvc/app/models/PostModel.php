<?php 

class PostModel extends MModel {
	public function ___construct() {
		parent::___construct();
	}
	public function allPost($table) {
		$sql = "SELECT * FROM $table ORDER BY `id` DESC";
		return $this->db->select($sql);
	}
	public function latestPost($table) {
		$sql = "SELECT * FROM $table ORDER BY `id` DESC LIMIT 3";
		return $this->db->select($sql);
	}
	public function postDetails($ptable, $ctable, $cond) {
		$sql = "SELECT $ptable.*, $ctable.`name` AS `category_name`
				FROM $ptable
				INNER JOIN $ctable ON $ctable.`id` = $ptable.`cat`
				WHERE $ptable.$cond";
		return $this->db->select($sql);
	}
	public function postByCat($table, $id) {
		$sql = "SELECT * FROM $table WHERE `cat` = :id";
		$data = array(":id" => $id);
		return $this->db->select($sql, $data);
	}
	public function postById($table, $id) {
		$sql = "SELECT * FROM $table WHERE `id` = :id";
		$data = array(":id" => $id);
		return $this->db->select($sql, $data);
	}

	public function searchPost($table, $keyword, $cat_id) {
		if (empty($keyword) && $cat_id == 0) {
			header("Location: " . BASE_URL);
		}
		if (isset($keyword) && !empty($keyword)) {
			$sql = "SELECT * FROM $table WHERE title LIKE '%$keyword%' OR content LIKE '%$keyword%'";
		} elseif (isset($cat_id)) {
			$sql = "SELECT * FROM $table WHERE `cat` = '$cat_id'";
		}
		return $this->db->select($sql);
	}
	public function addPost($table, $data) {
		return $this->db->insert($table, $data);
	}
	public function postList($ptable, $ctable) {
		$sql = "SELECT $ptable.*, $ctable.`name` AS `category`
				FROM $ptable
				INNER JOIN $ctable ON $ctable.`id` = $ptable.`cat` ORDER BY $ptable.`id` DESC";
		return $this->db->select($sql);
	}

	public function updatePost($table, $data, $cond) {
		return $this->db->update($table, $data, $cond);
	}
	public function deletePost($table, $cond) {
		return $this->db->delete($table, $cond);
	}
}

?>