<?php 
include "main.php";

class Teacher extends Main {
	protected $table = "tch_info";
	private $name;
	private $department;
	private $age;
	public function setName($name) {
		$this->name = $name;
	}
	public function setDepartment($department) {
		$this->department = $department;
	}
	public function setAge($age) {
		$this->age = $age;
	}
	public function insert() {
		$sql = "INSERT INTO $this->table (`name`, `department`, `age`) VALUES (:name, :department, :age)";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(":name", $this->name);
		$stmt->bindParam(":department", $this->department);
		$stmt->bindParam(":age", $this->age);
		return $stmt->execute();
	}
	public function updateUser($id) {
		$sql = "UPDATE $this->table SET `name` = :name, `department` = :department, `age` = :age WHERE `id` = :id";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(":name", $this->name);
		$stmt->bindParam(":department", $this->department);
		$stmt->bindParam(":age", $this->age);
		$stmt->bindParam(":id", $id);
		return $stmt->execute();
	}
	
}

?>