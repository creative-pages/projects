<?php 

namespace App\classes;
use App\classes\Database;

class Login {
    public function loginCheck($data) {
    	$username = $data['username'];
    	$password = $data['password'];

    	if ($username && $password) {
    		$query = mysqli_query(Database::dbconn(), "SELECT * FROM `users` WHERE `username` = '$username' AND `password` = '$password'");
    		if (mysqli_num_rows($query) == 1) {
    			$row = mysqli_fetch_assoc($query);
    			session_start();
    			$_SESSION['id'] = $row['id'];
    			$_SESSION['name'] = $row['name'];
    			$_SESSION['username'] = $row['username'];

    			header("Location: index.php");
    		} else {
    			$login_error = "Username Or Password is invalid.";
    			return $login_error;
    		}
    	}
    }
}


?>