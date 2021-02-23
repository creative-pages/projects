<?php 
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . '/../lib/Database.php');
include_once ($filepath . '/../healper/Format.php');
class Category {
	private $db;
	private $fm;

	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	public function addCategory($data) {
		$category_name = $this->fm->validation($data['category_name']);
		$category_name = mysqli_real_escape_string($this->db->link, $category_name);
		if (!empty($category_name)) {
			$categoryCheck = "SELECT * FROM `category` WHERE `category_name` = '$category_name'";
			$categorycheck = $this->db->select($categoryCheck);
			if ($categorycheck == NULL) {
				$query = "INSERT INTO `category`(`category_name`) VALUES('$category_name')";
				$result = $this->db->insert($query);
				if ($result) {
					$insertMsg = '<div class="alert alert-success">Category added successfully.</div>';
					return $insertMsg;
				} else {
					$insertMsg = '<div class="alert alert-warning">Category does not added!</div>';
					return $insertMsg;
				}
			} else {
				$insertMsg = '<div class="alert alert-warning">This category already added!</div>';
					return $insertMsg;
			}
		} else {
			$insertMsg = '<div class="alert alert-warning">This field is required.</div>';
					return $insertMsg;
		}
	}
	public function updateCategory($data) {
		$category_name = $this->fm->validation($data['category_name']);
		$category_name = mysqli_real_escape_string($this->db->link, $category_name);
		$categoryId = $this->fm->validation($data['categoryId']);
		$categoryId = mysqli_real_escape_string($this->db->link, $categoryId);
		if (!empty($category_name)) {
			$categoryCheck = "SELECT * FROM `category` WHERE `category_name` = '$category_name'";
			$categorycheck = $this->db->select($categoryCheck);
			if ($categorycheck == NULL) {
				$query = "UPDATE `category` SET `category_name` = '$category_name' WHERE `id` = '$categoryId'";
				$result = $this->db->update($query);
				if ($result) {
					$updateMsg = '<div class="alert alert-success">Category updated successfully.</div>';
					return $updateMsg;
				} else {
					$updateMsg = '<div class="alert alert-warning">Category does not updated!</div>';
					return $updateMsg;
				}
			} else {
				$updateMsg = '<div class="alert alert-warning">This category already added!</div>';
					return $updateMsg;
			}
		} else {
			$updateMsg = '<div class="alert alert-warning">This field is required.</div>';
					return $updateMsg;
		}
	}
	public function allCategory() {
		$query = "SELECT * FROM `category`";
		$result = $this->db->select($query);
		return $result;
	}
	public function selectCategory($id) {
		$query = "SELECT * FROM `category` WHERE `id` = '$id'";
		$result = $this->db->select($query);
		return $result;
	}
	public function deleteCategory($id) {
		$query = "DELETE FROM `category` WHERE `id` = '$id'";
		$result = $this->db->delete($query);
		if ($result) {
			header("Location: catlist.php");
		}
	}
}

?>