<?php 

class Load {
	public function view($fileName, $data = false) {
		if ($data == true) {
			extract($data);
		}
		include_once "app/views/" . $fileName . ".php";
	}
	public function model($modelName) {
		include_once "app/models/" . $modelName . ".php";
		return new $modelName();
	}
	public function validation($validationName) {
		include_once "app/validation/" . $validationName . ".php";
		return new $validationName();
	}
}

?>