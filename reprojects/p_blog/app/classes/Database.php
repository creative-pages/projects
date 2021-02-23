<?php 

namespace App\classes;

class Database {
	public function dbconn() {
		$host = "localhost";
		$user = "root";
		$pass = "";
		$db = "p_blog";
		$link = mysqli_connect($host, $user, $pass, $db);
		return $link;
	}
}

?>