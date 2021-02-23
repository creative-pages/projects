<?php 

namespace App\classes;
use App\classes\Database;

class Blog {

    public function addBlog($data) {
    	$title = mysqli_real_escape_string(Database::dbconn(), $data['title']);
        $category_id = mysqli_real_escape_string(Database::dbconn(), $data['category_id']);
        $content = mysqli_real_escape_string(Database::dbconn(), $data['content']);
        $post_by = mysqli_real_escape_string(Database::dbconn(), $data['post_by']);
    	$status = mysqli_real_escape_string(Database::dbconn(), $data['status']);

        $photo = $_FILES['image']['name'];
        $photo_exp = explode(".", $photo);
        $photo_ext = end($photo_exp);
        $image = date("Ymdhis") . '.' . $photo_ext;

    	if ($title && $category_id && $content && $photo && $post_by && $status) {
			$sql = "INSERT INTO `blog`(`title`, `category_id`, `content`, `image`, `post_by`, `status`) VALUES ('$title', '$category_id', '$content', '$image', '$post_by', '$status')";
	    	$result = mysqli_query(Database::dbconn(), $sql);
	    	if ($result) {
                move_uploaded_file($_FILES['image']['tmp_name'], '../uploads/' . $image);
	    		$inser_success = '<div class="alert alert-success mb-none">Blog added successfully.</div>';
	    		return $inser_success;
	    	} else {
	    		$insert_error = '<div class="alert alert-warning mb-none">Blog does not added!</div>';
	    		return $insert_error;
	    	}
    	}
    }

    public function readAllData() {
    	$sql = "SELECT `blog`.`id`, `blog`.`title`, `blog`.`content`, `blog`.`image`, `blog`.`post_by`, `blog`.`status`, `category`.`category_name` FROM `category` INNER JOIN `blog` ON `category`.`id` = `blog`.`category_id` ORDER BY `blog`.`id` DESC";
    	return mysqli_query(Database::dbconn(), $sql);
    }

    public function inactiveStatus($id) {
    	$sql = "UPDATE `blog` SET `status` = '2' WHERE `id` = '$id'";
    	$result = mysqli_query(Database::dbconn(), $sql);
    	if ($result) {
    		header("Location: manage_blog.php");
    	}
    }

    public function activeStatus($id) {
    	$sql = "UPDATE `blog` SET `status` = '1' WHERE `id` = '$id'";
    	$result = mysqli_query(Database::dbconn(), $sql);
    	if ($result) {
    		header("Location: manage_blog.php");
    	}
    }

    public function deleteData($id, $old_file) {
    	$sql = "DELETE FROM `blog` WHERE `id` = '$id'";
    	$result = mysqli_query(Database::dbconn(), $sql);
    	if ($result) {
            unlink('../uploads/' . $old_file);
    		header("Location: manage_blog.php");
    	}
    }

    public function singleBlog($id) {
    	$sql = "SELECT * FROM `blog` WHERE `id` = '$id'";
    	return mysqli_query(Database::dbconn(), $sql);
    }

    public function updateBlog($data) {
    	$id = $data['id'];
        $old_file = $data['old_file'];

    	$title = mysqli_real_escape_string(Database::dbconn(), $data['title']);
        $category_id = mysqli_real_escape_string(Database::dbconn(), $data['category_id']);
        $content = mysqli_real_escape_string(Database::dbconn(), $data['content']);
        $status = mysqli_real_escape_string(Database::dbconn(), $data['status']);

        $photo = $_FILES['image']['name'];
        $photo_exp = explode(".", $photo);
        $photo_ext = end($photo_exp);
        $image = date("Ymdhis") . '.' . $photo_ext;

    	if ($title && $category_id && $content && $status) {
            if ($photo) {
                $sql = "UPDATE `blog` SET `title`= '$title',`category_id`= '$category_id',`content`= '$content',`image`= '$image',`status`= '$status' WHERE `id` = '$id'";
                $result = mysqli_query(Database::dbconn(), $sql);
                if ($result) {
                    unlink('../uploads/' . $old_file);
                    move_uploaded_file($_FILES['image']['tmp_name'], '../uploads/' . $image);
                    $inser_success = '<div class="alert alert-success mb-none">Blog updated successfully.</div>';
                    return $inser_success;
                } else {
                    $insert_error = '<div class="alert alert-warning mb-none">Blog does not updated!</div>';
                    return $insert_error;
                }
            } else {
                $sql = "UPDATE `blog` SET `title`= '$title',`category_id`= '$category_id',`content`= '$content',`status`= '$status' WHERE `id` = '$id'";
                $result = mysqli_query(Database::dbconn(), $sql);
                if ($result) {
                    $inser_success = '<div class="alert alert-success mb-none">Blog updated successfully.</div>';
                    return $inser_success;
                } else {
                    $insert_error = '<div class="alert alert-warning mb-none">Blog does not updated!</div>';
                    return $insert_error;
                }
            }
        }
    }

    public function readActiveBlog() {
    	$sql = "SELECT * FROM `blog` WHERE `status` = '1' ORDER BY `id` DESC";
    	return mysqli_query(Database::dbconn(), $sql);
    }

    public function postByCat($category_id) {
        $sql = "SELECT * FROM `blog` WHERE `category_id` = '$category_id' AND `status` = '1'";
        return mysqli_query(Database::dbconn(), $sql);
    }

    public function postBySearch($keyword) {
        $sql = "SELECT * FROM `blog` WHERE `title` LIKE '%$keyword%' AND `status` = '1'";
        return mysqli_query(Database::dbconn(), $sql);
    }


}


?>