<?php 

namespace App\classes;
use App\Classes\Database;

class Blog {
    public function addBlog($data) {
    	$category_id = $data['category_id'];
    	$title = mysqli_real_escape_string(Database::dbconn(), $data['title']);
        $content = mysqli_real_escape_string(Database::dbconn(), $data['content']);
        $post_by = $data['post_by'];
        $status = $data['status'];
        $image = explode(".", $_FILES['photo']['name']);
        $photo = date("dmyhis") . '.' . end($image);

    	$result = mysqli_query(Database::dbconn(), "INSERT INTO `blog`(`category_id`, `title`, `content`, `photo`, `post_by`, `status`) VALUES ('$category_id', '$title', '$content', '$photo', '$post_by', '$status')");
    	if ($result) {
            move_uploaded_file($_FILES['photo']['tmp_name'], "../uploads/" . $photo);
    	?>
		<script type="text/javascript">
			alert("Blog created successfully.");
		</script>
    	<?php
    	} else {
    	?>
		<script type="text/javascript">
			alert("Blog does not created!");
		</script>
    	<?php

    	}
    	
    }
    public function allactiveCategory() {
    	$result = mysqli_query(Database::dbconn(), "SELECT * FROM `category` WHERE `status` = '1'");
    	return $result;
    }
    public function allBlog() {
        $result = mysqli_query(Database::dbconn(), "SELECT `blog`.*, `category`.`category_name`
            FROM `blog`
            INNER JOIN `category` ON `category`.`id` = `blog`.`category_id` ORDER BY `id` DESC");
        return $result;
    }
    public function inactive($id) {
        mysqli_query(Database::dbconn(), "UPDATE `blog` SET `status`= '0' WHERE `id` = '$id'");
    }
    public function active($id) {
        mysqli_query(Database::dbconn(), "UPDATE `blog` SET `status`= '1' WHERE `id` = '$id'");
    }
    public function deleteBlog($id) {
        mysqli_query(Database::dbconn(), "DELETE FROM `blog` WHERE `id` = '$id'");
    }
    public function selectBlog($id) {
        $result = mysqli_query(Database::dbconn(), "SELECT * FROM `blog` WHERE `id` = '$id'");
        return $result;
    }
    public function updateBlog($data) {
        $category_id = $data['category_id'];
        $id = $data['id'];
        $title = mysqli_real_escape_string(Database::dbconn(), $data['title']);
        $content = mysqli_real_escape_string(Database::dbconn(), $data['content']);
        $post_by = $data['post_by'];
        $status = $data['status'];

        if ($_FILES['photo']['name'] == NULL) {
            $result = mysqli_query(Database::dbconn(), "UPDATE `blog` SET `category_id`= '$category_id',`title`= '$title',`content`= '$content',`post_by`= '$post_by',`status`= '$status' WHERE `id` = '$id'");
        } else {
            $image = explode(".", $_FILES['photo']['name']);
            $photo = date("dmyhis") . '.' . end($image);
            $result = mysqli_query(Database::dbconn(), "UPDATE `blog` SET `category_id`= '$category_id',`title`= '$title',`content`= '$content',`photo`= '$photo',`post_by`= '$post_by',`status`= '$status' WHERE `id` = '$id'");
            move_uploaded_file($_FILES['photo']['tmp_name'], "../uploads/" . $photo);
        }
        if ($result) {
        ?>
        <script type="text/javascript">
            alert("Blog updated successfully.");
        </script>
        <?php
        } else {
        ?>
        <script type="text/javascript">
            alert("Blog does not update!");
        </script>
        <?php

        }
        
    }
    public function activeBlog() {
        $result = mysqli_query(Database::dbconn(), "SELECT * FROM `blog` WHERE `status` = '1'");
        return $result;
    }
    public function blogPost($id) {
        $result = mysqli_query(Database::dbconn(), "SELECT * FROM `blog` WHERE `id` = '$id'");
        return $result;
    }
}


?>