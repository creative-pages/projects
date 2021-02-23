<?php 
$path = realpath(dirname(__FILE__));
include_once ($path . "/../lib/Session.php");
Session::init();
include_once ($path . "/../lib/Database.php");
include_once ($path . "/../helpers/Format.php");

class Slider {
	public $title;
	public $image;
	public $db;
	public $fm;

	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	public function addSlider($data) {
		$title = $this->fm->validation($data['title']);
		$title = mysqli_real_escape_string($this->db->link, $title);

		$permited = array('jpg', 'jpeg', 'png', 'gif');
		$file_name = $_FILES['image']['name'];
		$file_size = $_FILES['image']['size'];
		$file_tmp = $_FILES['image']['tmp_name'];
		$file_exp = explode(".", $file_name);
		$file_ext = strtolower(end($file_exp));
		$image = substr(md5(time()), 0, 10) . '.' . $file_ext;

		if (empty($title)) {
			$this->title = '<div class="alert alert-warning w-50 mb-0">Title is required.</div>';
		} elseif (is_numeric($title)) {
			$this->title = '<div class="alert alert-warning w-50 mb-0">Title can not be numeric.</div>';
			return false;
		} elseif (strlen($title) > 255) {
			$this->title = '<div class="alert alert-warning w-50 mb-0">Title should be less than 255 characters.</div>';
			return false;
		}
		if (empty($file_name)) {
			$this->image = '<div class="alert alert-warning w-50 mb-0">Image is required.</div>';
		}
		if ($title && $file_name) {
			if ($file_size > 5048567) {
				$this->image = '<div class="alert alert-warning mb-0">Image size should be less than 5mb!</div>';
			} elseif (in_array($file_ext, $permited) == false) {
				$this->image = '<div class="alert alert-warning mb-0">You can upload only:- ' . implode(', ', $permited) . '</div>';
			} else {
				$query = "INSERT INTO `slider`(`title`, `image`) VALUES ('$title', '$image')";
				$result = $this->db->insert($query);
				if ($result) {
					move_uploaded_file($file_tmp, 'uploads/slider/' . $image);
					$insertMsg = '<div class="alert alert-success w-50 mx-auto mb-0">Slider added successfully.</div>';
					return $insertMsg;
				} else {
					$insertMsg = '<div class="alert alert-warning w-50 mx-auto mb-0">Slider does not added!</div>';
					return $insertMsg;
				}
			}
		}

	}
	public function updateSlider($data) {
		$id = $this->fm->validation($data['id']);
		$id = mysqli_real_escape_string($this->db->link, $id);
		$old_file = $this->fm->validation($data['old_file']);
		$old_file = mysqli_real_escape_string($this->db->link, $old_file);

		$title = $this->fm->validation($data['title']);
		$title = mysqli_real_escape_string($this->db->link, $title);

		$permited = array('jpg', 'jpeg', 'png', 'gif');
		$file_name = $_FILES['image']['name'];
		$file_size = $_FILES['image']['size'];
		$file_tmp = $_FILES['image']['tmp_name'];
		$file_exp = explode(".", $file_name);
		$file_ext = strtolower(end($file_exp));
		$image = substr(md5(time()), 0, 10) . '.' . $file_ext;

		if (empty($title)) {
			$this->title = '<div class="alert alert-warning w-50 mb-0">Title is required.</div>';
		} elseif (is_numeric($title)) {
			$this->title = '<div class="alert alert-warning w-50 mb-0">Title can not be numeric.</div>';
			return false;
		} elseif (strlen($title) > 255) {
			$this->title = '<div class="alert alert-warning w-50 mb-0">Title should be less than 255 characters.</div>';
			return false;
		}
		if ($title) {
			if ($file_name) {
				if ($file_size > 5048567) {
					$this->image = '<div class="alert alert-warning mb-0">Image size should be less than 5mb!</div>';
				} elseif (in_array($file_ext, $permited) == false) {
					$this->image = '<div class="alert alert-warning mb-0">You can upload only:- ' . implode(', ', $permited) . '</div>';
				} else {
					$query = "UPDATE `slider` SET `title`= '$title', `image` = '$image' WHERE `id` = '$id'";
					$result = $this->db->update($query);
					if ($result) {
						unlink('uploads/slider/' . $old_file);
						move_uploaded_file($file_tmp, 'uploads/slider/' . $image);
						$updateMsg = '<div class="alert alert-success w-50 mx-auto mb-0">Slider updated successfully.</div>';
						return $updateMsg;
					} else {
						$updateMsg = '<div class="alert alert-warning w-50 mx-auto mb-0">Slider does not updated!</div>';
						return $updateMsg;
					}
				}
			} else {
				$query = "UPDATE `slider` SET `title`= '$title' WHERE `id` = '$id'";
				$result = $this->db->update($query);
				if ($result) {
					$updateMsg = '<div class="alert alert-success w-50 mx-auto mb-0">Slider updated successfully.</div>';
					return $updateMsg;
				} else {
					$updateMsg = '<div class="alert alert-warning w-50 mx-auto mb-0">Slider does not updated!</div>';
					return $updateMsg;
				}
			}
		}

	}
	public function viewSlider() {
		$query = "SELECT * FROM `slider`";
		$result = $this->db->select($query);
		return $result;
	}
	public function selectSlider($id) {
		$query = "SELECT * FROM `slider` WHERE `id` = '$id'";
		$result = $this->db->select($query);
		return $result;
	}
}

?>