<?php 
include "DB.php";

abstract class Main {
	protected $table;

	abstract public function insert();
	abstract public function updateUser($id);

	public function readAll() {
		$sql = "SELECT * FROM $this->table";
		$stmt = DB::prepare($sql);
		$stmt->execute();
		return $stmt->fetchAll();
	}
	public function readById($id) {
		$sql = "SELECT * FROM $this->table WHERE `id` = :id";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(":id", $id);
		$stmt->execute();
		return $stmt->fetch();
	}
	
	public function deleteUser($id) {
		$sql = "DELETE FROM $this->table WHERE `id` = :id";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(":id", $id);
		return $stmt->execute();
	}
}

?>