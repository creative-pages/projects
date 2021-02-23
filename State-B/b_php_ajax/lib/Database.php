<?php 
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . '/../config/config.php');

class Database {
	public $host = DB_HOST;
	public $user = DB_USER;
	public $pass = DB_PASS;
	public $db_name = DB_NAME;

	public $link;
	public $error;

	public function __construct() {
		$this->connectDB();
	}

	private function connectDB() {
		$this->link = new mysqli($this->host, $this->user, $this->pass, $this->db_name);
		if (!$this->link) {
			$this->error = "Connection falied!.." . $this->link->connect_error;
			return false;
		}
	}

	// select data
	public function select($query) {
		$result = $this->link->query($query) or die($this->link->error . __LINE__);
		if ($result->num_rows > 0) {
			return $result;
		} else {
			return false;
		}
	}

	// insert data
	public function insert($query) {
		$result = $this->link->query($query) or die($this->link->error . __LINE__);
		if ($result) {
			return $result;
		} else {
			return false;
		}
	}

	// update data
	public function update($query) {
		$result = $this->link->query($query) or die($this->link->error . __LINE__);
		if ($result) {
			return $result;
		} else {
			return false;
		}
	}

	// delete data
	public function delete($query) {
		$result = $this->link->query($query) or die($this->link->error . __LINE__);
		if ($result) {
			return $result;
		} else {
			return false;
		}
	}
}

?>