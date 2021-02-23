<?php 

class VFormModel {
	public $values = array();
	public $currentValue;
	public $errors = array();

	public function post($key) {
		$this->values[$key] = trim($_POST[$key]);
		$this->currentValue = $key;
		return $this;
	}
	public function empty() {
		if (empty($this->values[$this->currentValue])) {
			$this->errors[$this->currentValue]['empty'] = '<div class="alert alert-warning">Field must not be empty!</div>';
		}
		return $this;
	}
	public function length($min = 0, $max) {
		if (strlen($this->values[$this->currentValue]) < $min || strlen($this->values[$this->currentValue]) > $max) {
			$this->errors[$this->currentValue]['length'] = '<div class="alert alert-warning">Should be minimum ' . $min . ' and maximum ' . $max . ' characters!</div>';
		}
		return $this;
	}
	public function errorFree() {
		if (empty($this->errors)) {
			return true;
		} else {
			return false;
		}
	}
}
?>