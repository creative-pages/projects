<?php 

namespace App\classes;

use App\classes\Database;

class Blog {
	
    public function addBlog($data) {
    	$category_id = $data['category_id'];
    	$title = mysqli_real_escape_string(Database::dbconn(), $data['title']);
    	$content = mysqli_real_escape_string(Database::dbconn(), $data['content']);
    	$name = $_SESSION['name'];
    	$status = $data['status'];
    	$file = explode(".", $_FILES['photo']['name']);
    	$file_ex = end($file);
    	$photo = date("dmyhis") . '.' . $file_ex;
    	

    	$result = mysqli_query(Database::dbconn(), "INSERT INTO `blog`(`category_id`, `title`, `content`, `photo`, `name`, `status`) VALUES ('$category_id', '$title', '$content', '$photo', '$name', '$status')");
    	if ($result) {
    		move_uploaded_file($_FILES['photo']['tmp_name'], "../uploads/" . $photo);
    		$insertMsg = "Blog created successfully.";
    		return $insertMsg;
    	} else {
    		$insertMsg = "Something is wrong!";
    		return $insertMsg;
    	} 
    	
    }
    public function selectRow($id = '') {
    	$result = mysqli_query(Database::dbconn(), "SELECT * FROM `blog` WHERE `id` = '$id'");
    	return $result;
    }
    public function updateBlog($data) {
    	$id = $data['id'];
    	$category_id = $data['category_id'];
    	$title = mysqli_real_escape_string(Database::dbconn(), $data['title']);
    	$content = mysqli_real_escape_string(Database::dbconn(), $data['content']);
    	$status = $data['status'];

    	if ($_FILES['photo']['name'] == NULL) {
    		$result = mysqli_query(Database::dbconn(), "UPDATE `blog` SET `category_id`='$category_id',`title`='$title',`content`='$content',`status`='$status' WHERE `id` = '$id'");
    	} else {
    		$file = explode(".", $_FILES['photo']['name']);
	    	$file_ex = end($file);
	    	$photo = date("dmyhis") . '.' . $file_ex;
	    	$result = mysqli_query(Database::dbconn(), "UPDATE `blog` SET `category_id`='$category_id',`title`='$title',`content`='$content',`photo`='$photo',`status`='$status' WHERE `id` = '$id'");
	    	move_uploaded_file($_FILES['photo']['tmp_name'], "../uploads/" . $photo);
    	}
    	if ($result) {
    		$insertMsg = "Blog updated successfully.";
    		return $insertMsg;
    	} else {
    		$insertMsg = "Something is wrong!";
    		return $insertMsg;
    	}
    	
    }
    public function allBlog() {
    	$result = mysqli_query(Database::dbconn(), "SELECT `blog`.* , `category`.`category_name`
		FROM `blog`
		INNER JOIN `category` ON `blog`.`category_id` = `category`.`id` ORDER BY `id` DESC");
    	return $result;
    }
    public function active($id) {
    	$result = mysqli_query(Database::dbconn(), "UPDATE `blog` SET `status`= '1' WHERE `id` = '$id'");
    	return $result;
    }
    public function inactive($id) {
    	$result = mysqli_query(Database::dbconn(), "UPDATE `blog` SET `status`= '0' WHERE `id` = '$id'");
    	return $result;
    }
    public function delete($id) {
    	$result = mysqli_query(Database::dbconn(), "DELETE FROM `blog` WHERE `id` = '$id'");
    	return $result;
    }
}


?>