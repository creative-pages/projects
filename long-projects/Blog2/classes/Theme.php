<?php 
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . '/../lib/Database.php');
include_once ($filepath . '/../healper/Format.php');
class Theme {
	private $db;
	private $fm;

	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	public function updateTheme($data) {
		$theme = $this->fm->validation($data['theme']);
		$theme = mysqli_real_escape_string($this->db->link, $theme);
		$query = "UPDATE `theme` SET `theme` = '$theme'";
		$result = $this->db->update($query);
		if ($result) {
			$updateMsg = '<div class="alert alert-success">Theme updated successfully.</div>';
			return $updateMsg;
		} else {
			$updateMsg = '<div class="alert alert-warning">Theme not updated!</div>';
			return $updateMsg;
		}
	}
	public function selectTheme() {
		$query = "SELECT * FROM `theme`";
		$result = $this->db->select($query);
		return $result;
	}
}

?>