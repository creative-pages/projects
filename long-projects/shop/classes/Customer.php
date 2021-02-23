<?php 
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . '/../lib/Database.php');
include_once ($filepath . '/../healper/Format.php');

class Customer {
	public $name;
	public $city;
	public $zip_code;
	public $email;
	public $address;
	public $country;
	public $phone;
	public $password;

	public $matchEmail;
	public $matchPassword;

	private $db;
	private $fm;

	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	public function registration($data) {
		$name = $this->fm->validation($data['name']);
		$name = mysqli_real_escape_string($this->db->link, $name);
		$city = $this->fm->validation($data['city']);
		$city = mysqli_real_escape_string($this->db->link, $city);
		$zip_code = $this->fm->validation($data['zip_code']);
		$zip_code = mysqli_real_escape_string($this->db->link, $zip_code);
		$email = $this->fm->validation($data['email']);
		$email = mysqli_real_escape_string($this->db->link, $email);
		$address = $this->fm->validation($data['address']);
		$address = mysqli_real_escape_string($this->db->link, $address);
		$country = $this->fm->validation($data['country']);
		$country = mysqli_real_escape_string($this->db->link, $country);
		$phone = $this->fm->validation($data['phone']);
		$phone = mysqli_real_escape_string($this->db->link, $phone);
		$password = $this->fm->validation($data['password']);
		$password = mysqli_real_escape_string($this->db->link, md5($password));

		if (empty($name)) {
			$this->name = "Name is required.";
		}
		if (empty($city)) {
			$this->city = "City field is required.";
		}
		if (empty($zip_code)) {
			$this->zip_code = "Zip-Code is required.";
		}
		if (empty($email)) {
			$this->email = "Email is required.";
		}
		if (empty($address)) {
			$this->address = "Address is required.";
		}
		if (empty($country)) {
			$this->country = "Country is required.";
		}
		if (empty($phone)) {
			$this->phone = "Phone is required.";
		}
		if (empty($password)) {
			$this->password = "Password is required.";
		}
		if ($name !== NULL && $city !== NULL && $zip_code !== NULL && $email !== NULL && $address !== NULL && $country !== NULL && $phone !== NULL && $password !== NULL) {
			$emailCheck = "SELECT * FROM `customer` WHERE `email` = '$email'";
			$emailChecks = $this->db->select($emailCheck);
			if ($emailChecks == NULL) {
				$query = "INSERT INTO `customer`(`name`, `address`, `city`, `country`, `zip_code`, `phone`, `email`, `password`) VALUES ('$name', '$address', '$city', '$country', '$zip_code', '$phone', '$email', '$password')";
				$result = $this->db->insert($query);
				if ($result) {
					$registerMsg = '<div class="alert alert-success">Registration successfull.</div>';
					return $registerMsg;
				} else {
					$registerMsg = '<div class="alert alert-warning">Registration failed.</div>';
					return $registerMsg;
				}
			} else {
				$this->email = "This email already exists!";
			}
		}
	}
	public function login($data) {
		$email = mysqli_real_escape_string($this->db->link, $data['email']);
		$password = mysqli_real_escape_string($this->db->link, $data['password']);
		if (empty($email)) {
			$this->matchEmail = "Email is required.";
		}
		if (empty($password)) {
			$this->matchPassword = "Password is required.";
		}
		if ($email !== "" && $password !== "") {
			$emailCheck = "SELECT * FROM `customer` WHERE `email` = '$email'";
			$emailChecks = $this->db->select($emailCheck);
			if ($emailChecks != FALSE) {
				$passwordCheck = $emailChecks->fetch_assoc();
				if ($passwordCheck['password'] == md5($password)) {
					Session::set("customerlogin", true);
					Session::set("customerId", $passwordCheck['id']);
					Session::set("customerName", $passwordCheck['name']);
					header("Location: cart.php");
				} else {
					$this->matchPassword = "Password not match!";
				}
			} else {
				$this->matchEmail = "Email not match!";
			}
		}
	}
	public function customerProfile($id) {
		$query = "SELECT * FROM `customer` WHERE `id` = '$id'";
		$result = $this->db->select($query);
		return $result;
	}
	public function updateProfile($data) {
		$customer_id = $this->fm->validation($data['customer_id']);
		$customer_id = mysqli_real_escape_string($this->db->link, $customer_id);
		$name = $this->fm->validation($data['name']);
		$name = mysqli_real_escape_string($this->db->link, $name);
		$city = $this->fm->validation($data['city']);
		$city = mysqli_real_escape_string($this->db->link, $city);
		$zip_code = $this->fm->validation($data['zip_code']);
		$zip_code = mysqli_real_escape_string($this->db->link, $zip_code);
		$email = $this->fm->validation($data['email']);
		$email = mysqli_real_escape_string($this->db->link, $email);
		$address = $this->fm->validation($data['address']);
		$address = mysqli_real_escape_string($this->db->link, $address);
		$country = $this->fm->validation($data['country']);
		$country = mysqli_real_escape_string($this->db->link, $country);
		$phone = $this->fm->validation($data['phone']);
		$phone = mysqli_real_escape_string($this->db->link, $phone);
		$password = $this->fm->validation($data['password']);
		$password = mysqli_real_escape_string($this->db->link, md5($password));

		if (empty($name)) {
			$this->name = "Name is required.";
		}
		if (empty($city)) {
			$this->city = "City field is required.";
		}
		if (empty($zip_code)) {
			$this->zip_code = "Zip-Code is required.";
		}
		if (empty($email)) {
			$this->email = "Email is required.";
		}
		if (empty($address)) {
			$this->address = "Address is required.";
		}
		if (empty($country)) {
			$this->country = "Country is required.";
		}
		if (empty($phone)) {
			$this->phone = "Phone is required.";
		}
		if (empty($password)) {
			$this->password = "Password is required.";
		}
		if ($name && $city && $zip_code && $email && $address && $country && $phone && $password) {
			$emailCheck = "SELECT * FROM `customer` WHERE `email` = '$email'";
			$emailChecks = $this->db->select($emailCheck);
			if ($emailChecks == NULL) {
				$query = "UPDATE `customer` SET `name`= '$name',`address`= '$address',`city`= '$city',`country`= '$country',`zip_code`= '$zip_code',`phone`= '$phone',`email`= '$email',`password`= '$password' WHERE `id` = '$customer_id'";
				$result = $this->db->insert($query);
				if ($result) {
					$updteMsg = '<div class="alert alert-success">Data updated successfully.</div>';
					return $updteMsg;
				} else {
					$updteMsg = '<div class="alert alert-warning">Data does not updated!</div>';
					return $updteMsg;
				}
				
			} else {
				$this->email = "This email already exists!";
			}
		}
	}
	public function customerDetails($id) {
		$query = "SELECT * FROM `customer` WHERE `id` = '$id'";
		$result = $this->db->select($query);
		return $result;
	}
}

?>