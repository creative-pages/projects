<?php 

class Login extends MController {
	private $utable = 'users';
	private $loginModel;
	public function __construct() {
		parent::__construct();
		$this->loginModel = $this->load->model('LoginModel');
	}
	public function index() {
		$this->login();
	}
	public function login() {
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['login'])) {
			$username = $_POST['username'];
			$password = $_POST['password'];

			$count = $this->loginModel->userControl($this->utable, $username, $password);
			if ($count > 0) {
				$data = $this->loginModel->getUserData($this->utable, $username, $password);
				Session::init();
				Session::set('login', true);
				Session::set('userId', $data[0]['id']);
				Session::set('userName', $data[0]['username']);
				Session::set('userLevel', $data[0]['level']);
				header("Location: " . BASE_URL . "Admin");
			} else {
				$this->load->view('login/login');
			}
		} else {
			$this->load->view('login/login');
		}
	}
	public function logout() {
		Session::init();
		Session::destroy();
		header("Location: " . BASE_URL . "Login");
	}
}

?>