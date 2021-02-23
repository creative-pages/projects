<?php 
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . '/../lib/Database.php');
include_once ($filepath . '/../healper/Format.php');

class Product {
	public $name;
	public $category_id;
	public $brand_id;
	public $description;
	public $price;
	public $image;
	public $type;

	private $db;
	private $fm;

	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	public function insertProduct($data, $file) {
		$name = $this->fm->validation($data['name']);
		$name = mysqli_real_escape_string($this->db->link, $data['name']);
		$category_id = $this->fm->validation($data['category_id']);
		$category_id = mysqli_real_escape_string($this->db->link, $data['category_id']);
		$brand_id = $this->fm->validation($data['brand_id']);
		$brand_id = mysqli_real_escape_string($this->db->link, $data['brand_id']);
		$description = $this->fm->validation($data['description']);
		$description = mysqli_real_escape_string($this->db->link, $data['description']);
		$price = $this->fm->validation($data['price']);
		$price = mysqli_real_escape_string($this->db->link, $data['price']);
		$type = $this->fm->validation($data['type']);
		$type = mysqli_real_escape_string($this->db->link, $data['type']);


		$permited = array('jpg', 'jpeg', 'png', 'gif');
		$file_name = $file['image']['name'];
		$file_size = $file['image']['size'];
		$file_tmp = $file['image']['tmp_name'];
		$file_exp = explode('.', $file_name);
		$file_ext = strtolower(end($file_exp));
		$image = substr(md5(time()), 0, 10) . '.' . $file_ext;
		if (empty($name)) {
			$this->name = "Product name is required.";
		}
		if (empty($category_id)) {
			$this->category_id = "Product category is required.";
		}
		if (empty($brand_id)) {
			$this->brand_id = "Brand is required.";
		}
		if (empty($description)) {
			$this->description = "Description is required.";
		}
		if (empty($file_name)) {
			$this->image = "Please select an image.";
		}
		if (empty($price)) {
			$this->price = "Price field is required.";
		}
		if (empty($type)) {
			$this->type = "Please select the type.";
		}
		if ($name && $category_id && $brand_id && $description && $file_name && $price && $type) {
			if ($file_size > 5048567) {
				$this->image = "Image size should be less than 5mb!";
			} elseif (in_array($file_ext, $permited) === false) {
				$this->image = "You can upload only:-" . implode(", ", $permited);
			} else {
				$query = "INSERT INTO `product`(`name`, `category_id`, `brand_id`, `description`, `price`, `image`, `type`) VALUES ('$name', '$category_id', '$brand_id', '$description', '$price', '$image', '$type')";
				$result = $this->db->insert($query);
				if ($result) {
					move_uploaded_file($file_tmp, "upload/" . $image);
					$insertMsg = '<div class="alert alert-success">Product inserted successfully.</div>';
					return $insertMsg;
				} else {
					$insertMsg = '<div class="alert alert-warning">Product does not inserted!</div>';
					return $insertMsg;
				}
				
			}
		}
	}
	public function allProduct() {
		$query = "SELECT `product`.*, `category`.`categoryName`, `brand`.`brandName`
		FROM `product`
		INNER JOIN `category` ON `category`.`categoryId` = `product`.`category_id`
		INNER JOIN `brand` ON `brand`.`brandId` = `product`.`brand_id`";
		$result = $this->db->select($query);
		return $result;
	}
	public function singleProduct($id) {
		$query = "SELECT * FROM `product` WHERE `id` = '$id'";
		$result = $this->db->select($query);
		return $result;
	}
	public function updateProduct($data, $file) {
		$id = $data['id'];
		$old_file = $data['old_file'];


		$name = $this->fm->validation($data['name']);
		$name = mysqli_real_escape_string($this->db->link, $data['name']);
		$category_id = $this->fm->validation($data['category_id']);
		$category_id = mysqli_real_escape_string($this->db->link, $data['category_id']);
		$brand_id = $this->fm->validation($data['brand_id']);
		$brand_id = mysqli_real_escape_string($this->db->link, $data['brand_id']);
		$description = $this->fm->validation($data['description']);
		$description = mysqli_real_escape_string($this->db->link, $data['description']);
		$price = $this->fm->validation($data['price']);
		$price = mysqli_real_escape_string($this->db->link, $data['price']);
		$type = $this->fm->validation($data['type']);
		$type = mysqli_real_escape_string($this->db->link, $data['type']);


		$permited = array('jpg', 'jpeg', 'png', 'gif');
		$file_name = $file['image']['name'];
		$file_size = $file['image']['size'];
		$file_tmp = $file['image']['tmp_name'];
		$file_exp = explode('.', $file_name);
		$file_ext = strtolower(end($file_exp));
		$image = substr(md5(time()), 0, 10) . '.' . $file_ext;
		if (empty($name)) {
			$this->name = "Product name is required.";
		}
		if (empty($category_id)) {
			$this->category_id = "Product category is required.";
		}
		if (empty($brand_id)) {
			$this->brand_id = "Brand is required.";
		}
		if (empty($description)) {
			$this->description = "Description is required.";
		}
		if (empty($price)) {
			$this->price = "Price field is required.";
		}
		if (empty($type)) {
			$this->type = "Please select the type.";
		}
		if ($name && $category_id && $brand_id && $description && $price && $type) {
			if ($file_name) {
				if ($file_size > 5048567) {
					$this->image = "Image size should be less than 5mb!";
				} elseif (in_array($file_ext, $permited) === false) {
					$this->image = "You can upload only:-" . implode(", ", $permited);
				} else {
					$query = "UPDATE `product` SET `name`= '$name',`category_id`= '$category_id',`brand_id`= '$brand_id',`description`= '$description',`price`= '$price',`image`= '$image',`type`= '$type' WHERE `id` = '$id'";
					$result = $this->db->insert($query);
					if ($result) {
						unlink("upload/" . $old_file);
						move_uploaded_file($file_tmp, "upload/" . $image);
						$updateMsg = '<div class="alert alert-success">Product updated successfully.</div>';
						return $updateMsg;
					} else {
						$updateMsg = '<div class="alert alert-warning">Product does not updated!</div>';
						return $updateMsg;
					}
					
				}
			} else {
				$query = "UPDATE `product` SET `name`= '$name',`category_id`= '$category_id',`brand_id`= '$brand_id',`description`= '$description',`price`= '$price',`type`= '$type' WHERE `id` = '$id'";
					$result = $this->db->insert($query);
					if ($result) {
						$updateMsg = '<div class="alert alert-success">Product updated successfully.</div>';
						return $updateMsg;
					} else {
						$updateMsg = '<div class="alert alert-warning">Product does not updated!</div>';
						return $updateMsg;
					}
			}
		}
	}
	public function deleteProduct($id) {
		$query = "DELETE FROM `product` WHERE `id` = '$id'";
		$result = $this->db->delete($query);
		return $result;
	}
	public function featuredProduct() {
		$query = "SELECT * FROM `product` WHERE `type` = '1'";
		$result = $this->db->select($query);
		return $result;
	}
	public function newProduct() {
		$query = "SELECT * FROM `product` ORDER BY `id` DESC";
		$result = $this->db->select($query);
		return $result;
	}
	public function signleProduct($id) {
		$query = "SELECT `product`.`name`, `product`.`description`, `product`.`price`, `product`.`image`, `category`.`categoryName`, `brand`.`brandName`
		FROM `product`
		INNER JOIN `category` ON `category`.`categoryId` = `product`.`category_id`
		INNER JOIN `brand` ON `brand`.`brandId` = `product`.`brand_id`
		WHERE `product`.`id` = '$id'";
		$result = $this->db->select($query);
		return $result;
	}
	public function latestBrandOne() {
		$query = "SELECT `brand`.`brandName`, `product`.`id`, `product`.`description`, `product`.`image`
					FROM `brand`
					INNER JOIN `product` ON `product`.`brand_id` = `brand`.`brandId`
					WHERE `product`.`brand_id` = '1' ORDER BY `product`.`id` DESC";
		$result = $this->db->select($query);
		return $result;
	}
	public function latestBrandTwo() {
		$query = "SELECT `brand`.`brandName`, `product`.`id`, `product`.`description`, `product`.`image`
					FROM `brand`
					INNER JOIN `product` ON `product`.`brand_id` = `brand`.`brandId`
					WHERE `product`.`brand_id` = '2' ORDER BY `product`.`id` DESC";
		$result = $this->db->select($query);
		return $result;
	}
	public function latestBrandThree() {
		$query = "SELECT `brand`.`brandName`, `product`.`id`, `product`.`description`, `product`.`image`
					FROM `brand`
					INNER JOIN `product` ON `product`.`brand_id` = `brand`.`brandId`
					WHERE `product`.`brand_id` = '3' ORDER BY `product`.`id` DESC";
		$result = $this->db->select($query);
		return $result;
	}
	public function latestBrandFour() {
		$query = "SELECT `brand`.`brandName`, `product`.`id`, `product`.`description`, `product`.`image`
					FROM `brand`
					INNER JOIN `product` ON `product`.`brand_id` = `brand`.`brandId`
					WHERE `product`.`brand_id` = '11' ORDER BY `product`.`id` DESC";
		$result = $this->db->select($query);
		return $result;
	}
	public function productByCategory($id) {
		$query = "SELECT `product`.*, `category`.`categoryName`
			FROM `category`
			INNER JOIN `product` ON `product`.`category_id` = `category`.`categoryId`
			WHERE `product`.`category_id` = '$id' ORDER BY `product`.`id` DESC";
		$result = $this->db->select($query);
		return $result;
	}
	public function insertCompareProduct($compareId, $customer_id) {
		$c_query = "SELECT * FROM `compare` WHERE `product_id` = '$compareId' AND `customer_id` = '$customer_id'";
		$c_query_result = $this->db->select($c_query);
		if ($c_query_result) {
			$compareMsg = '<div class="alert alert-warning">Compare already added.</div>';
					return $compareMsg;
		} else {
			$selectProduct = "SELECT * FROM `product` WHERE `id` = '$compareId'";
			$selectProductRow = $this->db->select($selectProduct)->fetch_assoc();
			if ($selectProductRow) {
				$product_id = $selectProductRow['id'];	
				$product_name = $selectProductRow['name'];	
				$price = $selectProductRow['price'];	
				$image = $selectProductRow['image'];
				$query = "INSERT INTO `compare`(`customer_id`, `product_id`, `product_name`, `price`, `image`) VALUES ('$customer_id', '$product_id', '$product_name', '$price', '$image')";
				$result = $this->db->insert($query);
				if ($result) {
					$compareMsg = '<div class="alert alert-success">Compare added successfully.</div>';
					return $compareMsg;
				} else {
					$compareMsg = '<div class="alert alert-warning">Compare does not added!</div>';
					return $compareMsg;
				}
			}
		}
	}
	public function viewCompare($customer_id) {
		$query = "SELECT * FROM `compare` WHERE `customer_id` = '$customer_id'";
		$result = $this->db->select($query);
		return $result;
	}
	public function deleteCompareData($customer_id) {
		$query = "DELETE FROM `compare` WHERE `customer_id` = '$customer_id'";
		$result = $this->db->delete($query);
		return $result;
	}
	public function insertWishlistProduct($wishlistId, $customer_id) {
		$w_query = "SELECT * FROM `wish_list` WHERE `product_id` = '$wishlistId' AND `customer_id` = '$customer_id'";
		$w_query_result = $this->db->select($w_query);
		if ($w_query_result) {
			$wishlishtMsg = '<div class="alert alert-warning">Already added to wishlisht.</div>';
					return $wishlishtMsg;
		} else {
			$selectProduct = "SELECT * FROM `product` WHERE `id` = '$wishlistId'";
			$selectProductRow = $this->db->select($selectProduct)->fetch_assoc();
			if ($selectProductRow) {
				$product_id = $selectProductRow['id'];	
				$product_name = $selectProductRow['name'];	
				$price = $selectProductRow['price'];	
				$image = $selectProductRow['image'];
				$query = "INSERT INTO `wish_list`(`customer_id`, `product_id`, `product_name`, `price`, `image`) VALUES ('$customer_id', '$product_id', '$product_name', '$price', '$image')";
				$result = $this->db->insert($query);
				if ($result) {
					$wishlishtMsg = '<div class="alert alert-success">Added to wishlisht successfully.</div>';
					return $wishlishtMsg;
				} else {
					$wishlishtMsg = '<div class="alert alert-warning">Failed to added wishlist.</div>';
					return $wishlishtMsg;
				}
			}
		}
	}
	public function viewWishlish($customer_id) {
		$query = "SELECT * FROM `wish_list` WHERE `customer_id` = '$customer_id'";
		$result = $this->db->select($query);
		return $result;
	}
	public function deleteWishlist($id, $customerId) {
		$query = "DELETE FROM `wish_list` WHERE `customer_id` = '$customerId' AND `product_id` = '$id'";
		$result = $this->db->delete($query);
		return $result;
	}
}

?>