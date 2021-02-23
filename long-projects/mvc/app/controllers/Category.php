<?php 

class Category extends MController {
	private $table = 'category';
	private $catModel;
	public function __construct() {
		parent::__construct();
		$this->catModel = $this->load->model('CatModel');
	}
	public function categoryList() {
		$data = array();
		$data['cat'] = $this->catModel->catList($this->table);
		$this->load->view('sidebar', $data);
	}
	public function catById() {
		$data = array();
		$cond = "id = 4";
		$data['catById'] = $this->catModel->catById($this->table, $cond);
		$this->load->view('catById', $data);
	}
}

?>