<?php 
// Index controller
class Index extends MController {
	private $ctable = 'category';
	private $ptable = 'post';
	private $catModel;
	private $postModel;
	public function __construct() {
		parent::__construct();
		$this->catModel = $this->load->model("CatModel");
		$this->postModel = $this->load->model("PostModel");
	}
	public function Index() {
		$this->home();
	}
	public function home() {
		$this->load->view("header");

		$data = array();
		$data['cat_list'] = $this->catModel->catList($this->ctable);
		$this->load->view("search", $data);

		$data['view_post'] = $this->postModel->allPost($this->ptable);
		$this->load->view("content", $data);

		$data['latest_post'] = $this->postModel->latestPost($this->ptable);
		$this->load->view("sidebar", $data);
		$this->load->view("footer");
	}
	public function postDetails($id = NULL) {
		$cond = "id = $id";
		$this->load->view("header");

		$data = array();
		$data['cat_list'] = $this->catModel->catList($this->ctable);
		$this->load->view("search", $data);

		$data['post_details'] = $this->postModel->postDetails($this->ptable, $this->ctable, $cond);
		$this->load->view("post-details", $data);

		$data['latest_post'] = $this->postModel->latestPost($this->ptable);
		$this->load->view("sidebar", $data);
		$this->load->view("footer");
	}
	public function postByCat($id = NULL) {
		$this->load->view("header");

		$data = array();
		$data['cat_list'] = $this->catModel->catList($this->ctable);
		$this->load->view("search", $data);

		$data['catById'] = $this->catModel->catById($this->ctable, $id);
		$data['cat_post'] = $this->postModel->postByCat($this->ptable, $id);
		$this->load->view("postByCat", $data);

		$data['latest_post'] = $this->postModel->latestPost($this->ptable);
		$this->load->view("sidebar", $data);
		$this->load->view("footer");
	}
	public function search() {
		if ($_SERVER['REQUEST_METHOD'] == 'GET' && $_GET['search_post']) {
			$keyword = $_GET['keyword'];
			$cat_id = $_GET['cat_id'];
			$this->load->view("header");

			$data = array();
			$data['cat_list'] = $this->catModel->catList($this->ctable);
			$this->load->view("search", $data);

			$data['search_post'] = $this->postModel->searchPost($this->ptable, $keyword, $cat_id);
			$this->load->view("search-post", $data);

			$data['latest_post'] = $this->postModel->latestPost($this->ptable);
			$this->load->view("sidebar", $data);
			$this->load->view("footer");
		} else {
			header("Location: " . BASE_URL);
		}
	}
}

?>