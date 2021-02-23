<?php 
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . '/../lib/Database.php');
include_once ($filepath . '/../healper/Format.php');
class Slider {
	public $title;
	public $image;

	private $db;
	private $fm;

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
			$this->title = '<div class="alert alert-warning w-50">This field is required.</div>';
		}
		if (empty($file_name)) {
			$this->image = '<div class="alert alert-warning w-50">Please select an image.</div>';
		}
		if ($title && $file_name) {
			if ($file_size > 5048567) {
				$this->image = '<div class="alert alert-warning w-50">Image size must be less than 5mb!</div>';
			} elseif (in_array($file_ext, $permited) === false) {
				$this->image = '<div class="alert alert-warning w-50">You can upload only:- ' . implode(", ", $permited) . '</div>';
			} else {
				$query = "INSERT INTO `slider`(`image`, `title`) VALUES ('$image', '$title')";
				$result = $this->db->insert($query);
				if ($result) {
					move_uploaded_file($file_tmp, 'uploads/slider/' . $image);
					$insertMsg = '<div class="alert alert-success">Slider added successfully.</div>';
					return $insertMsg;
				} else {
					$insertMsg = '<div class="alert alert-warning">Slider does not added!</div>';
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
			$this->title = '<div class="alert alert-warning w-50">This field is required.</div>';
		}
		if ($title) {
			if (empty($file_name)) {
				$query = "UPDATE `slider` SET `title`= '$title' WHERE `id` = '$id'";
				$result = $this->db->update($query);
				if ($result) {
					$updateMsg = '<div class="alert alert-success">Slider updated successfully.</div>';
					return $updateMsg;
				} else {
					$updateMsg = '<div class="alert alert-warning">Slider does not updated!</div>';
					return $updateMsg;
				}
			} else {
				if ($file_size > 5048567) {
					$this->image = '<div class="alert alert-warning w-50">Image size must be less than 5mb!</div>';
				} elseif (in_array($file_ext, $permited) === false) {
					$this->image = '<div class="alert alert-warning w-50">You can upload only:- ' . implode(", ", $permited) . '</div>';
				} else {
					$query = "UPDATE `slider` SET `image`= '$image',`title`= '$title' WHERE `id` = '$id'";
					$result = $this->db->update($query);
					if ($result) {
						unlink('uploads/slider/' . $old_file);
						move_uploaded_file($file_tmp, 'uploads/slider/' . $image);
						$updateMsg = '<div class="alert alert-success">Slider updated successfully.</div>';
						return $updateMsg;
					} else {
						$updateMsg = '<div class="alert alert-warning">Slider does not updated!</div>';
						return $updateMsg;
					}
				}
			}
		}
	}
	public function viewSlider() {
		$query = "SELECT * FROM `slider` ORDER BY `id` DESC";
		$result = $this->db->select($query);
		return $result;
	}
	public function singleSlider($id) {
		$query = "SELECT * FROM `slider` WHERE `id` = '$id'";
		$result = $this->db->select($query);
		return $result;
	}
	public function deleteSlder($id, $old_file) {
		$query = "DELETE FROM `slider` WHERE `id` = '$id'";
		$result = $this->db->delete($query);
		if ($result) {
			unlink("uploads/slider/" . $old_file);
			header("Location: slider-list.php");
		}
	}
}

?>