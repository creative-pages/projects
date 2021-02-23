<?php 
// Category controller
class Category extends MController {
	private $ctable = 'category';
	private $catModel;
	public function __construct() {
		parent::__construct();
		$this->catModel = $this->load->model("CatModel");
	}
	
	public function categoryList() {
		$data = array();
		$data['cat'] = $this->catModel->catList($this->ctable);
		$this->load->view('category', $data);
	}
	public function catById() {
		$id = 3;
		$data = array();
		$data['catById'] = $this->catModel->catById($this->ctable, $id);
		$this->load->view('catById', $data);
	}
}

?>