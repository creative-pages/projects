<?php 
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . '/../lib/Database.php');
include_once ($filepath . '/../healper/Format.php');

class Brand {
	private $db;
	private $fm;
	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	public function insertBrand($brandName) {
		$brandName = $this->fm->validation($brandName);
		$brandName = mysqli_real_escape_string($this->db->link, $brandName);
		if (empty($brandName)) {
			$insertMsg = '<div class="alert alert-warning">Field must not be empty!</div>';
			return $insertMsg;
		} else {
			$query = "INSERT INTO `brand`(`brandName`) VALUES ('$brandName')";
			$result = $this->db->insert($query);
			if ($result) {
				$insertMsg = '<div class="alert alert-success">Brand added successfully.</div>';
				return $insertMsg;
			} else {
				$insertMsg = '<div class="alert alert-warning">Brand does not added!</div>';
				return $insertMsg;
			}
		}
	}
	public function showBrand() {
		$query = "SELECT * FROM `brand` ORDER BY `brandId` DESC";
		$result = $this->db->select($query);
		return $result;
	}
	public function selectRow($id) {
		$query = "SELECT * FROM `brand` WHERE `brandId` = '$id'";
		$result = $this->db->select($query);
		return $result;
	}
	public function updateBrand($brandName, $brandId) {
		$brandName = $this->fm->validation($brandName);
		$brandName = mysqli_real_escape_string($this->db->link, $brandName);
		if (empty($brandName)) {
			$updateMsg = '<div class="alert alert-warning">Field must not be empty!</div>';
			return $updateMsg;
		} else {
			$query = "UPDATE `brand` SET `brandName` = '$brandName' WHERE `brandId` = '$brandId'";
			$result = $this->db->update($query);
			if ($result) {
				$updateMsg = '<div class="alert alert-success">Brand updated successfully.</div>';
				return $updateMsg;
			} else {
				$updateMsg = '<div class="alert alert-warning">Brand does not updated!</div>';
				return $updateMsg;
			}
		}
	}
	public function deleteBrand($id) {
		$query = "DELETE FROM `brand` WHERE `brandId` = '$id'";
		$result = $this->db->delete($query);
		return $result;
	}
}

?>