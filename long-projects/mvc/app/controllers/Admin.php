<?php 

class Admin extends MController {
	private $table = 'category';
	private $ptable = 'post';
	private $uitable = 'ui';
	private $catModel;
	private $postModel;
	private $uiModel;
	private $input;
	public function __construct() {
		parent::__construct();
		Session::checkSession();
		$this->catModel = $this->load->model('CatModel');
		$this->postModel = $this->load->model('PostModel');
		$this->uiModel = $this->load->model("UiModel");
		$this->input = $this->load->validation("DForm");
	}
	public function Index() {
		$this->home();
	}
	public function home() {
		$this->load->view('admin/header');
		$this->load->view('admin/sidebar');
		$this->load->view('admin/home');
		$this->load->view('admin/footer');
	}

	public function addCategory() {
		if (Session::get('userLevel') == 3) {
			header("Location: " . BASE_URL . "/Admin");
		}
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add_category'])) {
			$name = $_POST['name'];
			$title = $_POST['title'];
			$data = array(
				'name' => $name,
				'title' => $title
			);
			$result = $this->catModel->insertCat($this->table, $data);
			$message = array();
			if ($result == 1) {
				$message['msg'] = '<div class="alert alert-success">Category added successfully.</div>';
			} else {
				$message['msg'] = '<div class="alert alert-warning">Category added successfully.</div>';
			}

			$this->load->view('admin/header');
			$this->load->view('admin/sidebar');
			$this->load->view('admin/addCategory', $message);
			$this->load->view('admin/footer');
		} else {
			$this->load->view('admin/header');
			$this->load->view('admin/sidebar');
			$this->load->view('admin/addCategory');
			$this->load->view('admin/footer');
		}
	}
	public function categoryList() {
		if (Session::get('userLevel') == 3) {
			header("Location: " . BASE_URL . "/Admin");
		}
		$this->load->view('admin/header');
		$this->load->view('admin/sidebar');

		$data = array();
		$data['cat'] = $this->catModel->catList($this->table);
		$this->load->view('admin/category-list', $data);

		$this->load->view('admin/footer');
	}

	public function updateCategory($id = NULL) {
		$cond = "id = $id";
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_category'])) {
			$up_id = $_POST['id'];
			$name = $_POST['name'];
			$title = $_POST['title'];
			$data = array(
				'name' => $name,
				'title' => $title
			);
			$condition = "id = $up_id";
			$result = $this->catModel->updateCat($this->table, $data, $condition);
			$message = array();
			if ($result == 1) {
				$message['updateCat'] = '<div class="alert alert-success">Category updated successfully.</div>';
			} else {
				$message['updateCat'] = '<div class="alert alert-warning">Category does not updated!</div>';
			}

			$this->load->view('admin/header');
			$this->load->view('admin/sidebar');
			$this->load->view('admin/update-category', $message);
			$this->load->view('admin/footer');

		} else {
			$this->load->view('admin/header');
			$this->load->view('admin/sidebar');

			$upCat = array();
			$upCat['upCat'] = $this->catModel->catById($this->table, $cond);
			$this->load->view('admin/update-category', $upCat);

			$this->load->view('admin/footer');
		}
	}
	public function deleteCategory($id) {
		$cond = "id = $id";
		$result = $this->catModel->deleteCat($this->table, $cond);
		if ($result) {
			header("Location: " . BASE_URL . "/Admin/categoryList");
		}
	}

	public function addPost() {
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['add_post']) {
			$this->input->post('title')
						->empty()
						->length(10, 500);

			$this->input->post('content')
						->empty();

			$this->input->post('cat_id')
						->empty();
			if ($this->input->submit()) {
				$title = $this->input->values['title'];
				$content = $this->input->values['content'];
				$cat_id = $this->input->values['cat_id'];

				$data = array(
					'title' => $title,
					'content' => $content,
					'cat_id' => $cat_id
				);
				$message = array();
				$result = $this->postModel->addPost($this->ptable, $data);
				if ($result) {
					$message['add_post'] = '<div class="alert alert-success">Post added successfully.</div>';
				} else {
					$message['add_post'] = '<div class="alert alert-warning">Post does not added!</div>';
				}
				$message['catList'] = $this->catModel->catList($this->table);

				$this->load->view('admin/header');
				$this->load->view('admin/sidebar');
				$this->load->view('admin/add-post', $message);
				$this->load->view('admin/footer');
			} else {
				$data = array();
				$data['post_errors'] = $this->input->errors;
				$this->load->view('admin/header');
				$this->load->view('admin/sidebar');
				$data['catList'] = $this->catModel->catList($this->table);
				$this->load->view('admin/add-post', $data);
				$this->load->view('admin/footer');
			}
		} else {
			$this->load->view('admin/header');
			$this->load->view('admin/sidebar');
			$message = array();
			$message['catList'] = $this->catModel->catList($this->table);
			$this->load->view('admin/add-post', $message);
			$this->load->view('admin/footer');
		}
	}
	public function updatePost($id = NULL) {
		$cond = "id = $id";
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['update_post']) {
			$post_id = $_POST['id'];
			$title = $_POST['title'];
			$content = $_POST['content'];
			$cat_id = $_POST['cat_id'];
			$data = array(
				'title' => $title,
				'content' => $content,
				'cat_id' => $cat_id
			);
			$condition = "id = $post_id";
			$message = array();
			$result = $this->postModel->updatePost($this->ptable, $data, $condition);
			if ($result) {
				$message['update_post'] = '<div class="alert alert-success">Post updated successfully.</div>';
			} else {
				$message['update_post'] = '<div class="alert alert-warning">Post does not updated!</div>';
			}
			$message['catList'] = $this->catModel->catList($this->table);

			$this->load->view('admin/header');
			$this->load->view('admin/sidebar');
			$this->load->view('admin/update-post', $message);
			$this->load->view('admin/footer');
		} else {
			$this->load->view('admin/header');
			$this->load->view('admin/sidebar');
			$data = array();
			$data['view_post'] = $this->postModel->postById($this->ptable, $cond);
			$data['catList'] = $this->catModel->catList($this->table);
			$this->load->view('admin/update-post', $data);
			$this->load->view('admin/footer');
		}
	}
	public function postList() {
		$this->load->view('admin/header');
		$this->load->view('admin/sidebar');

		$data = array();
		$data['post'] = $this->postModel->postList($this->ptable, $this->table);
		$this->load->view('admin/post-list', $data);
		$this->load->view('admin/footer');
	}
	public function deletePost($id) {
		$cond = "id = $id";
		$result = $this->postModel->deletePost($this->ptable, $cond);
		if ($result) {
			header("Location: " . BASE_URL . "/Admin/postList");
		}
	}
	public function uiOption() {
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['change_ui']) {
			$this->input->post('color');
			$cond = "id = 1";

			$color = $this->input->values['color'];
			$data = array(
				'color' => $color
			);
			$message = array();
			$result = $this->uiModel->updateBackground($this->uitable, $data, $cond);
			if ($result) {
				$message['update_ui'] = '<div class="alert alert-success">UI updated successfully.</div>';
			} else {
				$message['update_ui'] = '<div class="alert alert-warning">UI does not updated!</div>';
			}
			$this->load->view('admin/header');
			$this->load->view('admin/sidebar');
			$this->load->view('admin/ui', $message);
			$this->load->view('admin/footer');
		} else {
			$data = array();
			$data['change_color'] = $this->uiModel->getColor($this->uitable);
			$this->load->view('admin/header', $data);
			$this->load->view('admin/sidebar');
			$this->load->view('admin/ui');
			$this->load->view('admin/footer');
		}
	}
}

?>