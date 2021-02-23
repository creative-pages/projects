<?php 

class PostModel extends MModel {
	public function postList($ptable, $ctable) {
		$sql = "SELECT $ptable.*, $ctable.`name`
				FROM $ptable
				INNER JOIN $ctable ON $ctable.`id` = $ptable.`cat_id`
				WHERE $ptable.`status` = 1 ORDER BY $ptable.`id` DESC";
		return $this->db->select($sql);
	}
	public function allPost($ptable, $ctable) {
		$sql = "SELECT $ptable.*, $ctable.`name`
				FROM $ptable
				INNER JOIN $ctable ON $ctable.`id` = $ptable.`cat_id` ORDER BY $ptable.`id` DESC";
		return $this->db->select($sql);
	}
	public function latestPost($table) {
		$sql = "SELECT * FROM $table WHERE `status` = 1 ORDER BY `id` DESC LIMIT 3";
		return $this->db->select($sql);
	}
	public function singlePost($table, $id) {
		$sql = "SELECT * FROM $table WHERE `id` = $id";
		return $this->db->select($sql);
	}
	public function postDetails($ptable, $ctable, $id) {
		$sql = "SELECT $ptable.*, $ctable.`name`
				FROM $ptable
				INNER JOIN $ctable ON $ctable.`id` = $ptable.`cat_id`
				WHERE $ptable.`id` = :id";
		$data = array(":id" => $id);
		return $this->db->select($sql, $data);
	}
	public function postByCat($ptable, $ctable, $cat_id) {
		$sql = "SELECT $ptable.*, $ctable.`name`
				FROM $ptable
				INNER JOIN $ctable ON $ctable.`id` = $ptable.`cat_id`
				WHERE $ptable.`status` = 1 AND $ptable.`cat_id` = $cat_id ORDER BY $ptable.`id` DESC";
		return $this->db->select($sql);
	}
	public function addPost($table, $data) {
		return $this->db->insert($table, $data);
	}
	public function updatePost($table, $data, $cond) {
		return $this->db->update($table, $data, $cond);
	}
	public function deletePost($table, $cond) {
		return $this->db->delete($table, $cond);
	}

	public function searchPost($ptable, $ctable, $keyword, $cat_id) {
		if (empty($keyword) && $cat_id == 0) {
			header("Location: " . BASE_URL);
		}
		if (isset($keyword) && !empty($keyword)) {
			$sql = "SELECT $ptable.*, $ctable.`name`
					FROM $ptable
					INNER JOIN $ctable ON $ctable.`id` = $ptable.`cat_id` WHERE `title` LIKE '%$keyword%' || `content` LIKE '%$keyword%' ORDER BY `id` DESC";
		} elseif (isset($cat_id) && $cat_id != 0) {
			$sql = "SELECT $ptable.*, $ctable.`name`
					FROM $ptable
					INNER JOIN $ctable ON $ctable.`id` = $ptable.`cat_id` WHERE `cat_id` = $cat_id ORDER BY `id` DESC";
		}
		return $this->db->select($sql);
	}
}

?>