<?php 

class Admin extends MController {
	private $vformModel;
	public function __construct() {
		parent::__construct();
		Session::checkSession();
		$this->vformModel = $this->load->validation('VFormModel');
	}
	public function index() {
		parent::adheader();
		parent::adsidebar();
		$this->load->view('admin/home');
		parent::adfooter();
	}
	public function addCategory() {
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add_category'])) {
			$this->vformModel->post('name')
							 ->length(5, 32)
							 ->empty();
			if ($this->vformModel->errorFree()) {
				$name = $this->vformModel->values['name'];
				$data = array(
					'name' => $name
				);
				$message = array();
				$result = $this->catModel->addCategory($this->ctable, $data);
				if ($result == 1) {
					$message['add_category'] = '<div class="alert alert-success">Category added successfully.</div>';
				} else {
					$message['add_category'] = '<div class="alert alert-warning">Category does not added!</div>';
				}
				parent::adheader();
				parent::adsidebar();
				$this->load->view('admin/add-category', $message);
				parent::adfooter();
			} else {
				$data = array();
				$data['cat_errors'] = $this->vformModel->errors;
				parent::adheader();
				parent::adsidebar();
				$this->load->view('admin/add-category', $data);
				parent::adfooter();
			}
		} else {
			parent::adheader();
			parent::adsidebar();
			$this->load->view('admin/add-category');
			parent::adfooter();
		}
	}
	public function categoryList() {
		parent::adheader();
		parent::adsidebar();
		$data = array();
		$data['cat_list'] = $this->catModel->catList($this->ctable);
		$this->load->view('admin/category-list', $data);
		parent::adfooter();
	}
	public function updateCategory($id = NULL) {
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_category'])) {
			$this->vformModel->post('id');
			$this->vformModel->post('name')
							 ->length(5, 32)
							 ->empty();
			$id = $this->vformModel->values['id'];
			$name = $this->vformModel->values['name'];
			if ($this->vformModel->errorFree()) {
				$data = array(
					'name' => $name
				);
				$cond = "id = $id";
				$message = array();
				$result = $this->catModel->updateCategory($this->ctable, $data, $cond);
				if ($result == 1) {
					$message['add_category'] = '<div class="alert alert-success">Category updated successfully.</div>';
				} else {
					$message['add_category'] = '<div class="alert alert-warning">Category does not updated!</div>';
				}
				parent::adheader();
				parent::adsidebar();
				$message['catById'] = $this->catModel->catById($this->ctable, $id);
				$this->load->view('admin/update-category', $message);
				parent::adfooter();
			} else {

				$data = array();
				$data['cat_errors'] = $this->vformModel->errors;
				parent::adheader();
				parent::adsidebar();
				$data['catById'] = $this->catModel->catById($this->ctable, $id);
				$this->load->view('admin/update-category', $data);
				parent::adfooter();
			}
		} else {
			parent::adheader();
			parent::adsidebar();
			$data = array();
			$data['catById'] = $this->catModel->catById($this->ctable, $id);
			$this->load->view('admin/update-category', $data);
			parent::adfooter();
		}
	}
	public function deleteCategory($id = NULL) {
		$cond = "id = $id";
		$result = $this->catModel->deleteCategory($this->ctable, $cond);
		if ($result == 1) {
			header("Location: " . BASE_URL . "Admin/categoryList");
		}
	}

	// code for post
	public function addPost() {
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add_post'])) {
			$photo = $_FILES['image']['name'];
			$photo_exp = explode(".", $photo);
			$photo_ext = end($photo_exp);
			$image = md5(time()) . "." . $photo_ext;


			$this->vformModel->post('title')
							 ->length(5, 255)
							 ->empty();
			$this->vformModel->post('content')
							 ->empty();
			$this->vformModel->post('category')
							 ->empty();
			$this->vformModel->post('status')
							 ->empty();
			$this->vformModel->post('post_by');
			if ($this->vformModel->errorFree()) {
				$title = $this->vformModel->values['title'];
				$content = $this->vformModel->values['content'];
				$cat_id = $this->vformModel->values['category'];
				$status = $this->vformModel->values['status'];
				$post_by = $this->vformModel->values['post_by'];
				$data = array(
					'title' => $title,
					'content' => $content,
					'image' => $image,
					'cat_id' => $cat_id,
					'status' => $status,
					'post_by' => $post_by
				);
				$message = array();
				$result = $this->postModel->addPost($this->ptable, $data);
				if ($result == 1) {
					move_uploaded_file($_FILES['image']['tmp_name'], "images/post/" . $image);
					$message['add_post'] = '<div class="alert alert-success">Post added successfully.</div>';
				} else {
					$message['add_post'] = '<div class="alert alert-warning">Post does not added!</div>';
				}
				parent::adheader();
				parent::adsidebar();
				$message['cat_list'] = $this->catModel->catList($this->ctable);
				$this->load->view('admin/add-post', $message);
				parent::adfooter();
			} else {
				$data = array();
				$data['post_errors'] = $this->vformModel->errors;
				parent::adheader();
				parent::adsidebar();
				$data['cat_list'] = $this->catModel->catList($this->ctable);
				$this->load->view('admin/add-post', $data);
				parent::adfooter();
			}
		} else {
			parent::adheader();
			parent::adsidebar();
			$data = array();
			$data['cat_list'] = $this->catModel->catList($this->ctable);
			$this->load->view('admin/add-post', $data);
			parent::adfooter();
		}
	}
	public function postList() {
		parent::adheader();
		parent::adsidebar();
		$data = array();
		$data['post_list'] = $this->postModel->allPost($this->ptable, $this->ctable);
		$this->load->view('admin/post-list', $data);
		parent::adfooter();
	}
	public function updatePost($id = NULL) {
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_post'])) {
			$photo = $_FILES['image']['name'];
			$photo_exp = explode(".", $photo);
			$photo_ext = end($photo_exp);
			$image = md5(time()) . "." . $photo_ext;

			$this->vformModel->post('id');
			$this->vformModel->post('old_file');
			$this->vformModel->post('title')
							 ->length(5, 255)
							 ->empty();
			$this->vformModel->post('content')
							 ->empty();
			$this->vformModel->post('category')
							 ->empty();
			$this->vformModel->post('status')
							 ->empty();
			$this->vformModel->post('post_by');

			$id = $this->vformModel->values['id'];
			$old_file = $this->vformModel->values['old_file'];
			if ($this->vformModel->errorFree()) {
				$title = $this->vformModel->values['title'];
				$content = $this->vformModel->values['content'];
				$cat_id = $this->vformModel->values['category'];
				$status = $this->vformModel->values['status'];
				$post_by = $this->vformModel->values['post_by'];
				
				$cond = "id = $id";
				$message = array();
				if ($photo) {
					$data = array(
						'title' => $title,
						'content' => $content,
						'image' => $image,
						'cat_id' => $cat_id,
						'status' => $status,
						'post_by' => $post_by
					);
					$result = $this->postModel->updatePost($this->ptable, $data, $cond);
					if ($result == 1) {
						if (isset($old_file)) {
							unlink("images/post/" . $old_file);
						}
						move_uploaded_file($_FILES['image']['tmp_name'], "images/post/" . $image);
						$message['update_post'] = '<div class="alert alert-success">Post updated successfully.</div>';
					} else {
						$message['update_post'] = '<div class="alert alert-warning">Post does not updated!</div>';
					}
					parent::adheader();
					parent::adsidebar();
					$message['cat_list'] = $this->catModel->catList($this->ctable);
					$message['view_post'] = $this->postModel->postDetails($this->ptable, $this->ctable, $id);
					$this->load->view('admin/update-post', $message);
					parent::adfooter();
				} else {
					$data = array(
						'title' => $title,
						'content' => $content,
						'cat_id' => $cat_id,
						'status' => $status,
						'post_by' => $post_by
					);
					$result = $this->postModel->updatePost($this->ptable, $data, $cond);
					if ($result == 1) {
						$message['update_post'] = '<div class="alert alert-success">Post updated successfully.</div>';
					} else {
						$message['update_post'] = '<div class="alert alert-warning">Post does not updated!</div>';
					}
					parent::adheader();
					parent::adsidebar();
					$message['cat_list'] = $this->catModel->catList($this->ctable);
					$message['view_post'] = $this->postModel->postDetails($this->ptable, $this->ctable, $id);
					$this->load->view('admin/update-post', $message);
					parent::adfooter();
				}
			} else {
				$data = array();
				$data['post_errors'] = $this->vformModel->errors;
				parent::adheader();
				parent::adsidebar();

				$data['cat_list'] = $this->catModel->catList($this->ctable);
				$data['view_post'] = $this->postModel->postDetails($this->ptable, $this->ctable, $id);
				$this->load->view('admin/update-post', $data);
				parent::adfooter();
			}
		} else {
			parent::adheader();
			parent::adsidebar();
			$data = array();
			$data['cat_list'] = $this->catModel->catList($this->ctable);
			$data['view_post'] = $this->postModel->postDetails($this->ptable, $this->ctable, $id);
			$this->load->view('admin/update-post', $data);
			parent::adfooter();
		}
	}
	public function changeStatus($id = NULL) {
		$cond = "id = $id";
		$status = $this->postModel->singlePost($this->ptable, $id);
		$present_status = $status[0]['status'];
		if ($present_status == 1) {
			$data = array(
				'status' => 2
			);
			$result = $this->postModel->updatePost($this->ptable, $data, $cond);
			if ($result == 1) {
				header("Location: " . BASE_URL . "Admin/postList");
			}
		} elseif ($present_status == 2) {
			$data = array(
				'status' => 1
			);
			$result = $this->postModel->updatePost($this->ptable, $data, $cond);
			if ($result == 1) {
				header("Location: " . BASE_URL . "Admin/postList");
			}
		}
	}
	public function deletePost($id = NULL) {
		$cond = "id = $id";
		$result = $this->postModel->deletePost($this->ptable, $cond);
		if ($result == 1) {
			header("Location: " . BASE_URL . "Admin/postList");
		}
	}
}

?>