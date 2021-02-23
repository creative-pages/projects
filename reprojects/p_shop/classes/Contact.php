<?php 
$path = realpath(dirname(__FILE__));
include_once ($path . "/../lib/Database.php");
include_once ($path . "/../helpers/Format.php");

class Contact {
	public $name;
	public $email;
	public $phone;
	public $subject;
	public $message;
	public $mail_to;

	public $db;
	public $fm;

	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	public function insertMessage($data) {
		$name = $this->fm->validation($data['name']);
		$name = mysqli_real_escape_string($this->db->link, $name);
		$email = $this->fm->validation($data['email']);
		$email = mysqli_real_escape_string($this->db->link, $email);
		$phone = $this->fm->validation($data['phone']);
		$phone = mysqli_real_escape_string($this->db->link, $phone);
		$subject = $this->fm->validation($data['subject']);
		$subject = mysqli_real_escape_string($this->db->link, $subject);
		$message = $this->fm->validation($data['message']);
		$message = mysqli_real_escape_string($this->db->link, $message);

		if (empty($name)) {
			$this->name = '<div class="alert alert-warning mb-0">Name is required.</div>';
		} elseif (is_numeric($name)) {
			$this->name = '<div class="alert alert-warning mb-0">Name can not be numeric.</div>';
			return false;
		} elseif (strlen($name) < 4 || strlen($name) > 50) {
			$this->name = '<div class="alert alert-warning mb-0">Name should be minimum 4 characters and less than 50 characters.</div>';
			return false;
		}
		if (empty($email)) {
			$this->email = '<div class="alert alert-warning mb-0">Email is required.</div>';
		} elseif (strlen($email) > 255) {
			$this->email = '<div class="alert alert-warning mb-0">Email should less than 255 characters.</div>';
			return false;
		}
		if (empty($phone)) {
			$this->phone = '<div class="alert alert-warning mb-0">Phone is required.</div>';
		}
		if (empty($subject)) {
			$this->subject = '<div class="alert alert-warning mb-0">Subject is required.</div>';
		} elseif (is_numeric($subject)) {
			$this->subject = '<div class="alert alert-warning mb-0">Subject can not be numeric.</div>';
			return false;
		} elseif (strlen($subject) > 255) {
			$this->subject = '<div class="alert alert-warning mb-0">Subject should be  less than 255 characters.</div>';
			return false;
		}

		if (empty($message)) {
			$this->message = '<div class="alert alert-warning mb-0">Message is required.</div>';
		} elseif (is_numeric($message)) {
			$this->message = '<div class="alert alert-warning mb-0">Message can not be numeric.</div>';
			return false;
		}

		if ($name && $email && $phone && $subject && $message) {
			$query = "INSERT INTO `contact`(`name`, `email`, `phone`, `subject`, `message`) VALUES ('$name', '$email', '$phone', '$subject', '$message')";
			$result = $this->db->insert($query);
			if ($result) {
				$addMsg = '<div class="alert alert-success mb-0 mt-5">Message sent successfully.</div>';
				return $addMsg;
			} else {
				$addMsg = '<div class="alert alert-warning mb-0 mt-5">Message does not sent.</div>';
				return $addMsg;
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
	public function viewMessage($id) {
		$query = "SELECT * FROM `contact` WHERE `id` = '$id'";
		$result = $this->db->select($query);
		return $result;
	}
	public function seenMessage($id) {
		$query = "UPDATE `contact` SET `status` = '1' WHERE `id` = '$id'";
		$result = $this->db->update($query);
		if ($result) {
			header("Location: inbox.php");
		}
	}
	public function deleteMessage($id) {
		$query = "DELETE FROM `contact` WHERE `id` = '$id'";
		$result = $this->db->delete($query);
		if ($result) {
			header("Location: inbox.php");
		}
	}
	public function replyMessage($data) {
		$name = $this->fm->validation($data['name']);
		$name = mysqli_real_escape_string($this->db->link, $name);
		$mail_from = $this->fm->validation($data['mail_from']);
		$mail_from = mysqli_real_escape_string($this->db->link, $mail_from);
		$mail_to = $this->fm->validation($data['mail_to']);
		$mail_to = mysqli_real_escape_string($this->db->link, $mail_to);
		$subject = $this->fm->validation($data['subject']);
		$subject = mysqli_real_escape_string($this->db->link, $subject);
		$message = $this->fm->validation($data['message']);
		$message = mysqli_real_escape_string($this->db->link, $message);

		if (empty($mail_to)) {
			$this->mail_to = '<div class="alert alert-warning mb-0">Email is required.</div>';
		}
		if (empty($subject)) {
			$this->subject = '<div class="alert alert-warning mb-0">Subject is required.</div>';
		}
		if (empty($message)) {
			$this->message = '<div class="alert alert-warning mb-0">Message is required.</div>';
		}

		if ($mail_to && $subject && $message) {
			$sendMail = mail($mail_to, $subject, $message);
			if ($sendMail) {
				$sendMsg = '<div class="alert alert-success">Message sent Successfully.</div>';
				return $sendMsg;
			} else {
				$sendMsg = '<div class="alert alert-danger">Failed to send message!</div>';
				return $sendMsg;
			}
		}

	}
}

?>