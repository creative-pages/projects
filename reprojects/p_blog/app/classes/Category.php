<?php 

namespace App\classes;
use App\Classes\Database;

class Category {
    public function addCategory($data) {
    	$category_name = $data['category_name'];
    	$status = $data['status'];

    	$result = mysqli_query(Database::dbconn(), "INSERT INTO `category`(`category_name`, `status`) VALUES ('$category_name', '$status')");
    	if ($result) {
    	?>
		<script type="text/javascript">
			alert("Category added successfully.");
		</script>
    	<?php
    	} else {
    	?>
		<script type="text/javascript">
			alert("Category does not added!");
		</script>
    	<?php

    	}
    	
    }
    public function allCategory() {
    	$result = mysqli_query(Database::dbconn(), "SELECT * FROM `category`");
    	return $result;
    }
    public function selectCategory($id) {
    	$result = mysqli_query(Database::dbconn(), "SELECT * FROM `category` WHERE `id` = '$id'");
    	return $result;
    }
    public function inactive($id) {
    	mysqli_query(Database::dbconn(), "UPDATE `category` SET `status`= '0' WHERE `id` = '$id'");
    }
    public function active($id) {
    	mysqli_query(Database::dbconn(), "UPDATE `category` SET `status`= '1' WHERE `id` = '$id'");
    }
    public function deleteCategory($id) {
    	mysqli_query(Database::dbconn(), "DELETE FROM `category` WHERE `id` = '$id'");
    }
    public function updateCategory($data) {
    	$id = $data['id'];
    	$category_name = $data['category_name'];
    	$status = $data['status'];
    	$result = mysqli_query(Database::dbconn(), "UPDATE `category` SET `category_name`= '$category_name',`status`= '$status' WHERE `id` = '$id'");
    	if ($result) {
    		header("Location: edit-category.php?id=" . $id . "&action=edit");
    	} else {
    		header("Location: edit-category.php?id=" . $id . "&action=edit");
    	}
    }
    public function catPost($catid) {
        $result = mysqli_query(Database::dbconn(), "SELECT * FROM `blog` WHERE `status` = '1' AND `category_id` = '$catid'");
        return $result;
    }
    public function searchPost($search) {
        $result = mysqli_query(Database::dbconn(), "SELECT * FROM `blog` WHERE `status` = '1' AND `title` LIKE '%$search%'");
        return $result;
    }
}


?>