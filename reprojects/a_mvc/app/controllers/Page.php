<?php 

class Page extends MController {
	public function __construct() {
		parent::__construct();
	}
	public function addPage() {
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add_page'])) {
			
			$name = $_POST['name'];
			$title = $_POST['title'];
			$description = $_POST['description'];
			$keywords = $_POST['keywords'];
			$tags = $_POST['tags'];
			$author = $_POST['author'];

			$page_name = strtolower(str_replace(" ", "_", $name)) . ".php";
			$default = '<?php 
				foreach ($content as $value) {
					echo $value["body"];
				}
			?>';

			$data = array(
				'name' => $name,
				'title' => $title,
				'description' => $description,
				'keywords' => $keywords,
				'tags' => $tags,
				'author' => $author
			);
			$message = array();
			$result = $this->pageModel->addPage($this->page_table, $data);

			$page_id = $this->pageModel->singleContent($this->page_table, $name);
			$content = array(
				'body' => $name,
				'page_id' => $page_id[0]['id']
			);
			$this->pageModel->addContent($this->content_table, $content);
			if ($result == 1) {
				file_put_contents("app/views/website/" . $page_name, $default);
				$message['add_page'] = '<div class="alert alert-success">Page added successfully.</div>';
			} else {
				$message['add_page'] = '<div class="alert alert-warning">Page does not added!</div>';
			}
			parent::adheader();
			parent::adsidebar();
			$this->load->view('admin/add-page', $message);
			parent::adfooter();
		} else {
			parent::adheader();
			parent::adsidebar();
			$this->load->view('admin/add-page');
			parent::adfooter();
		}
	}
	public function pageList() {
		parent::adheader();
		parent::adsidebar();
		$data = array();
		$data['page_list'] = $this->pageModel->pageList($this->page_table);
		$this->load->view('admin/page-list', $data);
		parent::adfooter();
	}
	public function changeStatus($id = NULL) {
		$cond = "id = $id";
		$status = $this->pageModel->singlePage($this->page_table, $id);
		$present_status = $status[0]['status'];
		if ($present_status == 1) {
			$data = array(
				'status' => 2
			);
			$result = $this->pageModel->updatePage($this->page_table, $data, $cond);
			if ($result == 1) {
				header("Location: " . BASE_URL . "Page/pageList");
			}
		} elseif ($present_status == 2) {
			$data = array(
				'status' => 1
			);
			$result = $this->pageModel->updatePage($this->page_table, $data, $cond);
			if ($result == 1) {
				header("Location: " . BASE_URL . "Page/pageList");
			}
		}
	}
	public function deletePage($id = NULL) {
		$cond = "id = $id";
		$condition = "page_id = $id";

		$status = $this->pageModel->singlePage($this->page_table, $id);
		$name = $status[0]['name'];
		$page_name = strtolower(str_replace(" ", "_", $name)) . ".php";

		$result = $this->pageModel->deletePage($this->page_table, $cond);
		$cont_result = $this->pageModel->deleteContent($this->content_table, $condition);

		if ($result == 1 && $cont_result == 1) {
			unlink("app/views/website/" . $page_name);
			header("Location: " . BASE_URL . "Page/pageList");
		}
	}

	public function editPage($id = NULL) {
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['edit_content'])) {
			$id = $_POST['id'];
			$body = $_POST['body'];
			$data = array(
				'body' => $body
			);
			$cond = "id = $id";
			$message = array();
			$result = $this->pageModel->updateContent($this->content_table, $data, $cond);
			if ($result == 1) {
				$message['edit_content'] = '<div class="alert alert-success">Page updated successfully.</div>';
			} else {
				$message['edit_content'] = '<div class="alert alert-warning">Page does not updated!</div>';
			}
			
			parent::adheader();
			parent::adsidebar();
			$message['content'] = $this->pageModel->selectContent($this->content_table, $id);
			$this->load->view('admin/edit-page', $message);
			parent::adfooter();
		} else {
			$data = array();
			parent::adheader();
			parent::adsidebar();
			$data['content'] = $this->pageModel->selectContent($this->content_table, $id);
			$this->load->view('admin/edit-page', $data);
			parent::adfooter();
		}
	}
}

?>