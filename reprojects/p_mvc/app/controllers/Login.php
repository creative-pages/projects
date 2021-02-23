<?php 
// Login controller
class Login extends MController {
	private $utable = 'user';
	private $loginModel;
	public function __construct() {
		parent::__construct();
		$this->loginModel = $this->load->model("LoginModel");
	}
	public function Index() {
		$this->login();
	}
	public function login() {
		$this->load->view('login/login');
	}
	public function loginAuth() {
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['admin_login']) {
			$username = $_POST['username'];
			$password = $_POST['password'];

			$count = $this->loginModel->userControl($this->utable, $username, $password);
			if ($count > 0) {
				$result = $this->loginModel->getUserData($this->utable, $username, $password);
				Session::init();
				Session::set('login', true);
				Session::set('userId', $result[0]['id']);
				Session::set('userName', $result[0]['username']);
				Session::set('userLevel', $result[0]['level']);
				header("Location: " . BASE_URL . "/Admin");
			} else {
				header("Location: " . BASE_URL . "/Login");
			}
		} else {
			header("Location: " . BASE_URL . "/Login");
		}
	}
	public function logout() {
		Session::init();
		Session::destroy();
		header("Location: " . BASE_URL . "/Login");
	}
}

?>