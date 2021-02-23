<?php 
include "config.php";

class Database {
	private static $dbconn;
	public static function connection() {
		if (!isset(self::$dbconn)) {
			try {
				self::$dbconn = new PDO("mysql:host=" . DB_HOST . "; dbname=" . DB_NAME, DB_USER, DB_PASS);
			} catch (PDOException $e) {
				echo "Connection failed.." . $e->getMessage();
			}
		}
		return self::$dbconn;
	}
	public static function prepare($sql) {
		return self::connection()->prepare($sql);
	}
}

?>