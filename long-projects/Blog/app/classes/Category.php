<?php 

namespace App\classes;
use App\classes\Database;

class Category {
    public function addCategory($data) {
    	$category_name = $data['category_name'];
    	$status = $data['status'];

    	$result = mysqli_query(Database::dbconn(), "INSERT INTO `category`(`category_name`, `status`) VALUES ('$category_name', '$status')");
    	if ($result) {
    		$insertMsg = "Category added successfully.";
    		return $insertMsg;
    	} else {
    		$insertMsg = "Category not added.";
    		return $insertMsg;
    	}
    	
    }
    public function allCategory() {
    	$result = mysqli_query(Database::dbconn(), "SELECT * FROM `category`");
    	return $result;
    }
    public function allactiveCategory() {
    	$result = mysqli_query(Database::dbconn(), "SELECT * FROM `category` WHERE `status` = '1'");
    	return $result;
    }
    public function allactivePost() {
        $result = mysqli_query(Database::dbconn(), "SELECT * FROM `blog` WHERE `status` = '1' ORDER BY `id` DESC");
        return $result;
    }
    public function selectRow($id = '') {
    	$result = mysqli_query(Database::dbconn(), "SELECT * FROM `category` WHERE `id` = '$id'");
    	return $result;
    }
    public function updateCategory($data) {
    	$category_name = $data['category_name'];
    	$category_id = $data['category_id'];
    	$status = $data['status'];
    	$result = mysqli_query(Database::dbconn(), "UPDATE `category` SET `category_name` = '$category_name', `status`= '$status' WHERE `id` = '$category_id'");
    	if ($result) {
    		header("Location: manage-category.php?id=" . base64_encode($category_id));
    	} else {
    		$insertMsg = "Category not updated!";
    		return $insertMsg;
    	}
    }
    public function active($id) {
    	$result = mysqli_query(Database::dbconn(), "UPDATE `category` SET `status`= '1' WHERE `id` = '$id'");
    	return $result;
    }
    public function inactive($id) {
    	$result = mysqli_query(Database::dbconn(), "UPDATE `category` SET `status`= '0' WHERE `id` = '$id'");
    	return $result;
    }
    public function delete($id) {
    	$result = mysqli_query(Database::dbconn(), "DELETE FROM `category` WHERE `id` = '$id'");
    	return $result;
    }
    public function singlePost($get_id) {
        $result = mysqli_query(Database::dbconn(), "SELECT * FROM `blog` WHERE `id` = '$get_id'");
        return $result;
    }

    public function catPost($cat_id) {
        $result = mysqli_query(Database::dbconn(), "SELECT * FROM `blog` WHERE `status` = '1' AND `category_id` = '$cat_id' ORDER BY `id` DESC");
        return $result;
    }
    public function searchPost($search) {
        $result = mysqli_query(Database::dbconn(), "SELECT * FROM `blog` WHERE `content` LIKE '%$search%' AND `status` = '1' ORDER BY `id` DESC");
        return $result;
    }

}


?>