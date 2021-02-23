<?php 
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . '/../lib/Database.php');
include_once ($filepath . '/../healper/Format.php');
class TitleSlogan {
	public $title;
	public $slogan;
	public $logo;

	public $facebook;
	public $twitter;
	public $linkedin;
	public $google;

	public $copy_right;

	private $db;
	private $fm;

	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	public function viewTitleSlogan() {
		$query = "SELECT * FROM `title_slogan`";
		$result = $this->db->select($query);
		return $result;
	}
	public function updateTitleSlogan($data) {
		$title = $this->fm->validation($data['title']);
		$title = mysqli_real_escape_string($this->db->link, $title);
		$slogan = $this->fm->validation($data['slogan']);
		$slogan = mysqli_real_escape_string($this->db->link, $slogan);

		$permited = array('jpg', 'jpeg', 'png', 'gif');
		$file_name = $_FILES['logo']['name'];
		$file_size = $_FILES['logo']['size'];
		$file_tmp = $_FILES['logo']['tmp_name'];
		$file_exp = explode(".", $file_name);
		$file_ext = strtolower(end($file_exp));
		$logo = "logo" . "." . $file_ext;

		if (empty($title)) {
			$this->title = '<div class="alert alert-warning w-50">Website title is required.</div>';
		}
		if (empty($slogan)) {
			$this->slogan = '<div class="alert alert-warning w-50">Website slogan is required.</div>';
		}

		if ($title && $slogan) {
			if ($file_name) {
				if ($file_size > 5048567) {
					$this->logo = '<div class="alert alert-warning w-50">Logo size is less than 5mb!</div>';
				} elseif (in_array($file_ext, $permited) === false) {
					$this->logo = '<div class="alert alert-warning w-50">You can upload only:- ' . implode(", ", $permited) . '</div>';
				} else {
					$query = "UPDATE `title_slogan` SET `title`= '$title',`slogan`= '$slogan',`logo`= '$logo' WHERE `id` = '1'";
					$result = $this->db->update($query);
					if ($result) {
						unlink("../images/" . $logo);
						move_uploaded_file($file_tmp, "../images/" . $logo);
						$update_title_slogan = '<div class="alert alert-success w-50">Updated Successfully.</div>';
						return $update_title_slogan;
					} else {
						$update_title_slogan = '<div class="alert alert-warning w-50">Update not successfull.</div>';
						return $update_title_slogan;
					}
				}
			} else {
				$query = "UPDATE `title_slogan` SET `title`= '$title',`slogan`= '$slogan' WHERE `id` = '1'";
				$result = $this->db->update($query);
				if ($result) {
					$update_title_slogan = '<div class="alert alert-success w-50">Updated Successfully.</div>';
					return $update_title_slogan;
				} else {
					$update_title_slogan = '<div class="alert alert-warning w-50">Update not successfull.</div>';
					return $update_title_slogan;
				}
			}
		}
	}


	// code for social table
	public function viewAdminSocial() {
		$query = "SELECT * FROM `social`";
		$result = $this->db->select($query);
		return $result;
	}
	public function updateSocial($data) {
		$facebook = $this->fm->validation($data['facebook']);
		$facebook = mysqli_real_escape_string($this->db->link, $facebook);
		$twitter = $this->fm->validation($data['twitter']);
		$twitter = mysqli_real_escape_string($this->db->link, $twitter);
		$linkedin = $this->fm->validation($data['linkedin']);
		$linkedin = mysqli_real_escape_string($this->db->link, $linkedin);
		$google = $this->fm->validation($data['google']);
		$google = mysqli_real_escape_string($this->db->link, $google);

		if (empty($facebook)) {
			$this->facebook = '<div class="alert alert-warning w-50">Facebook link is required.</div>';
		}
		if (empty($twitter)) {
			$this->twitter = '<div class="alert alert-warning w-50">Twitter link is required.</div>';
		}
		if (empty($linkedin)) {
			$this->linkedin = '<div class="alert alert-warning w-50">Linkedin link is required.</div>';
		}
		if (empty($google)) {
			$this->google = '<div class="alert alert-warning w-50">Google link is required.</div>';
		}
		if ($facebook && $twitter && $linkedin && $google) {
			$query = "UPDATE `social` SET `facebook`= '$facebook',`twitter`= '$twitter',`linkedin`= '$linkedin',`google`= '$google' WHERE `id` = '1'";
			$result = $this->db->update($query);
			if ($result) {
				$updateMsg = '<div class="alert alert-success w-50">Updated Successfully.</div>';
				return $updateMsg;
			} else {
				$updateMsg = '<div class="alert alert-warning w-50">Data does not updated!</div>';
				return $updateMsg;
			}
		}
	}
	// code for footer copyright
	public function copyRight() {
		$query = "SELECT * FROM `footer`";
		$result = $this->db->select($query);
		return $result;
	}
	public function updateCopyRight($data) {
		$copy_right = $this->fm->validation($data['copy_right']);
		$copy_right = mysqli_real_escape_string($this->db->link, $copy_right);
		if (!empty($copy_right)) {
			$query = "UPDATE `footer` SET `copy_right` = '$copy_right' WHERE `id` = '1'";
			$result = $this->db->update($query);
			if ($result) {
				$updateMsg = '<div class="alert alert-success w-50">Updated Successfully.</div>';
				return $updateMsg;
			} else {
				$updateMsg = '<div class="alert alert-warning w-50">Data does not updated!</div>';
				return $updateMsg;
			}
		} else {
			$this->copy_right = '<div class="alert alert-warning w-50">Field must not be empty.</div>';
		}
	}
}

?>