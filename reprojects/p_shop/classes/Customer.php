<?php 
$path = realpath(dirname(__FILE__));
include_once ($path . "/../lib/Session.php");
Session::init();
include_once ($path . "/../lib/Database.php");
include_once ($path . "/../helpers/Format.php");

class Customer {
	public $name;
	public $address;
	public $city;
	public $country;
	public $zip_code;
	public $phone;
	public $email;
	public $password;
	// for customer login
	public $emailErr;
	public $passwordErr;

	public $db;
	public $fm;

	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	public function addCustomer($data) {
		$name = $this->fm->validation($data['name']);
		$name = mysqli_real_escape_string($this->db->link, $name);
		$address = $this->fm->validation($data['address']);
		$address = mysqli_real_escape_string($this->db->link, $address);
		$city = $this->fm->validation($data['city']);
		$city = mysqli_real_escape_string($this->db->link, $city);
		$country = $this->fm->validation($data['country']);
		$country = mysqli_real_escape_string($this->db->link, $country);
		$zip_code = $this->fm->validation($data['zip_code']);
		$zip_code = mysqli_real_escape_string($this->db->link, $zip_code);
		$phone = $this->fm->validation($data['phone']);
		$phone = mysqli_real_escape_string($this->db->link, $phone);
		$email = $this->fm->validation($data['email']);
		$email = mysqli_real_escape_string($this->db->link, $email);
		$password = $this->fm->validation($data['password']);
		$password = mysqli_real_escape_string($this->db->link, $password);

		if (empty($name)) {
			$this->name = '<div class="alert alert-warning mb-0">Name is required.</div>';
		} elseif (is_numeric($name)) {
			$this->name = '<div class="alert alert-warning mb-0">Name can not be numeric.</div>';
			return false;
		} elseif (strlen($name) > 255) {
			$this->name = '<div class="alert alert-warning mb-0">Name should less than 255 characters.</div>';
			return false;
		}
		if (empty($address)) {
			$this->address = '<div class="alert alert-warning mb-0">Address is required.</div>';
		} elseif (is_numeric($address)) {
			$this->address = '<div class="alert alert-warning mb-0">Address can not be numeric.</div>';
			return false;
		}
		if (empty($city)) {
			$this->city = '<div class="alert alert-warning mb-0">City is required.</div>';
		} elseif (is_numeric($city)) {
			$this->city = '<div class="alert alert-warning mb-0">City can not be numeric.</div>';
			return false;
		} elseif (strlen($city) > 30) {
			$this->city = '<div class="alert alert-warning mb-0">City should less than 30 characters.</div>';
			return false;
		}
		if (empty($country)) {
			$this->country = '<div class="alert alert-warning mb-0">Country is required.</div>';
		} elseif (is_numeric($country)) {
			$this->country = '<div class="alert alert-warning mb-0">Country can not be numeric.</div>';
			return false;
		} elseif (strlen($country) > 30) {
			$this->country = '<div class="alert alert-warning mb-0">Country should less than 30 characters.</div>';
			return false;
		}
		if (empty($zip_code)) {
			$this->zip_code = '<div class="alert alert-warning mb-0">Zip-Ccode is required.</div>';
		}

		if (empty($phone)) {
			$this->phone = '<div class="alert alert-warning mb-0">Phone number is required.</div>';
		}
		if (empty($email)) {
			$this->email = '<div class="alert alert-warning mb-0">Email is required.</div>';
		} elseif (strlen($email) > 255) {
			$this->email = '<div class="alert alert-warning mb-0">Email should be less than 255 characters.</div>';
			return false;
		}
		if (empty($password)) {
			$this->password = '<div class="alert alert-warning mb-0">Password is required.</div>';
		} elseif (strlen($password) < 10 || strlen($password) > 50) {
			$this->password = '<div class="alert alert-warning mb-0">Password should be minimum 10 characters and less than 50 characters.</div>';
			return false;
		}
		if ($name && $address && $city && $country && $zip_code && $email && $password) {
			$emailCheck = "SELECT * FROM `customer` WHERE `email` = '$email'";
			$email_check = $this->db->select($emailCheck);
			if ($email_check == NULL) {
				$query = "INSERT INTO `customer`(`name`, `address`, `city`, `country`, `zip_code`, `phone`, `email`, `password`) VALUES ('$name', '$address', '$city', '$country', '$zip_code', '$phone', '$email', '$password')";
				$result = $this->db->insert($query);
				if ($result) {
					$addMsg = '<div class="alert alert-success mb-0">Account created successfully.</div>';
					return $addMsg;
				} else {
					$addMsg = '<div class="alert alert-warning mb-0">Account does not created!</div>';
					return $addMsg;
				}
			} else {
				$this->email = '<div class="alert alert-warning mb-0">This email already exists!</div>';
			}
		}
	}
	public function updateCustomer($data) {
		$id = Session::get('customerId');
		$name = $this->fm->validation($data['name']);
		$name = mysqli_real_escape_string($this->db->link, $name);
		$address = $this->fm->validation($data['address']);
		$address = mysqli_real_escape_string($this->db->link, $address);
		$city = $this->fm->validation($data['city']);
		$city = mysqli_real_escape_string($this->db->link, $city);
		$country = $this->fm->validation($data['country']);
		$country = mysqli_real_escape_string($this->db->link, $country);
		$zip_code = $this->fm->validation($data['zip_code']);
		$zip_code = mysqli_real_escape_string($this->db->link, $zip_code);
		$phone = $this->fm->validation($data['phone']);
		$phone = mysqli_real_escape_string($this->db->link, $phone);
		$email = $this->fm->validation($data['email']);
		$email = mysqli_real_escape_string($this->db->link, $email);
		$password = $this->fm->validation($data['password']);
		$password = mysqli_real_escape_string($this->db->link, $password);

		if (empty($name)) {
			$this->name = '<div class="alert alert-warning mb-0">Name is required.</div>';
		} elseif (is_numeric($name)) {
			$this->name = '<div class="alert alert-warning mb-0">Name can not be numeric.</div>';
			return false;
		} elseif (strlen($name) > 255) {
			$this->name = '<div class="alert alert-warning mb-0">Name should less than 255 characters.</div>';
			return false;
		}
		if (empty($address)) {
			$this->address = '<div class="alert alert-warning mb-0">Address is required.</div>';
		} elseif (is_numeric($address)) {
			$this->address = '<div class="alert alert-warning mb-0">Address can not be numeric.</div>';
			return false;
		}
		if (empty($city)) {
			$this->city = '<div class="alert alert-warning mb-0">City is required.</div>';
		} elseif (is_numeric($city)) {
			$this->city = '<div class="alert alert-warning mb-0">City can not be numeric.</div>';
			return false;
		} elseif (strlen($city) > 30) {
			$this->city = '<div class="alert alert-warning mb-0">City should less than 30 characters.</div>';
			return false;
		}
		if (empty($country)) {
			$this->country = '<div class="alert alert-warning mb-0">Country is required.</div>';
		} elseif (is_numeric($country)) {
			$this->country = '<div class="alert alert-warning mb-0">Country can not be numeric.</div>';
			return false;
		} elseif (strlen($country) > 30) {
			$this->country = '<div class="alert alert-warning mb-0">Country should less than 30 characters.</div>';
			return false;
		}
		if (empty($zip_code)) {
			$this->zip_code = '<div class="alert alert-warning mb-0">Zip-Ccode is required.</div>';
		}

		if (empty($phone)) {
			$this->phone = '<div class="alert alert-warning mb-0">Phone number is required.</div>';
		}
		if (empty($email)) {
			$this->email = '<div class="alert alert-warning mb-0">Email is required.</div>';
		} elseif (strlen($email) > 255) {
			$this->email = '<div class="alert alert-warning mb-0">Email should be less than 255 characters.</div>';
			return false;
		}
		if (empty($password)) {
			$this->password = '<div class="alert alert-warning mb-0">Password is required.</div>';
		} elseif (strlen($password) < 10 || strlen($password) > 50) {
			$this->password = '<div class="alert alert-warning mb-0">Password should be minimum 10 characters and less than 50 characters.</div>';
			return false;
		}
		if ($name && $address && $city && $country && $zip_code && $email && $password) {
			$emailCheck = "SELECT * FROM `customer` WHERE `email` = '$email'";
			$email_check = $this->db->select($emailCheck);
			if ($email_check) {
				$email_check_result = $email_check->fetch_assoc();
			}
			$selfEmail = "SELECT * FROM `customer` WHERE `id` = '$id'";
			$self_email = $this->db->select($selfEmail);
			if ($self_email) {
				$self_email_result = $self_email->fetch_assoc();
			}
			if ($email_check == NULL OR $email_check_result['email'] !== $email OR $self_email_result['email'] == $email) {
				$query = "UPDATE `customer` SET `name`= '$name',`address`= '$address',`city`= '$city',`country`= '$country',`zip_code`= '$zip_code',`phone`= '$phone',`email`= '$email',`password`= '$password' WHERE `id` = '$id'";
				$result = $this->db->update($query);
				if ($result) {
					$updateMsg = '<div class="alert alert-success mb-0">Account updated successfully.</div>';
					return $updateMsg;
				} else {
					$updateMsg = '<div class="alert alert-warning mb-0">Account does not updated!</div>';
					return $updateMsg;
				}
			} else {
				$this->email = '<div class="alert alert-warning mb-0">This email already exists!</div>';
			}
		}
	}

	public function customerLogin($data) {
		$email = $this->fm->validation($data['email']);
		$email = mysqli_real_escape_string($this->db->link, $email);
		$password = $this->fm->validation($data['password']);
		$password = mysqli_real_escape_string($this->db->link, $password);


		if (empty($email)) {
			$this->emailErr = '<div class="alert alert-warning">Please enter your email.</div>';
		}
		if (empty($password)) {
			$this->passwordErr = '<div class="alert alert-warning">Please enter your Password.</div>';
		}

		if ($email !== '' && $password !== '') {
			$emailCheck = "SELECT * FROM `customer` WHERE `email` = '$email'";
			$email_check = $this->db->select($emailCheck);
			if ($email_check != false) {
				$passwordCheck = $email_check->fetch_assoc();
				if ($passwordCheck['password'] == $password) {
					Session::set('login', true);
					Session::set('customerId', $passwordCheck['id']);
					Session::set('customerName', $passwordCheck['name']);
					header("Location: index.php");
				} else {
					$this->passwordErr = '<div class="alert alert-warning">Password does not matched!</div>';
				}
			} else {
				$this->emailErr = '<div class="alert alert-warning">Email is wrong!</div>';
			}
		}
	}
	public function customerProfile($id) {
		$id = $this->fm->validation($id);
		$id = mysqli_real_escape_string($this->db->link, $id);
		$query = "SELECT * FROM `customer` WHERE `id` = '$id'";
		$result = $this->db->select($query);
		return $result;
	}
}

?>