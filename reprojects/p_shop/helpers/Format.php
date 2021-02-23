<?php 

class Format {
	public function dateFormat($date) {
		date_default_timezone_set('Asia/Dhaka');
		return date("j-F-Y, h:i A", strtotime($date));
	}
	public function textShorten($text, $limit) {
		$text = substr($text, 0, $limit);
		$text = substr($text, 0, strrpos($text, " "));
		$text = $text . "....";
		return $text;
	}
	public function validation($data) {
		$data = trim($data);
		$data = stripcslashes($data);
		$data = htmlspecialchars($data);
		return $data;
	}
	public function title() {
		$full_path = $_SERVER['SCRIPT_FILENAME'];
		$path = basename($full_path, ".php");
		$path = str_replace("_", " ", $path);
		$path = str_replace("-", " ", $path);
		if ($path = "index") {
			$title = "home";
		} else {
			$title = $path;
		}
		return ucwords($title);
	}
}

?>