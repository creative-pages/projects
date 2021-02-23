<?php 
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . '/../lib/Database.php');
include_once ($filepath . '/../healper/Format.php');
class ForPage {
	private $db;
	private $fm;

	public $name;
	public $content;

	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	public function addPage($data) {
		$name = $this->fm->validation($data['name']);
		$name = mysqli_real_escape_string($this->db->link, $name);
		$content = $this->fm->validation($data['content']);
		$content = mysqli_real_escape_string($this->db->link, $content);

		if (empty($name)) {
			$this->name = '<div class="alert alert-warning w-50">This field is required.</div>';
		}
		if (empty($name)) {
			$this->content = '<div class="alert alert-warning w-50">This field is required.</div>';
		}
		if ($name && $content) {
			$query = "INSERT INTO `page`(`name`, `content`) VALUES('$name', '$content')";
			$result = $this->db->insert($query);
			if ($result) {
				$insertMsg = '<div class="alert alert-success w-50 ml-135">Page inserted successfully.</div>';
				return $insertMsg;
			} else {
				$insertMsg = '<div class="alert alert-warning w-50 ml-135">Page does not inserted.</div>';
				return $insertMsg;
			}
		}
	}

	public function updatePage($data) {
		$pageId = $this->fm->validation($data['pageId']);
		$pageId = mysqli_real_escape_string($this->db->link, $pageId);

		$name = $this->fm->validation($data['name']);
		$name = mysqli_real_escape_string($this->db->link, $name);
		$content = $this->fm->validation($data['content']);
		$content = mysqli_real_escape_string($this->db->link, $content);

		if (empty($name)) {
			$this->name = '<div class="alert alert-warning w-50">This field is required.</div>';
		}
		if (empty($name)) {
			$this->content = '<div class="alert alert-warning w-50">This field is required.</div>';
		}
		if ($name && $content) {
			$query = "UPDATE `page` SET `name`= '$name',`content`= '$content' WHERE `id` = '$pageId'";
			$result = $this->db->insert($query);
			if ($result) {
				$insertMsg = '<div class="alert alert-success w-50 ml-135">Page updated successfully.</div>';
				return $insertMsg;
			} else {
				$insertMsg = '<div class="alert alert-warning w-50 ml-135">Page does not updated.</div>';
				return $insertMsg;
			}
		}
	}
	public function allPage() {
		$query = "SELECT * FROM `page`";
		$result = $this->db->select($query);
		return $result;
	}
	public function selectSinglePage($id) {
		$query = "SELECT * FROM `page` WHERE `id` = '$id'";
		$result = $this->db->select($query);
		return $result;
	}
	public function deletePage($id) {
		$query = "DELETE FROM `page` WHERE `id` = '$id'";
		$result = $this->db->select($query);
		if ($result) {
			header("Location: index.php");
		}
	}
}

?>