<?php 
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . '/../lib/Database.php');
include_once ($filepath . '/../healper/Format.php');
class Post {
	public $category_id;
	public $title;
	public $content;
	public $author;
	public $tags;
	public $image;

	private $db;
	private $fm;

	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	public function addPost($data) {
		$category_id = $this->fm->validation($data['category_id']);
		$category_id = mysqli_real_escape_string($this->db->link, $category_id);
		$title = $this->fm->validation($data['title']);
		$title = mysqli_real_escape_string($this->db->link, $title);
		$content = $this->fm->validation($data['content']);
		$content = mysqli_real_escape_string($this->db->link, $content);
		$author = $this->fm->validation($data['author']);
		$author = mysqli_real_escape_string($this->db->link, $author);
		$user_id = $this->fm->validation($data['user_id']);
		$user_id = mysqli_real_escape_string($this->db->link, $user_id);
		$tags = $this->fm->validation($data['tags']);
		$tags = mysqli_real_escape_string($this->db->link, $tags);

		$permited = array('jpg', 'jpeg', 'png', 'gif');
		$file_name = $_FILES['image']['name'];
		$file_size = $_FILES['image']['size'];
		$file_tmp = $_FILES['image']['tmp_name'];
		$file_exp = explode(".", $file_name);
		$file_ext = strtolower(end($file_exp));
		$image = substr(md5(time()), 0, 10) . '.' . $file_ext;

		if (empty($category_id)) {
			$this->category_id = '<div class="alert alert-warning w-50">Category name is required.</div>';
		}
		if (empty($title)) {
			$this->title = '<div class="alert alert-warning w-50">Title is required.</div>';
		}
		if (empty($content)) {
			$this->content = '<div class="alert alert-warning w-50">Content is required.</div>';
		}
		if (empty($tags)) {
			$this->tags = '<div class="alert alert-warning w-50">Please enter one or more tags.</div>';
		}
		if (empty($file_name)) {
			$this->image = '<div class="alert alert-warning w-50">Select an image for your post.</div>';
		}
		if ($category_id && $title && $content && $tags && $file_name && $author) {
			if ($file_size > 5048567) {
				$this->image = '<div class="alert alert-warning w-50">File size should be less than 5mb!</div>';
			} elseif (in_array($file_ext , $permited) === false) {
				$this->image = '<div class="alert alert-warning w-50">You can upload only:- ' . implode(", ", $permited) . '</div>';
			} else {
				$query = "INSERT INTO `post`(`category_id`, `title`, `content`, `image`, `author`, `user_id`, `tags`) VALUES ('$category_id', '$title', '$content', '$image', '$author', '$user_id', '$tags')";
				$result = $this->db->insert($query);
				if ($result) {
					move_uploaded_file($file_tmp, 'uploads/' . $image);
					$insertMsg = '<div class="alert alert-success w-50 ml-135">Post inserted successfully.</div>';
					return $insertMsg;
				} else {
					$insertMsg = '<div class="alert alert-warning w-50 ml-135">Post does not inserted.</div>';
					return $insertMsg;
				}
			}
		}
	}

	public function updatePost($data) {
		$postId = $this->fm->validation($data['postId']);
		$postId = mysqli_real_escape_string($this->db->link, $postId);
		$old_file = $this->fm->validation($data['old_file']);
		echo $old_file = mysqli_real_escape_string($this->db->link, $old_file);

		$category_id = $this->fm->validation($data['category_id']);
		$category_id = mysqli_real_escape_string($this->db->link, $category_id);
		$title = $this->fm->validation($data['title']);
		$title = mysqli_real_escape_string($this->db->link, $title);
		$content = $this->fm->validation($data['content']);
		$content = mysqli_real_escape_string($this->db->link, $content);
		$author = $this->fm->validation($data['author']);
		$author = mysqli_real_escape_string($this->db->link, $author);
		$user_id = $this->fm->validation($data['user_id']);
		$user_id = mysqli_real_escape_string($this->db->link, $user_id);
		$tags = $this->fm->validation($data['tags']);
		$tags = mysqli_real_escape_string($this->db->link, $tags);

		$permited = array('jpg', 'jpeg', 'png', 'gif');
		$file_name = $_FILES['image']['name'];
		$file_size = $_FILES['image']['size'];
		$file_tmp = $_FILES['image']['tmp_name'];
		$file_exp = explode(".", $file_name);
		$file_ext = strtolower(end($file_exp));
		$image = substr(md5(time()), 0, 10) . '.' . $file_ext;

		if (empty($category_id)) {
			$this->category_id = '<div class="alert alert-warning w-50">Category name is required.</div>';
		}
		if (empty($title)) {
			$this->title = '<div class="alert alert-warning w-50">Title is required.</div>';
		}
		if (empty($content)) {
			$this->content = '<div class="alert alert-warning w-50">Content is required.</div>';
		}
		if (empty($tags)) {
			$this->tags = '<div class="alert alert-warning w-50">Please enter one or more tags.</div>';
		}
		if ($category_id && $title && $content && $tags && $author) {
			if ($file_name) {
				if ($file_size > 5048567) {
					$this->image = '<div class="alert alert-warning w-50">File size should be less than 5mb!</div>';
				} elseif (in_array($file_ext , $permited) === false) {
					$this->image = '<div class="alert alert-warning w-50">You can upload only:- ' . implode(", ", $permited) . '</div>';
				} else {
					$query = "UPDATE `post` SET `category_id`= '$category_id',`title`= '$title',`content`= '$content',`image`= '$image',`author`= '$author', `user_id` = '$user_id',`tags`= '$tags' WHERE `id` = '$postId'";
					$result = $this->db->insert($query);
					if ($result) {
						unlink("uploads/" . $old_file);
						move_uploaded_file($file_tmp, 'uploads/' . $image);
						$insertMsg = '<div class="alert alert-success w-50 ml-135">Post inserted successfully.</div>';
						return $insertMsg;
					} else {
						$insertMsg = '<div class="alert alert-warning w-50 ml-135">Post does not inserted.</div>';
						return $insertMsg;
					}
				}
			} else {
				$query = "UPDATE `post` SET `category_id`= '$category_id',`title`= '$title',`content`= '$content',`author`= '$author',`tags`= '$tags' WHERE `id` = '$postId'";
				$result = $this->db->insert($query);
				if ($result) {
					$insertMsg = '<div class="alert alert-success w-50 ml-135">Post inserted successfully.</div>';
					return $insertMsg;
				} else {
					$insertMsg = '<div class="alert alert-warning w-50 ml-135">Post does not inserted.</div>';
					return $insertMsg;
				}
			}
		}
	}
	public function allPostLimit($start_from, $per_page) {
		$query = "SELECT * FROM `post` ORDER BY `id` DESC LIMIT $start_from, $per_page";
		$result = $this->db->select($query);
		return $result;
	}
	public function allPost() {
		$query = "SELECT * FROM `post` ORDER BY `id` DESC";
		$result = $this->db->select($query);
		return $result;
	}
	public function allAdminPanelPost() {
		$query = "SELECT `post`.*, `category`.`category_name`
				FROM `post`
				INNER JOIN `category` ON `category`.`id` = `post`.`category_id` ORDER BY `post`.`id` DESC";
		$result = $this->db->select($query);
		return $result;
	}
	public function singlePost($id) {
		$id = $this->fm->validation($id);
		$id = mysqli_real_escape_string($this->db->link, $id);
		$query = "SELECT * FROM `post` WHERE `id` = '$id'";
		$result = $this->db->select($query);
		return $result;
	}
	public function relatedPost($id) {
		$id = $this->fm->validation($id);
		$id = mysqli_real_escape_string($this->db->link, $id);
		$query = "SELECT * FROM `post` WHERE `category_id` = '$id' ORDER BY rand() LIMIT 3";
		$result = $this->db->select($query);
		return $result;
	}
	public function postByCategory($id) {
		$id = $this->fm->validation($id);
		$id = mysqli_real_escape_string($this->db->link, $id);
		$query = "SELECT * FROM `post` WHERE `category_id` = '$id' ORDER BY `id` DESC";
		$result = $this->db->select($query);
		return $result;
	}
	public function latestPost() {
		$query = "SELECT * FROM `post` ORDER BY `id` DESC LIMIT 4";
		$result = $this->db->select($query);
		return $result;
	}
	public function searchPost($keyword) {
		$query = "SELECT * FROM `post` WHERE `title` LIKE '%$keyword%' OR `content` LIKE '%$keyword%' ORDER BY `id` DESC";
		$result = $this->db->select($query);
		return $result;
	}
	public function deletePost($id) {
		$id = $this->fm->validation($id);
		$id = mysqli_real_escape_string($this->db->link, $id);
		$query = "DELETE FROM `post` WHERE `id` = '$id'";
		$result = $this->db->delete($query);
		if ($result) {
			header("Location: postlist.php");
		}
	}
}

?>