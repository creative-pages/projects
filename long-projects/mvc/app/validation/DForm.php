<?php 

class DForm {
	public $currentValue;
	public $values = array();
	public $errors = array();
	public function __construct() {

	}
	public function post($key) {
		$this->values[$key] = trim($_POST[$key]);
		$this->currentValue = $key;
		return $this;
	}
	public function empty() {
		if (empty($this->values[$this->currentValue])) {
			$this->errors[$this->currentValue]['empty'] = '<div class="alert alert-warning mb-0">Field must not be empty!</div>';
		}
		return $this;
	}
	public function length($min = 0, $max) {
		if (strlen($this->values[$this->currentValue]) < $min || $this->values[$this->currentValue] > $max) {
			$this->errors[$this->currentValue]['length'] = '<div class="alert alert-warning mb-0">Should be minimum ' . $min . ' and maximum ' . $max . ' characters!</div>';
		}
		return $this;
	}
	public function submit() {
		if (empty($this->errors)) {
			return true;
		} else {
			return false;
		}
	}
}

?>