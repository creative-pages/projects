<?php 
$path = realpath(dirname(__FILE__));
include_once ($path . "/../lib/Database.php");
include_once ($path . "/../helpers/Format.php");

class Product {
	public $name;
	public $brand_id;
	public $category_id;
	public $description;
	public $price;
	public $image;
	public $type;

	public $db;
	public $fm;

	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	public function addProduct($data) {
		$name = $this->fm->validation($data['name']);
		$name = mysqli_real_escape_string($this->db->link, $name);
		$brand_id = $this->fm->validation($data['brand_id']);
		$brand_id = mysqli_real_escape_string($this->db->link, $brand_id);
		$category_id = $this->fm->validation($data['category_id']);
		$category_id = mysqli_real_escape_string($this->db->link, $category_id);
		$description = $this->fm->validation($data['description']);
		$description = mysqli_real_escape_string($this->db->link, $description);
		$price = $this->fm->validation($data['price']);
		$price = mysqli_real_escape_string($this->db->link, $price);
		$type = $this->fm->validation($data['type']);
		$type = mysqli_real_escape_string($this->db->link, $type);

		$permited = array('jpg', 'jpeg', 'png', 'gif');
		$file_name = $_FILES['image']['name'];
		$file_size = $_FILES['image']['size'];
		$file_tmp = $_FILES['image']['tmp_name'];
		$file_exp = explode(".", $file_name);
		$file_ext = strtolower(end($file_exp));
		$image = substr(md5(time()), 0, 10) . '.' . $file_ext;

		if (empty($name)) {
			$this->name = '<div class="alert alert-warning w-50">Please enter your product name.</div>';
		} elseif (is_numeric($name)) {
			$this->name = '<div class="alert alert-warning w-50">Product name not should be numeric.</div>';
			return false;
		} elseif (strlen($name) > 250) {
			$this->name = '<div class="alert alert-warning w-50">Product name should be less than 250 characters.</div>';
			return false;
		}
		if (empty($brand_id)) {
			$this->brand_id = '<div class="alert alert-warning w-50">Please select a brand.</div>';
		}
		if (empty($category_id)) {
			$this->category_id = '<div class="alert alert-warning w-50">Please select a category.</div>';
		}
		if (empty($description)) {
			$this->description = '<div class="alert alert-warning w-50">Please enter your product description.</div>';
		}
		if (empty($price)) {
			$this->price = '<div class="alert alert-warning w-50">Please enter your product price.</div>';
		}
		if (empty($file_name)) {
			$this->image = '<div class="alert alert-warning w-50">Please select an image for your product.</div>';
		}
		if (empty($type)) {
			$this->type = '<div class="alert alert-warning w-50">Select your product type.</div>';
		}

		if ($name && $brand_id && $category_id && $description && $price && $file_name && $type) {
			if ($file_size > 5048567) {
				$this->image = '<div class="alert alert-warning mb-0">Image size should be less than 5mb!</div>';
			} elseif (in_array($file_ext, $permited) == false) {
				$this->image = '<div class="alert alert-warning mb-0">You can upload only:- ' . implode(', ', $permited) . '</div>';
			} else {
				$query = "INSERT INTO `product`(`name`, `brand_id`, `category_id`, `description`, `price`, `image`, `type`) VALUES ('$name', '$brand_id', '$category_id', '$description', '$price', '$image', '$type')";
				$result = $this->db->insert($query);
				if ($result) {
					move_uploaded_file($file_tmp, 'uploads/products/' . $image);
					$insertMsg = '<div class="alert alert-success mb-0">Product inserted successfully.</div>';
					return $insertMsg;
				} else {
					$insertMsg = '<div class="alert alert-warning mb-0">Product does not inserted.</div>';
					return $insertMsg;
				}
			}
		}
	}
	public function updateProduct($data) {
		$productId = $this->fm->validation($data['productId']);
		$productId = mysqli_real_escape_string($this->db->link, $productId);
		$old_file = $this->fm->validation($data['old_file']);
		$old_file = mysqli_real_escape_string($this->db->link, $old_file);

		$name = $this->fm->validation($data['name']);
		$name = mysqli_real_escape_string($this->db->link, $name);
		$brand_id = $this->fm->validation($data['brand_id']);
		$brand_id = mysqli_real_escape_string($this->db->link, $brand_id);
		$category_id = $this->fm->validation($data['category_id']);
		$category_id = mysqli_real_escape_string($this->db->link, $category_id);
		$description = $this->fm->validation($data['description']);
		$description = mysqli_real_escape_string($this->db->link, $description);
		$price = $this->fm->validation($data['price']);
		$price = mysqli_real_escape_string($this->db->link, $price);
		$type = $this->fm->validation($data['type']);
		$type = mysqli_real_escape_string($this->db->link, $type);

		$permited = array('jpg', 'jpeg', 'png', 'gif');
		$file_name = $_FILES['image']['name'];
		$file_size = $_FILES['image']['size'];
		$file_tmp = $_FILES['image']['tmp_name'];
		$file_exp = explode(".", $file_name);
		$file_ext = strtolower(end($file_exp));
		$image = substr(md5(time()), 0, 10) . '.' . $file_ext;

		if (empty($name)) {
			$this->name = '<div class="alert alert-warning w-50">Please enter your product name.</div>';
		} elseif (is_numeric($name)) {
			$this->name = '<div class="alert alert-warning w-50">Product name not should be numeric.</div>';
			return false;
		} elseif (strlen($name) > 250) {
			$this->name = '<div class="alert alert-warning w-50">Product name should be less than 250 characters.</div>';
			return false;
		}
		if (empty($brand_id)) {
			$this->brand_id = '<div class="alert alert-warning w-50">Please select a brand.</div>';
		}
		if (empty($category_id)) {
			$this->category_id = '<div class="alert alert-warning w-50">Please select a category.</div>';
		}
		if (empty($description)) {
			$this->description = '<div class="alert alert-warning w-50">Please enter your product description.</div>';
		}
		if (empty($price)) {
			$this->price = '<div class="alert alert-warning w-50">Please enter your product price.</div>';
		}
		if (empty($type)) {
			$this->type = '<div class="alert alert-warning w-50">Select your product type.</div>';
		}

		if ($name && $brand_id && $category_id && $description && $price && $type) {
			if ($file_name) {
				if ($file_size > 5048567) {
				$this->image = '<div class="alert alert-warning mb-0">Image size should be less than 5mb!</div>';
				} elseif (in_array($file_ext, $permited) == false) {
					$this->image = '<div class="alert alert-warning mb-0">You can upload only:- ' . implode(', ', $permited) . '</div>';
				} else {
					$query = "UPDATE `product` SET `name`= '$name',`brand_id`= '$brand_id',`category_id`= '$category_id',`description`= '$description',`price`= '$price',`image`= '$image',`type`= '$type' WHERE `id` = '$productId'";
					$result = $this->db->update($query);
					if ($result) {
						if ($old_file) {
							unlink('uploads/products/' . $old_file);
						}
						move_uploaded_file($file_tmp, 'uploads/products/' . $image);
						$insertMsg = '<div class="alert alert-success mb-0">Product updated successfully.</div>';
						return $insertMsg;
					} else {
						$insertMsg = '<div class="alert alert-warning mb-0">Product does not updated.</div>';
						return $insertMsg;
					}
				}
			} else {
				$query = "UPDATE `product` SET `name`= '$name',`brand_id`= '$brand_id',`category_id`= '$category_id',`description`= '$description',`price`= '$price',`type`= '$type' WHERE `id` = '$productId'";
				$result = $this->db->update($query);
				if ($result) {
					$insertMsg = '<div class="alert alert-success mb-0">Product updated successfully.</div>';
					return $insertMsg;
				} else {
					$insertMsg = '<div class="alert alert-warning mb-0">Product does not updated.</div>';
					return $insertMsg;
				}
			}
		}
	}
	public function allProduct() {
		$query = "SELECT `product`.*, `brand`.`name` AS `brand_name`, `category`.`name` AS `category_name`
			FROM `product`
			INNER JOIN `brand` ON `brand`.`id` = `product`.`brand_id`
			INNER JOIN `category` ON `category`.`id` = `product`.`category_id` ORDER BY `product`.`id` DESC";
		$result = $this->db->select($query);
		return $result;
	}
	public function featuredProduct() {
		$query = "SELECT * FROM `product` WHERE `type` = '1' ORDER BY `id` DESC LIMIT 4";
		$result = $this->db->select($query);
		return $result;
	}
	public function newProduct() {
		$query = "SELECT * FROM `product` ORDER BY `id` DESC LIMIT 8";
		$result = $this->db->select($query);
		return $result;
	}
	public function singleProduct($productId) {
		$query = "SELECT * FROM `product` WHERE `id` = '$productId'";
		$result = $this->db->select($query);
		return $result;
	}
	public function previewProduct($productId) {
		$query = "SELECT `product`.*, `brand`.`name` AS `brand_name`, `category`.`name` AS `category_name`
			FROM `product`
			INNER JOIN `brand` ON `brand`.`id` = `product`.`brand_id`
			INNER JOIN `category` ON `category`.`id` = `product`.`category_id`
            WHERE `product`.`id` = '$productId'";
		$result = $this->db->select($query);
		return $result;
	}
	public function deleteProduct($product_id) {
		$product_id = $this->fm->validation($product_id);
		$product_id = mysqli_real_escape_string($this->db->link, $product_id);
		$query = "DELETE FROM `product` WHERE `id` = '$product_id'";
		$result = $this->db->delete($query);
		return $result;
	}

	// for top brand page
	public function topBrand() {
		$brand = "SELECT * FROM `top_brand` WHERE `id` = '1'";
		$result = $this->db->select($brand);
		return $result;
	}
	public function firstBrand($first_brand) {
		$query = "SELECT * FROM `product` WHERE `brand_id` = '$first_brand' ORDER BY `id` DESC LIMIT 4";
		$result = $this->db->select($query);
		return $result;
	}
	public function secondBrand($second_brand) {
		$query = "SELECT * FROM `product` WHERE `brand_id` = '$second_brand' ORDER BY `id` DESC LIMIT 4";
		$result = $this->db->select($query);
		return $result;
	}
	public function thirdBrand($third_brand) {
		$query = "SELECT * FROM `product` WHERE `brand_id` = '$third_brand' ORDER BY `id` DESC LIMIT 4";
		$result = $this->db->select($query);
		return $result;
	}
	public function fourthBrand($fourth_brand) {
		$query = "SELECT * FROM `product` WHERE `brand_id` = '$fourth_brand' ORDER BY `id` DESC LIMIT 4";
		$result = $this->db->select($query);
		return $result;
	}
	public function productByCat($categoryId) {
		$categoryId = $this->fm->validation($categoryId);
		$categoryId = mysqli_real_escape_string($this->db->link, $categoryId);
		$query = "SELECT * FROM `product` WHERE `category_id` = '$categoryId'";
		$result = $this->db->select($query);
		return $result;
	}
	public function productByBrand($brandId) {
		$brandId = $this->fm->validation($brandId);
		$brandId = mysqli_real_escape_string($this->db->link, $brandId);
		$query = "SELECT * FROM `product` WHERE `brand_id` = '$brandId' ORDER BY `id` DESC LIMIT 4";
		$result = $this->db->select($query);
		return $result;
	}
	// code for compare
	public function compareProduct($productId) {
		$productId = $this->fm->validation($productId);
		$productId = mysqli_real_escape_string($this->db->link, $productId);
		$customer_id = Session::get('customerId');

		$checkCompare = "SELECT * FROM `compare` WHERE `customer_id` = '$customer_id' AND `product_id` = '$productId'";
		$check_compare = $this->db->select($checkCompare);
		if ($check_compare == NULL) {
			$selectData = "SELECT * FROM `product` WHERE `id` = '$productId'";
			$select_data = $this->db->select($selectData)->fetch_assoc();

			$product_id = $select_data['id'];
			$product_name = $select_data['name'];
			$price = $select_data['price'];
			$image = $select_data['image'];
			$query = "INSERT INTO `compare`(`customer_id`, `product_id`, `product_name`, `price`, `image`) VALUES ('$customer_id', '$product_id', '$product_name', '$price', '$image')";
			$result = $this->db->insert($query);
			if ($result) {
				$compareMsg = '<div class="alert alert-success mt-3">Added to compare successfully.</div>';
				return $compareMsg;
			} else {
				$compareMsg = '<div class="alert alert-warning mt-3">Something wrong!</div>';
				return $compareMsg;
			}
		} else {
			$compareMsg = '<div class="alert alert-warning mt-3">Already added to compare.</div>';
			return $compareMsg;
		}
	}
	public function viewCompare() {
		$customerId = Session::get('customerId');
		$query = "SELECT * FROM `compare` WHERE `customer_id` = '$customerId'";
		$result = $this->db->select($query);
		return $result;
	}
	public function deleteCompare($compareId) {
		$customer_id = Session::get('customerId');
		$compareId = $this->fm->validation($compareId);
		$compareId = mysqli_real_escape_string($this->db->link, $compareId);
		$query = "DELETE FROM `compare` WHERE `customer_id` = '$customer_id' AND `id` = '$compareId'";
		$result = $this->db->delete($query);
		if ($result) {
			header("Location: compare.php");
		}
	}
	public function deleteCustomerCompare() {
		$customerId = Session::get('customerId');
		$query = "DELETE FROM `compare` WHERE `customer_id` = '$customerId'";
		$result = $this->db->delete($query);
		return $result;
	}
	// code for wishlist
	public function wishlistProduct($productId) {
		$productId = $this->fm->validation($productId);
		$productId = mysqli_real_escape_string($this->db->link, $productId);
		$customer_id = Session::get('customerId');

		$checkWishlist = "SELECT * FROM `wishlist` WHERE `customer_id` = '$customer_id' AND `product_id` = '$productId'";
		$check_wishlist = $this->db->select($checkWishlist);
		if ($check_wishlist == NULL) {
			$selectData = "SELECT * FROM `product` WHERE `id` = '$productId'";
			$select_data = $this->db->select($selectData)->fetch_assoc();

			$product_id = $select_data['id'];
			$product_name = $select_data['name'];
			$price = $select_data['price'];
			$image = $select_data['image'];
			$query = "INSERT INTO `wishlist`(`customer_id`, `product_id`, `product_name`, `image`, `price`) VALUES ('$customer_id', '$product_id', '$product_name', '$image', '$price')";
			$result = $this->db->insert($query);
			if ($result) {
				$wishlistMsg = '<div class="alert alert-success mt-3">Added to wishlist successfully.</div>';
				return $wishlistMsg;
			} else {
				$wishlistMsg = '<div class="alert alert-warning mt-3">Something wrong!</div>';
				return $wishlistMsg;
			}
		} else {
			$wishlistMsg = '<div class="alert alert-warning mt-3">Already added to wishlist.</div>';
			return $wishlistMsg;
		}
	}
	public function viewWishlist() {
		$customerId = Session::get('customerId');
		$query = "SELECT * FROM `wishlist` WHERE `customer_id` = '$customerId'";
		$result = $this->db->select($query);
		return $result;
	}
	public function deleteWishlist($wishlistId) {
		$customer_id = Session::get('customerId');
		$wishlistId = $this->fm->validation($wishlistId);
		$wishlistId = mysqli_real_escape_string($this->db->link, $wishlistId);
		$query = "DELETE FROM `wishlist` WHERE `customer_id` = '$customer_id' AND `id` = '$wishlistId'";
		$result = $this->db->delete($query);
		if ($result) {
			header("Location: wishlist.php");
		}
	}
	// search products
	public function searchProduct($keyword) {
		$query = "SELECT * FROM `product` WHERE `name` LIKE '%$keyword%' OR `description` LIKE '%$keyword%' ORDER BY `id` DESC";
		$result = $this->db->select($query);
		return $result;
	}
}

?>