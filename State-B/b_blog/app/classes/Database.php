<?php 

namespace App\classes;

class Database {
    public function dbconn() {
    	$host = 'localhost';
    	$user = 'root';
    	$pass = '';
    	$db_name = 'b_blog';
    	$conn = mysqli_connect($host, $user, $pass, $db_name);
    	return $conn;
    }
}


?>