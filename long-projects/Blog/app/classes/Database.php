<?php 

namespace App\classes;

class Database {
    public function dbconn() {
    	$host = "localhost";
    	$user = "root";
    	$pass = "";
    	$dbname = "blog";
    	$link = mysqli_connect($host, $user, $pass, $dbname);
    	return $link;
    }
}


?>