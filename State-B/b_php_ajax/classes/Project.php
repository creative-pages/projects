<?php 
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . '/../lib/Database.php');

class Project {
	private $db;

	public function __construct() {
		$this->db = new Database();
	}

	public function checkUsername($username) {
		if (!empty($username)) {
			$sql = "SELECT * FROM `users` WHERE `username` = '$username'";
			$result = $this->db->select($sql);
			if ($result) {
				echo '<span class="text-warning px-2 py-3"><b>' . $username . '</b> is not available!</span>';
			} else {
				echo '<span class="text-success px-2 py-3"><b>' . $username . '</b> is available.</span>';
			}
		} else {
			echo '<div class="alert alert-warning">Please enter username.</div>';
		}
	}

	public function checkSkill($skill) {
		$sql = "SELECT * FROM `skill` WHERE `skill` LIKE '%$skill%'";
		$result = $this->db->select($sql);
		if ($result) {
			$list = '';
			$list .= '<ul>';
			while ($row = $result->fetch_assoc()) {
				$list .= '<li class="d-block">' . $row['skill'] . '</li>';
			}
			$list .= '</ul>';
			echo $list;
		} else {
			echo '<span class="p-3">No match found!</span>';
		}
	}

	public function autoRefresh($content) {
		$sql = "INSERT INTO `refresh`(`content`) VALUES('$content')";
		$data = $this->db->insert($sql);
	}

	public function getContent() {
		$sql = "SELECT * FROM `refresh`";
		$result = $this->db->select($sql);
		if ($result) {
			$list = '';
			$list .= '<ul class="list-unstyled">';
			while ($row = $result->fetch_assoc()) {
				$list .= '<li class="d-block">' . $row['content'] . '</li>';
			}
			$list .= '</ul>';
			echo $list;
		} else {
			echo '<span class="p-3">No data is available!</span>';
		}
	}

	public function liveSearch($data) {
		$sql = "SELECT * FROM `search` WHERE `username` LIKE '%$data%'";
		$result = $this->db->select($sql);
		if ($result) {
			$list = '';
			$list .= '<table class="table table-bordered table-striped table-hover"><tr>
								<th>Name</th>
								<th>Emai</th>
								<th>Username</th></tr>';
			while ($row = $result->fetch_assoc()) {
				$list .= '<tr><td>' . $row['name'] . '</td>
							  <td>' . $row['email'] . '</td>
							  <td>' . $row['username'] . '</td></tr>';
			}
			$list .= '</table>';
			echo $list;
		} else {
			echo '<span class="p-3">No match found!</span>';
		}
	}

	public function contentAutoSave($content, $contentid) {
		if ($contentid != '') {
			$sql = "UPDATE `auto_save` SET `content` = '$content' WHERE `content_id` = '$contentid'";
			$data = $this->db->update($sql);
		} else {
			$sql = "INSERT INTO `auto_save`(`content`, `status`) VALUES('$content', 'draft')";
			$insert_data = $this->db->insert($sql);
			$lastid = $this->db->link->insert_id;
			echo $lastid;
			exit();
		}
	}
}

?>