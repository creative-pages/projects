<?php 
// Main controller
class MController {
	protected $load = array();
	public function __construct() {
		$this->load = new Load();
	}
}

?>