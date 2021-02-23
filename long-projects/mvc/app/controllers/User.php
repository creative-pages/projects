<?php 

class User extends MController {
	private $table = 'user';
	private $userModel;
	private $input;
	public function __construct() {
		parent::__construct();
		Session::checkSession();
		$this->userModel = $this->load->model('UModel');
		$this->input = $this->load->validation('DForm');
	}
	public function adduser() {
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['add_user']) {
			$this->input->post('username')
						->empty()
						->length(5, 15);
			$this->input->post('password')
						->empty()
						->length(5, 32);
			$this->input->post('level')
						->empty();

			if ($this->input->submit()) {
				$username = $this->input->values['username'];
				$password = $this->input->values['password'];
				$level = $this->input->values['level'];
				$data = array(
					'username' => $username,
					'password' => $password,
					'level' => $level
				);

				$this->load->view('admin/header');
				$this->load->view('admin/sidebar');

				$message = array();
				$result = $this->userModel->addUser($this->table, $data);
				if ($result) {
					$message['add_user'] = '<div class="alert alert-success">User added successfully.</div>';
				} else {
					$message['add_user'] = '<div class="alert alert-warning">User does not added!</div>';
				}
				$this->load->view('admin/add-user', $message);

				$this->load->view('admin/footer');
			} else {
				$data = array();
				$data['user_errors'] = $this->input->errors;
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
		$data['user'] = $this->userModel->userList($this->table);
		$this->load->view('admin/user-list', $data);

		$this->load->view('admin/footer');
	}
	public function deleteUser($id = NULL) {
		$cond = "id = $id";
		$result = $this->userModel->deleteUser($this->table, $cond);
		if ($result) {
			header("Location: " . BASE_URL . "/User/userList");
		}
	}
}

?>