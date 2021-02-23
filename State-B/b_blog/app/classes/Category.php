<?php 

namespace App\classes;
use App\classes\Database;

class Category {
	public $category_name;

    public function addCategory($data) {
    	$category_name = $data['category_name'];
    	$status = $data['status'];

    	if ($category_name && $status) {
    		$check_cat = mysqli_query(Database::dbconn(), "SELECT * FROM `category` WHERE `category_name` = '$category_name'");

    		if (mysqli_num_rows($check_cat) == 0) {
    			$sql = "INSERT INTO `category`(`category_name`, `status`) VALUES ('$category_name', '$status')";
		    	$result = mysqli_query(Database::dbconn(), $sql);
		    	if ($result) {
		    		$inser_success = '<div class="alert alert-success mb-none">Category inserted successfully.</div>';
		    		return $inser_success;
		    	} else {
		    		$insert_error = '<div class="alert alert-warning mb-none">Category does not inserted!</div>';
		    		return $insert_error;
		    	}
    		} else {
    			$this->category_name = '<div class="alert alert-warning mb-none">This category have already been exist!</div>';
    		}
    	}
    }

    public function readAllData() {
    	$sql = "SELECT * FROM `category` ORDER BY `id` DESC";
    	return mysqli_query(Database::dbconn(), $sql);
    }

    public function inactiveStatus($id) {
    	$sql = "UPDATE `category` SET `status` = '2' WHERE `id` = '$id'";
    	$result = mysqli_query(Database::dbconn(), $sql);
    	if ($result) {
    		header("Location: manage_category.php");
    	}
    }

    public function activeStatus($id) {
    	$sql = "UPDATE `category` SET `status` = '1' WHERE `id` = '$id'";
    	$result = mysqli_query(Database::dbconn(), $sql);
    	if ($result) {
    		header("Location: manage_category.php");
    	}
    }

    public function deleteData($id) {
    	$sql = "DELETE FROM `category` WHERE `id` = '$id'";
    	$result = mysqli_query(Database::dbconn(), $sql);
    	if ($result) {
    		header("Location: manage_category.php");
    	}
    }

    public function singleCategory($id) {
    	$sql = "SELECT * FROM `category` WHERE `id` = '$id'";
    	return mysqli_query(Database::dbconn(), $sql);
    }

    public function updateCategory($data) {
    	$id = $data['id'];

    	$category_name = $data['category_name'];
    	$status = $data['status'];

    	if ($category_name && $status) {
    		$check_cat = mysqli_query(Database::dbconn(), "SELECT * FROM `category` WHERE `category_name` = '$category_name'");
    		$check_cat_self = mysqli_query(Database::dbconn(), "SELECT * FROM `category` WHERE `id` = '$id'");
    		$check_cat_self_result = mysqli_fetch_assoc($check_cat_self);

    		if (mysqli_num_rows($check_cat) == 0 OR $check_cat_self_result['category_name'] == $category_name) {
    			$sql = "UPDATE `category` SET `category_name`= '$category_name',`status`= '$status' WHERE `id` = '$id'";
		    	$result = mysqli_query(Database::dbconn(), $sql);
		    	if ($result) {
		    		$inser_success = '<div class="alert alert-success mb-none">Category updated successfully.</div>';
		    		return $inser_success;
		    	} else {
		    		$insert_error = '<div class="alert alert-warning mb-none">Category does not updated!</div>';
		    		return $insert_error;
		    	}
    		} else {
    			$this->category_name = '<div class="alert alert-warning mb-none">This category have already been exist!</div>';
    		}
    	}
    }

    public function readActiveCategory() {
    	$sql = "SELECT * FROM `category` WHERE `status` = '1'";
    	return mysqli_query(Database::dbconn(), $sql);
    }
}


?>