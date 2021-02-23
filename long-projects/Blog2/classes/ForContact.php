<?php 
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . '/../lib/Database.php');
include_once ($filepath . '/../healper/Format.php');
class ForContact {
	public $fname;
	public $lname;
	public $message;

	private $db;
	private $fm;

	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	public function sendMessage($data) {
		$fname = $this->fm->validation($data['fname']);
		$fname = mysqli_real_escape_string($this->db->link, $fname);
		$lname = $this->fm->validation($data['lname']);
		$lname = mysqli_real_escape_string($this->db->link, $lname);
		$email = $this->fm->validation($data['email']);
		$email = mysqli_real_escape_string($this->db->link, $email);
		$message = $this->fm->validation($data['message']);
		$message = mysqli_real_escape_string($this->db->link, $message);

		if (empty($fname)) {
			$this->fname = '<div class="alert alert-danger">First name must not be empty!</div>';
		}
		if (empty($lname)) {
			$this->lname = '<div class="alert alert-danger">Last name must not be empty!</div>';
		}
		if (empty($email)) {
			$this->email = '<div class="alert alert-danger">Email must not be empty!</div>';
		}
		if (empty($message)) {
			$this->message = '<div class="alert alert-danger">Message must not be empty!</div>';
		}
		if ($fname !== "" && $lname !== "" && $email !== "" && $message !== "") {
			if (filter_var($email, FILTER_VALIDATE_EMAIL) !== FALSE) {
				$query = "INSERT INTO `contact`(`fname`, `lname`, `email`, `message`) VALUES('$fname', '$lname', '$email', '$message')";
				$result = $this->db->insert($query);
				if ($result) {
					$insertMsg = '<div class="alert alert-success w-50">Message sent Successfully.</div>';
					return $insertMsg;
				} else {
					$insertMsg = '<div class="alert alert-danger w-50">Failed to send message!</div>';
					return $insertMsg;
				}
			} else {
				$this->email = '<div class="alert alert-danger">Please input a valid email.</div>';
			}
		}
	}
	public function viewUnseenMessage() {
		$query = "SELECT * FROM `contact` WHERE `status` = '0' ORDER BY `id` DESC";
		$result = $this->db->select($query);
		return $result;
	}
	public function viewSeenMessage() {
		$query = "SELECT * FROM `contact` WHERE `status` = '1' ORDER BY `id` DESC";
		$result = $this->db->select($query);
		return $result;
	}
	public function viewSingleMessage($id) {
		$query = "SELECT * FROM `contact` WHERE `id` = '$id'";
		$result = $this->db->select($query);
		return $result;
	}
	public function sendMsg($data) {
		$mail_from = $this->fm->validation($data['mail_from']);
		$mail_to = $this->fm->validation($data['mail_to']);
		$subject = $this->fm->validation($data['subject']);
		$rep_message = $this->fm->validation($data['rep_message']);
		$sendMail = mail($mail_to, $subject, $rep_message, $mail_from);
		if ($sendMail) {
			$sendMsg = '<div class="alert alert-success w-50">Message sent Successfully.</div>';
			return $sendMsg;
		} else {
			$sendMsg = '<div class="alert alert-danger w-50">Failed to send message!</div>';
			return $sendMsg;
		}
	}
	public function deleteMessage($id) {
		$query = "DELETE FROM `contact` WHERE `id` = '$id'";
		$result = $this->db->delete($query);
		return $result;
	}
	public function seenMessage($id) {
		$query = "UPDATE `contact` SET `status` = '1' WHERE `id` = '$id'";
		$result = $this->db->update($query);
		return $result;
	}
	public function totalUnseenMessage() {
		$query = "SELECT * FROM `contact` WHERE `status` = '0'";
		$result = $this->db->select($query);
		return $result;
	}
}

?>