<?php 
// Admin controller
class Admin extends MController {
	private $ctable = 'category';
	private $ptable = 'post';
	private $uitable = 'ui';
	private $catModel;
	private $postModel;
	private $formModel;
	private $uModel;
	public function __construct() {
		parent::__construct();
		Session::checkSession();
		$this->catModel = $this->load->model("CatModel");
		$this->postModel = $this->load->model("PostModel");
		$this->uModel = $this->load->model("UModel");
		$this->formModel = $this->load->validation("DForm");
	}
	public function Index() {
		$this->home();
	}
	public function home() {
		$this->load->view("admin/header");
		$this->load->view("admin/sidebar");
		$this->load->view("admin/home");
		$this->load->view("admin/footer");
	}
	public function insertCategory() {
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['add_category']) {
			$name = $_POST['name'];
			$title = $_POST['title'];
			$data = array(
				'name' => $name,
				'title' => $title
			);
			$message = array();
			$result = $this->catModel->insertCategory($this->ctable, $data);
			if ($result == 1) {
				$message['add_category'] = '<div class="alert alert-success">Category added successfully.</div>';
			} else {
				$message['add_category'] = '<div class="alert alert-warning">Category does not added!</div>';
			}
			$this->load->view("admin/header");
			$this->load->view("admin/sidebar");
			$this->load->view("admin/add-category", $message);
			$this->load->view("admin/footer");
		} else {
			$this->load->view("admin/header");
			$this->load->view("admin/sidebar");
			$this->load->view("admin/add-category");
			$this->load->view("admin/footer");
		}
	}
	public function categoryList() {
		$this->load->view("admin/header");
		$this->load->view("admin/sidebar");

		$data = array();
		$data['cat'] = $this->catModel->catList($this->ctable);
		$this->load->view('admin/category-list', $data);
		$this->load->view("admin/footer");
	}
	public function updateCategory($id = NULL) {
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['update_category']) {
			$cat_id = $_POST['cat_id'];
			$name = $_POST['name'];
			$title = $_POST['title'];
			$data = array(
				'name' => $name,
				'title' => $title
			);
			$condition = "id = $cat_id";
			$message = array();
			$result = $this->catModel->updateCategory($this->ctable, $data, $condition);
			if ($result == 1) {
				$message['update_category'] = '<div class="alert alert-success">Category updated successfully.</div>';
			} else {
				$message['update_category'] = '<div class="alert alert-warning">Category does not updated!</div>';
			}
			$this->load->view("admin/header");
			$this->load->view("admin/sidebar");

			$message['view_cat'] = $this->catModel->catById($this->ctable, $cat_id);
			$this->load->view("admin/update-category", $message);
			$this->load->view("admin/footer");
		} else {
			$this->load->view("admin/header");
			$this->load->view("admin/sidebar");

			$data = array();
			$data['view_cat'] = $this->catModel->catById($this->ctable, $id);
			$this->load->view("admin/update-category", $data);
			$this->load->view("admin/footer");
		}
	}
	public function deleteCategory($id) {
		$cond = "id = $id";
		$result = $this->catModel->deleteCategory($this->ctable, $cond);
		if ($result == 1) {
			header("Location: " . BASE_URL . "/Admin/categoryList");
		}
	}

	// post code will be here
	public function addPost() {
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['add_post']) {
			$this->formModel->post('title')
							->empty()
							->length(5, 500);
			$this->formModel->post('content')
							->empty();
			$this->formModel->post('category')
							->empty();
			if ($this->formModel->errorFree()) {
				$title = $this->formModel->values['title'];
				$content = $this->formModel->values['content'];
				$cat_id = $this->formModel->values['category'];

				$data = array(
					'title' => $title,
					'content' => $content,
					'cat' => $cat_id
				);
				$message = array();
				$result = $this->postModel->addPost($this->ptable, $data);
				if ($result == 1) {
					$message['add_post'] = '<div class="alert alert-success">Post added successfully.</div>';
				} else {
					$message['add_post'] = '<div class="alert alert-warning">Post does not added!</div>';
				}
				$this->load->view("admin/header");
				$this->load->view("admin/sidebar");

				$message['cat'] = $this->catModel->catList($this->ctable);
				$this->load->view("admin/add-post", $message);
				$this->load->view("admin/footer");
			} else {
				$data = array();
				$data['post_errors'] = $this->formModel->errors;
				$this->load->view("admin/header");
				$this->load->view("admin/sidebar");
				
				$data['cat'] = $this->catModel->catList($this->ctable);
				$this->load->view("admin/add-post", $data);
				$this->load->view("admin/footer");
			}
		} else {
			$this->load->view("admin/header");
			$this->load->view("admin/sidebar");
			$data = array();
			$data['cat'] = $this->catModel->catList($this->ctable);
			$this->load->view("admin/add-post", $data);
			$this->load->view("admin/footer");
		}
	}
	public function postList() {
		$this->load->view("admin/header");
		$this->load->view("admin/sidebar");

		$data = array();
		$data['post'] = $this->postModel->postList($this->ptable, $this->ctable);
		$this->load->view('admin/post-list', $data);
		$this->load->view("admin/footer");
	}
	public function updatePost($id = NULL) {
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['update_post']) {
			$this->formModel->post('id');
			$this->formModel->post('title')
							->empty()
							->length(5, 500);
			$this->formModel->post('content')
							->empty();
			$this->formModel->post('category')
							->empty();
			$view_id = $_POST['id'];

			if ($this->formModel->errorFree()) {
				$post_id = $this->formModel->values['id'];
				$title = $this->formModel->values['title'];
				$content = $this->formModel->values['content'];
				$cat_id = $this->formModel->values['category'];
				$data = array(
					'title' => $title,
					'content' => $content,
					'cat' => $cat_id
				);
				$condition = "id = $post_id";
				$message = array();
				$result = $this->postModel->updatePost($this->ptable, $data, $condition);
				if ($result == 1) {
					$message['update_post'] = '<div class="alert alert-success">Post updated successfully.</div>';
				} else {
					$message['update_post'] = '<div class="alert alert-warning">Post does not updated!</div>';
				}
				$this->load->view("admin/header");
				$this->load->view("admin/sidebar");

				$message['view_post'] = $this->postModel->postById($this->ptable, $post_id);
				$message['cat'] = $this->catModel->catList($this->ctable);
				$this->load->view("admin/update-post", $message);
				$this->load->view("admin/footer");
			} else {
				$data = array();
				$data['post_errors'] = $this->formModel->errors;
				$this->load->view("admin/header");
				$this->load->view("admin/sidebar");

				$data['view_post'] = $this->postModel->postById($this->ptable, $view_id);
				$data['cat'] = $this->catModel->catList($this->ctable);
				$this->load->view("admin/update-post", $data);
				$this->load->view("admin/footer");
			}
		} else {
			$this->load->view("admin/header");
			$this->load->view("admin/sidebar");

			$data = array();
			$data['view_post'] = $this->postModel->postById($this->ptable, $id);
			$data['cat'] = $this->catModel->catList($this->ctable);
			$this->load->view("admin/update-post", $data);
			$this->load->view("admin/footer");
		}
	}
	public function deletePost($id) {
		$cond = "id = $id";
		$result = $this->postModel->deletePost($this->ptable, $cond);
		if ($result == 1) {
			header("Location: " . BASE_URL . "/Admin/postList");
		}
	}
	public function uiOption() {
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['change_ui']) {
			$this->formModel->post('color')
							->empty();

			if ($this->formModel->errorFree()) {
				$color = $this->formModel->values['color'];
				$data = array(
					'color' => $color
				);
				$condition = "id = 1";
				$message = array();
				$result = $this->uModel->updateUi($this->uitable, $data, $condition);
				if ($result == 1) {
					$message['change_ui'] = '<div class="alert alert-success">UI updated successfully.</div>';
				} else {
					$message['change_ui'] = '<div class="alert alert-warning">UI does not updated!</div>';
				}
				$data = array();
				$data['color'] = $this->uModel->getColor($this->uitable);
				$this->load->view("admin/header", $data);
				$this->load->view("admin/sidebar");
				$this->load->view("admin/ui", $message);
				$this->load->view("admin/footer");
			}
		} else {
			$data = array();
			$data['color'] = $this->uModel->getColor($this->uitable);
			$this->load->view("admin/header", $data);
			$this->load->view("admin/sidebar");
			$this->load->view("admin/ui");
			$this->load->view("admin/footer");
		}
	}
}

?>