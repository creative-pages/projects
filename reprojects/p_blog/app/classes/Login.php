<?php 

namespace App\classes;
use App\classes\Database;

class Login {
    public function loginCheck($data) {
    	$emailusername = $data['emailusername'];
    	$password = md5($data['password']);
    	$result = mysqli_query(Database::dbconn(), "SELECT * FROM `users` WHERE `email` = '$emailusername' OR `username` = '$emailusername'");
    	if ($result) {
    		$rows = mysqli_num_rows($result);
    		if ($rows == 1) {
    			$row = mysqli_fetch_assoc($result);
	    		if ($row['password'] == $password) {
	    			session_start();
	    			$_SESSION['user_id'] = $row['id'];
	    			$_SESSION['name'] = $row['name'];
	    			$_SESSION['email'] = $row['email'];
	    			$_SESSION['username'] = $row['username'];
	    			header("Location: index.php");
	    		} else {
	    			$errEUP = "Password is incorrect!";
	    			return $errEUP;
	    		}
    		} else {
    			$errEUP = "Email or Username is not found!";
    			return $errEUP;
    		}
    	} else {
    		die();
    	}
    	
    }
}


?>