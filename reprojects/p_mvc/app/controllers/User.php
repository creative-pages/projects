<?php 
// User controller
class User extends MController {
	private $utable = 'user';
	private $userModel;
	private $formModel;
	public function __construct() {
		parent::__construct();
		Session::init();
		if (Session::get("userLevel") != 1) {
			header("Location: " . BASE_URL . "/Admin");
		}
		$this->userModel = $this->load->model("UserModel");
		$this->formModel = $this->load->validation("DForm");
	}
	public function addUser() {
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['add_user']) {
			$this->formModel->post('username')
							->empty()
							->length(5, 30);
			$this->formModel->post('password')
							->empty()
							->length(5, 30);
			$this->formModel->post('level')
							->empty();
			if ($this->formModel->errorFree()) {
				$username = $this->formModel->values['username'];
				$password = $this->formModel->values['password'];
				$level = $this->formModel->values['level'];

				$data = array(
					'username' => $username,
					'password' => $password,
					'level' => $level
				);
				$message = array();
				$result = $this->userModel->addUser($this->utable, $data);
				if ($result == 1) {
					$message['add_user'] = '<div class="alert alert-success">User added successfully.</div>';
				} else {
					$message['add_user'] = '<div class="alert alert-warning">User does not added!</div>';
				}
				$this->load->view('admin/header');
				$this->load->view('admin/sidebar');
				$this->load->view('admin/add-user', $message);
				$this->load->view('admin/footer');
			} else {
				$data = array();
				$data['user_errors'] = $this->formModel->errors;
				$this->load->view('admin/header');
				$this->load->view('admin/sidebar');
				$this->load->view('admin/add-user', $data);
				$this->load->view('admin/footer');
			}
		} else {
			$this->load->view('admin/header');
			$this->load->view('admin/sidebar');
			$this->load->view('admin/add-user');
			$this->load->view('admin/footer');
		}
	}
	public function userList() {
		$this->load->view('admin/header');
		$this->load->view('admin/sidebar');
		$data = array();
		$data['user'] = $this->userModel->userList($this->utable);
		$this->load->view('admin/user-list', $data);
		$this->load->view('admin/footer');
	}
	public function deleteUser($id) {
		$cond = "id = $id";
		$result = $this->userModel->deleteUser($this->utable, $cond);
		if ($result == 1) {
			header("Location: " . BASE_URL . "/User/userList");
		}
	}
}

?>