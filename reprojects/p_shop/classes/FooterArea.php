<?php 
$path = realpath(dirname(__FILE__));
include_once ($path . "/../lib/Database.php");
include_once ($path . "/../helpers/Format.php");

class FooterArea {
	// for social
	public $facebook;
	public $twitter;
	public $google;
	public $mail;
	// for copyright and number
	public $number_one;
	public $number_two;
	public $copy_right;
	// for logo
	public $logo;

	public $db;
	public $fm;

	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	// code for social media
	public function viewSocial() {
		$query = "SELECT * FROM `social` WHERE `id` = '1'";
		$result = $this->db->select($query);
		return $result;
	}
	public function updateSocial($data) {
		$id = $this->fm->validation($data['id']);
		$id = mysqli_real_escape_string($this->db->link, $id);
		$facebook = $this->fm->validation($data['facebook']);
		$facebook = mysqli_real_escape_string($this->db->link, $facebook);
		$twitter = $this->fm->validation($data['twitter']);
		$twitter = mysqli_real_escape_string($this->db->link, $twitter);
		$google = $this->fm->validation($data['google']);
		$google = mysqli_real_escape_string($this->db->link, $google);
		$mail = $this->fm->validation($data['mail']);
		$mail = mysqli_real_escape_string($this->db->link, $mail);

		if (empty($facebook)) {
			$this->facebook = '<div class="alert alert-warning mb-0">Enter facebook link.</div>';
		}
		if (empty($twitter)) {
			$this->twitter = '<div class="alert alert-warning mb-0">Enter twitter link.</div>';
		}
		if (empty($google)) {
			$this->google = '<div class="alert alert-warning mb-0">Enter google plus link.</div>';
		}
		if (empty($mail)) {
			$this->mail = '<div class="alert alert-warning mb-0">Enter mail link.</div>';
		}
		if ($facebook && $twitter && $google && $mail) {
			$query = "UPDATE `social` SET `facebook` = '$facebook', `twitter` = '$twitter', `google` = '$google', `mail` = '$mail'";
			$result = $this->db->update($query);
			if ($result) {
				$updateMsg = '<div class="alert alert-success mb-0">Social updated successfully.</div>';
				return $updateMsg;
			} else {
				$updateMsg = '<div class="alert alert-warning mb-0">Social does not updated.</div>';
				return $updateMsg;
			}
		}
	}
	// code for copyright and contact number
	public function viewCopyContact() {
		$query = "SELECT * FROM `copyright_number` WHERE `id` = '1'";
		$result = $this->db->select($query);
		return $result;
	}
	public function updateCopyContact($data) {
		$id = $this->fm->validation($data['id']);
		$id = mysqli_real_escape_string($this->db->link, $id);
		$number_one = $this->fm->validation($data['number_one']);
		$number_one = mysqli_real_escape_string($this->db->link, $number_one);
		$number_two = $this->fm->validation($data['number_two']);
		$number_two = mysqli_real_escape_string($this->db->link, $number_two);
		$copy_right = $this->fm->validation($data['copy_right']);
		$copy_right = mysqli_real_escape_string($this->db->link, $copy_right);

		if (empty($number_one)) {
			$this->number_one = '<div class="alert alert-warning mb-0">Enter first number.</div>';
		}
		if (empty($number_two)) {
			$this->number_two = '<div class="alert alert-warning mb-0">Enter second number.</div>';
		}
		if (empty($copy_right)) {
			$this->copy_right = '<div class="alert alert-warning mb-0">Enter copy right text.</div>';
		}
		if ($number_one && $number_two && $copy_right) {
			$query = "UPDATE `copyright_number` SET `number_one` = '$number_one', `number_two` = '$number_two', `copy_right` = '$copy_right' WHERE `id` = '$id'";
			$result = $this->db->update($query);
			if ($result) {
				$updateMsg = '<div class="alert alert-success mb-0">Copyright and number updated successfully.</div>';
				return $updateMsg;
			} else {
				$updateMsg = '<div class="alert alert-warning mb-0">Copyright and number does not updated.</div>';
				return $updateMsg;
			}
		}
	}
	public function updateLogo($data) {
		$old_file = $this->fm->validation($data['old_file']);
		$old_file = mysqli_real_escape_string($this->db->link, $old_file);

		$permited = array('jpg', 'jpeg', 'png', 'gif');
		$file_name = $_FILES['logo']['name'];
		$file_size = $_FILES['logo']['size'];
		$file_tmp = $_FILES['logo']['tmp_name'];
		$file_exp = explode(".", $file_name);
		$file_ext = strtolower(end($file_exp));
		$logo = "logo-" . substr(md5(time()), 0, 5) . '.' . $file_ext;
		if (empty($file_name)) {
			$this->logo = '<div class="alert alert-warning mb-0">Please select your logo.</div>';
		}
		if ($file_name) {
			if ($file_size > 5048567) {
				$this->logo = '<div class="alert alert-warning mb-0">Image size should be less than 5mb!</div>';
			} elseif (in_array($file_ext, $permited) == false) {
				$this->logo = '<div class="alert alert-warning mb-0">You can upload only:- ' . implode(', ', $permited) . '</div>';
			} else {
				$query = "UPDATE `copyright_number` SET `logo` = '$logo'";
				$result = $this->db->update($query);
				if ($result) {
					if (isset($old_file)) {
						unlink('uploads/logo/' . $old_file);
					}
					move_uploaded_file($file_tmp, 'uploads/logo/' . $logo);
					$updateMsg = '<div class="alert alert-success mb-0 w-50 mx-auto">Logo updated successfully.</div>';
					return $updateMsg;
				} else {
					$updateMsg = '<div class="alert alert-warning mb-0 w-50 mx-auto">Logo does not updated!</div>';
					return $updateMsg;
				}
			}
		}
	}
	// code for company address
	public function showAddress() {
		$sql = "SELECT * FROM `company_address`";
		$result = $this->db->select($sql);
		return $result;
	}
	public function updateAddress($data) {
		$company_address = $this->fm->validation($data['company_address']);
		$company_address = mysqli_real_escape_string($this->db->link, $company_address);
		$query = "UPDATE `company_address` SET `company_address` = '$company_address'";
				$result = $this->db->update($query);
		if ($result) {
			$updateMsg = '<div class="alert alert-success mb-0 mx-auto">Address updated successfully.</div>';
			return $updateMsg;
		} else {
			$updateMsg = '<div class="alert alert-warning mb-0 mx-auto">Address does not updated!</div>';
			return $updateMsg;
		}
	}
}

?>