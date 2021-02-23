<?php 
// Index controller

class Index extends MController {
	private $table = 'post';
	private $ctable = 'category';
	private $postModel;
	private $catModel;
	public function __construct() {
		parent::__construct();
		$this->postModel = $this->load->model('PostModel');
		$this->catModel = $this->load->model('CatModel');
	}
	public function Index() {
		$this->home();
	}
	public function home() {
		$this->load->view('header');

		$data = array();
		$data['catList'] = $this->catModel->catList($this->ctable);
		$this->load->view('search', $data);

		$data['allPost'] = $this->postModel->allPost($this->table);
		$this->load->view('content', $data);

		$data['latestPost'] = $this->postModel->latestPost($this->table);
		// from catList method and latestPost method to sidebar
		$this->load->view('sidebar', $data);
		$this->load->view('footer');
	}
	public function postDetails($id) {
		$this->load->view('header');

		$cond = "id = $id";
		$data = array();
		$data['catList'] = $this->catModel->catList($this->ctable);
		$this->load->view('search', $data);

		$data['singlePost'] = $this->postModel->postDetails($this->table, $this->ctable, $cond);
		$this->load->view('details', $data);

		$data['latestPost'] = $this->postModel->latestPost($this->table);
		$data['catList'] = $this->catModel->catList($this->ctable);
		$this->load->view('sidebar', $data);
		$this->load->view('footer');
	}
	public function catPost($id) {
		$this->load->view('header');

		$cond = "cat_id = $id";
		$condition = "id = $id";
		$data = array();

		$data['catList'] = $this->catModel->catList($this->ctable);
		$this->load->view('search', $data);

		$data['catName'] = $this->postModel->postByCat($this->ctable, $condition);
		$data['postByCat'] = $this->postModel->postByCat($this->table, $cond);
		$this->load->view('catPost', $data);

		$data['latestPost'] = $this->postModel->latestPost($this->table);
		$data['catList'] = $this->catModel->catList($this->ctable);
		$this->load->view('sidebar', $data);
		$this->load->view('footer');
	}
	public function search() {
		$this->load->view('header');

		$keyword = $_GET['keyword'];
		$cat_id = $_GET['category'];
		$data = array();
		$data['catList'] = $this->catModel->catList($this->ctable);
		$this->load->view('search', $data);

		$data['postBySearch'] = $this->postModel->postBySearch($this->table, $keyword, $cat_id);
		$this->load->view('searchPost', $data);

		$data['latestPost'] = $this->postModel->latestPost($this->table);
		$data['catList'] = $this->catModel->catList($this->ctable);
		$this->load->view('sidebar', $data);
		$this->load->view('footer');
	}
}

?>