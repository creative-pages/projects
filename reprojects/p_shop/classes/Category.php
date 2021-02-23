<?php 
$path = realpath(dirname(__FILE__));
include_once ($path . "/../lib/Database.php");
include_once ($path . "/../helpers/Format.php");

class Category {
	public $name;

	public $db;
	public $fm;

	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	public function addCategory($data) {
		$name = $this->fm->validation($data['name']);
		$name = mysqli_real_escape_string($this->db->link, $name);
		if (empty($name)) {
			$this->name = '<div class="alert alert-warning">Please enter a category name.</div>';
		} elseif (is_numeric($name)) {
			$this->name = '<div class="alert alert-warning">Category name not should be numeric.</div>';
			return false;
		} elseif (strlen($name) > 50) {
			$this->name = '<div class="alert alert-warning">Category name should be less than 50 characters.</div>';
			return false;
		}
		if ($name) {
			$categoryCheck = "SELECT * FROM `category` WHERE `name` = '$name'";
			$category_check = $this->db->select($categoryCheck);
			if ($category_check == NULL) {
				$query = "INSERT INTO `category`(`name`) VALUES('$name')";
				$result = $this->db->insert($query);
				if ($result) {
					$insertMsg = '<div class="alert alert-success mb-0">Category added successfully.</div>';
					return $insertMsg;
				} else {
					$insertMsg = '<div class="alert alert-warning mb-0">Category does not added!</div>';
					return $insertMsg;
				}
			} else {
				$this->name = '<div class="alert alert-warning">This category already exists.</div>';
			}
		}
	}
	public function updateCategory($data) {
		$category_id = $this->fm->validation($data['category_id']);
		$category_id = mysqli_real_escape_string($this->db->link, $category_id);

		$name = $this->fm->validation($data['name']);
		$name = mysqli_real_escape_string($this->db->link, $name);
		if (empty($name)) {
			$this->name = '<div class="alert alert-warning">Please enter a category name.</div>';
		} elseif (is_numeric($name)) {
			$this->name = '<div class="alert alert-warning">Category name not should be numeric.</div>';
			return false;
		} elseif (strlen($name) > 50) {
			$this->name = '<div class="alert alert-warning">Category name should be less than 50 characters.</div>';
			return false;
		}
		if ($name) {
			$categoryCheck = "SELECT * FROM `category` WHERE `name` = '$name'";
			$category_check = $this->db->select($categoryCheck);
			if ($category_check == NULL) {
				$query = "UPDATE `category` SET `name` = '$name' WHERE `id` = '$category_id'";
				$result = $this->db->update($query);
				if ($result) {
					$updateMsg = '<div class="alert alert-success mb-0">Category updated successfully.</div>';
					return $updateMsg;
				} else {
					$updateMsg = '<div class="alert alert-warning mb-0">Category does not updated!</div>';
					return $updateMsg;
				}
			} else {
				$this->name = '<div class="alert alert-warning">This category already exists.</div>';
			}
		}
	}
	public function allCategory() {
		$query = "SELECT * FROM `category` ORDER BY `id` DESC";
		$result = $this->db->select($query);
		return $result;
	}
	public function singleCategory($editId) {
		$query = "SELECT * FROM `category` WHERE `id` = '$editId'";
		$result = $this->db->select($query);
		return $result;
	}
	public function deleteCategory($category_id) {
		$category_id = $this->fm->validation($category_id);
		$category_id = mysqli_real_escape_string($this->db->link, $category_id);
		$query = "DELETE FROM `category` WHERE `id` = '$category_id'";
		$result = $this->db->delete($query);
		return $result;
	}
}

?>