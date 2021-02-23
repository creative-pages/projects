<?php 

class MController {
	protected $ctable = 'category';
	protected $ptable = 'post';
	protected $htable = 'header';
	protected $contable = 'contact';
	protected $page_table = 'page';
	protected $content_table = 'content';
	protected $catModel;
	protected $postModel;
	protected $hfModel;
	protected $pageModel;

	protected $load = array();
	protected function __construct() {
		$this->load = new Load();
		$this->catModel = $this->load->model('CatModel');
		$this->postModel = $this->load->model('PostModel');
		$this->hfModel = $this->load->model('HFModel');
		$this->pageModel = $this->load->model('PageModel');
	}
	// for front view
	protected function header() {
		$data['ti_su_lo'] = $this->hfModel->tiSuLo($this->htable);
		$this->load->view('website/header', $data);
	}
	protected function footer() {
		$data['menu'] = $this->pageModel->menuList($this->page_table);
		$data['ti_su_lo'] = $this->hfModel->tiSuLo($this->contable);
		$this->load->view('website/footer', $data);
	}
	protected function search() {
		$data['category'] = $this->catModel->catList($this->ctable);
		$data['menu'] = $this->pageModel->menuList($this->page_table);
		$this->load->view('website/search', $data);
	}
	protected function sidebar() {
		$data['category'] = $this->catModel->catList($this->ctable);
		$data['latest_post'] = $this->postModel->latestPost($this->ptable);
		$this->load->view('website/sidebar', $data);
	}
	// for admin view
	protected function adheader() {
		$this->load->view('admin/header');
	}
	protected function adfooter() {
		$this->load->view('admin/footer');
	}
	protected function adsidebar() {
		$this->load->view('admin/sidebar');
	}
}

?>