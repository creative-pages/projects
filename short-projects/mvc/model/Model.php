<?php 
include "Database.php";

class Model {
	public function getStudentData() {
		$sql = "SELECT * FROM `std_info`";
		$stmt = Database::prepare($sql);
		$stmt->execute();
		return $stmt->fetchAll();
	}
}

?>