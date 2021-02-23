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
	public function insertCategory($categoryName) {
		$categoryName = $this->fm->validation($categoryName);
		$categoryName = mysqli_real_escape_string($this->db->link, $categoryName);
		if (empty($categoryName)) {
			$insertMsg = '<div class="alert alert-warning">Field must not be empty!</div>';
			return $insertMsg;
		} else {
			$query = "INSERT INTO `category`(`categoryName`) VALUES ('$categoryName')";
			$result = $this->db->insert($query);
			if ($result) {
				$insertMsg = '<div class="alert alert-success">Category added successfully.</div>';
				return $insertMsg;
			} else {
				$insertMsg = '<div class="alert alert-warning">Category does not added!</div>';
				return $insertMsg;
			}
		}
	}
	public function showCategory() {
		$query = "SELECT * FROM `category` ORDER BY `categoryId` DESC";
		$result = $this->db->select($query);
		return $result;
	}
	public function selectRow($id) {
		$query = "SELECT * FROM `category` WHERE `categoryId` = '$id'";
		$result = $this->db->select($query);
		return $result;
	}
	public function updateCategory($categoryName, $categoryId) {
		$categoryName = $this->fm->validation($categoryName);
		$categoryName = mysqli_real_escape_string($this->db->link, $categoryName);
		if (empty($categoryName)) {
			$updateMsg = '<div class="alert alert-warning">Field must not be empty!</div>';
			return $updateMsg;
		} else {
			$query = "UPDATE `category` SET `categoryName` = '$categoryName' WHERE `categoryId` = '$categoryId'";
			$result = $this->db->update($query);
			if ($result) {
				$updateMsg = '<div class="alert alert-success">Category updated successfully.</div>';
				return $updateMsg;
			} else {
				$updateMsg = '<div class="alert alert-warning">Category does not updated!</div>';
				return $updateMsg;
			}
		}
	}
	public function deleteCategory($id) {
		$query = "DELETE FROM `category` WHERE `categoryId` = '$id'";
		$result = $this->db->delete($query);
		return $result;
	}
	
}

?>