<?php 

class Website extends MController {
	public function __construct() {
		parent::__construct();
	}
	public function index() {
		$data = array();
		parent::header();
		parent::search();

		$data['all_post'] = $this->postModel->postList($this->ptable, $this->ctable);
		$this->load->view('website/home', $data);

		parent::sidebar();
		parent::footer();
	}
	public function postDetails($id) {
		$data = array();
		parent::header();
		parent::search();

		$data['view_post'] = $this->postModel->postDetails($this->ptable, $this->ctable, $id);
		$this->load->view('website/details', $data);

		parent::sidebar();
		parent::footer();
	}
	public function postByCat($cat_id = NULL) {
		$data = array();
		parent::header();
		parent::search();

		$data['cat_by_id'] = $this->catModel->catById($this->ctable, $cat_id);
		$data['cat_post'] = $this->postModel->postByCat($this->ptable, $this->ctable, $cat_id);
		$this->load->view('website/catPost', $data);

		parent::sidebar();
		parent::footer();
	}
	public function searchPost() {
		if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['search'])) {
			$keyword = $_GET['keyword'];
			$cat_id = $_GET['category'];


			$data = array();
			parent::header();
			parent::search();

			$data['search_post'] = $this->postModel->searchPost($this->ptable, $this->ctable, $keyword, $cat_id);
			$this->load->view('website/search-post', $data);

			parent::sidebar();
			parent::footer();
		} else {
			header("Location: " . BASE_URL);
		}
	}

	// code for extra page
	public function page($id = NULL) {
		$data = array();
		parent::header();
		parent::search();

		$status = $this->pageModel->singlePage($this->page_table, $id);
		$name = $status[0]['name'];
		$page_name = strtolower(str_replace(" ", "_", $name));

		$data['content'] = $this->pageModel->selectContent($this->content_table, $id);
		$this->load->view('website/' . $page_name, $data);

		parent::sidebar();
		parent::footer();
	}
}

?>