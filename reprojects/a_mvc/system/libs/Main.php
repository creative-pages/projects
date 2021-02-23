<?php 

class Main {
	public $url;
	public $controllerName = 'Website';
	public $methodName = 'index';
	public $controllerPath = "app/controllers/";
	public $controllers;
	public function __construct() {
		$this->getUrl();
		$this->loadController();
		$this->callMethod();
	}
	public function getUrl() {
		$this->url = isset($_GET['url']) ? $_GET['url'] : NULL;
		if ($this->url != NULL) {
			$this->url = rtrim($this->url, "/");
			$this->url = explode("/", $this->url);
		} else {
			unset($this->url);
		}
	}
	public function loadController() {
		if (!isset($this->url[0])) {
			include_once $this->controllerPath . $this->controllerName . ".php";
			$this->controllerName = new $this->controllerName();
		} else {
			$this->controllerName = $this->url[0];
			$path = $this->controllerPath . $this->controllerName . ".php";
			if (file_exists($path)) {
				include_once $path;
				if (class_exists($this->controllerName)) {
					$this->controllerName = new $this->controllerName();
				} else {
					header("Location: " . BASE_URL);
				}
			} else {
				header("Location: " . BASE_URL);
			}
		}
	}
	public function callMethod() {
		if (isset($this->url[2])) {
			$this->methodName = $this->url[1];
			if (method_exists($this->controllerName, $this->methodName)) {
				$this->controllerName->{$this->methodName}($this->url[2]);
			} else {
				header("Location: " . BASE_URL);
			}
		} else {
			if (isset($this->url[1])) {
				$this->methodName = $this->url[1];
				if (method_exists($this->controllerName, $this->methodName)) {
					$this->controllerName->{$this->methodName}();
				} else {
					header("Location: " . BASE_URL);
				}
			} else {
				$this->controllerName->{$this->methodName}();
			}
		}
	}
}

?>