<?php 
$path = realpath(dirname(__FILE__));
include_once ($path . "/../lib/Database.php");
include_once ($path . "/../helpers/Format.php");

class Brand {
	public $name;
	// for brand
	public $first_brand;
	public $second_brand;
	public $third_brand;
	public $fourth_brand;

	public $db;
	public $fm;

	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	public function addBrand($data) {
		$name = $this->fm->validation($data['name']);
		$name = mysqli_real_escape_string($this->db->link, $name);
		if (empty($name)) {
			$this->name = '<div class="alert alert-warning">Please enter a brand name.</div>';
		} elseif (is_numeric($name)) {
			$this->name = '<div class="alert alert-warning">Brand name not should be numeric.</div>';
			return false;
		} elseif (strlen($name) > 50) {
			$this->name = '<div class="alert alert-warning">Brand name should be less than 50 characters.</div>';
			return false;
		}
		if ($name) {
			$brandCheck = "SELECT * FROM `brand` WHERE `name` = '$name'";
			$brand_check = $this->db->select($brandCheck);
			if ($brand_check == NULL) {
				$query = "INSERT INTO `brand`(`name`) VALUES('$name')";
				$result = $this->db->insert($query);
				if ($result) {
					$insertMsg = '<div class="alert alert-success mb-0">Brand added successfully.</div>';
					return $insertMsg;
				} else {
					$insertMsg = '<div class="alert alert-warning mb-0">Brand does not added!</div>';
					return $insertMsg;
				}
			} else {
				$this->name = '<div class="alert alert-warning">This brand already exists.</div>';
			}
		}
	}
	public function updateBrand($data) {
		$brand_id = $this->fm->validation($data['brand_id']);
		$brand_id = mysqli_real_escape_string($this->db->link, $brand_id);

		$name = $this->fm->validation($data['name']);
		$name = mysqli_real_escape_string($this->db->link, $name);
		if (empty($name)) {
			$this->name = '<div class="alert alert-warning">Please enter a brand name.</div>';
		} elseif (is_numeric($name)) {
			$this->name = '<div class="alert alert-warning">Brand name not should be numeric.</div>';
			return false;
		} elseif (strlen($name) > 50) {
			$this->name = '<div class="alert alert-warning">Brand name should be less than 50 characters.</div>';
			return false;
		}
		if ($name) {
			$brandCheck = "SELECT * FROM `brand` WHERE `name` = '$name'";
			$brand_check = $this->db->select($brandCheck);
			if ($brand_check == NULL) {
				$query = "UPDATE `brand` SET `name` = '$name' WHERE `id` = '$brand_id'";
				$result = $this->db->update($query);
				if ($result) {
					$updateMsg = '<div class="alert alert-success mb-0">Brand updated successfully.</div>';
					return $updateMsg;
				} else {
					$updateMsg = '<div class="alert alert-warning mb-0">Brand does not updated!</div>';
					return $updateMsg;
				}
			} else {
				$this->name = '<div class="alert alert-warning">This brand already exists.</div>';
			}
		}
	}
	public function allBrand() {
		$query = "SELECT * FROM `brand` ORDER BY `id` DESC";
		$result = $this->db->select($query);
		return $result;
	}
	public function singleBrand($editId) {
		$query = "SELECT * FROM `brand` WHERE `id` = '$editId'";
		$result = $this->db->select($query);
		return $result;
	}
	public function deleteBrand($brand_id) {
		$brand_id = $this->fm->validation($brand_id);
		$brand_id = mysqli_real_escape_string($this->db->link, $brand_id);
		$query = "DELETE FROM `brand` WHERE `id` = '$brand_id'";
		$result = $this->db->delete($query);
		return $result;
	}

	public function updateTopBrand($data) {
		$first_brand = $data['first_brand'];
		$second_brand = $data['second_brand'];
		$third_brand = $data['third_brand'];
		$fourth_brand = $data['fourth_brand'];

		if (empty($first_brand)) {
			$this->first_brand = '<div class="alert alert-warning mb-0">Please select first brand.</div>';
		}
		if (empty($second_brand)) {
			$this->second_brand = '<div class="alert alert-warning mb-0">Please select second brand.</div>';
		}
		if (empty($third_brand)) {
			$this->third_brand = '<div class="alert alert-warning mb-0">Please select third brand.</div>';
		}
		if (empty($fourth_brand)) {
			$this->fourth_brand = '<div class="alert alert-warning mb-0">Please select fourth brand.</div>';
		}
		if ($first_brand && $second_brand && $third_brand && $fourth_brand) {
			$query = "UPDATE `top_brand` SET `first_brand` = '$first_brand', `second_brand` = '$second_brand', `third_brand` = '$third_brand', `fourth_brand` = '$fourth_brand' WHERE `id` = '1'";
			$result = $this->db->update($query);
			if ($result) {
				$updateMsg = '<div class="alert alert-success mb-0">Top Brand updated successfully.</div>';
				return $updateMsg;
			} else {
				$updateMsg = '<div class="alert alert-warning mb-0">Top Brand does not updated!</div>';
				return $updateMsg;
			}
		}
	}
	public function topBrand() {
		$brand = "SELECT * FROM `top_brand` WHERE `id` = '1'";
		$result = $this->db->select($brand);
		return $result;
	}
	public function firstBrand($first_brand) {
		$query = "SELECT `product`.`id`, `product`.`description`, `product`.`image`, `brand`.`name`
			FROM `product`
			INNER JOIN `brand` ON `brand`.`id` = `product`.`brand_id`
			WHERE `product`.`brand_id` = '$first_brand' ORDER BY `product`.`id` DESC LIMIT 1";
		$result = $this->db->select($query);
		return $result;
	}
	public function secondBrand($second_brand) {
		$query = "SELECT `product`.`id`, `product`.`description`, `product`.`image`, `brand`.`name`
			FROM `product`
			INNER JOIN `brand` ON `brand`.`id` = `product`.`brand_id`
			WHERE `product`.`brand_id` = '$second_brand' ORDER BY `product`.`id` DESC LIMIT 1";
		$result = $this->db->select($query);
		return $result;
	}
	public function thirdBrand($third_brand) {
		$query = "SELECT `product`.`id`, `product`.`description`, `product`.`image`, `brand`.`name`
			FROM `product`
			INNER JOIN `brand` ON `brand`.`id` = `product`.`brand_id`
			WHERE `product`.`brand_id` = '$third_brand' ORDER BY `product`.`id` DESC LIMIT 1";
		$result = $this->db->select($query);
		return $result;
	}
	public function fourthBrand($fourth_brand) {
		$query = "SELECT `product`.`id`, `product`.`description`, `product`.`image`, `brand`.`name`
			FROM `product`
			INNER JOIN `brand` ON `brand`.`id` = `product`.`brand_id`
			WHERE `product`.`brand_id` = '$fourth_brand' ORDER BY `product`.`id` DESC LIMIT 1";
		$result = $this->db->select($query);
		return $result;
	}
}

?>