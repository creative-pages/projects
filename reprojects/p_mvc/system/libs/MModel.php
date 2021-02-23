<?php 

class MModel {
	protected $db = array();
	public function __construct() {
		$dsn = 'mysql:dbname=p_mvc;host=localhost';
		$user = 'root';
		$pass = '';
		$this->db = new Database($dsn, $user, $pass);
	}
}

?>