<?php 
$path = realpath(dirname(__FILE__));
include_once ($path . "/../lib/Database.php");
include_once ($path . "/../helpers/Format.php");

class Cart {
	public $db;
	public $fm;

	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	public function addCart($quantity, $productId) {
		$productId = $this->fm->validation($productId);
		$product_id = mysqli_real_escape_string($this->db->link, $productId);
		$quantity = $this->fm->validation($quantity);
		$quantity = mysqli_real_escape_string($this->db->link, $quantity);
		$session_id = session_id();

		$productDetails = "SELECT * FROM `product` WHERE `id` = '$productId'";
		$product_details = $this->db->select($productDetails)->fetch_assoc();

		$product_name = $product_details['name'];
		$price = $product_details['price'];
		$image = $product_details['image'];

		$checkProduct = "SELECT * FROM `cart` WHERE `product_id` = '$productId' AND `session_id` = '$session_id'";
		$check_product = $this->db->select($checkProduct);
		if ($check_product) {
			$cartMsg = '<div class="alert alert-warning mt-3">This product already added!</div>';
			return $cartMsg;
		} else {
			$query = "INSERT INTO `cart`(`session_id`, `product_id`, `product_name`, `price`, `quantity`, `image`) VALUES ('$session_id', '$product_id', '$product_name', '$price', '$quantity', '$image')";
			$result = $this->db->insert($query);
			if ($result) {
				$cartMsg = '<div class="alert alert-success mt-3">Product added successfully.</div>';
				return $cartMsg;
			} else {
				$cartMsg = '<div class="alert alert-warning mt-3">Something wrong!</div>';
				return $cartMsg;
			}
		}
	}
	public function viewCart() {
		$session_id = session_id();
		$query = "SELECT * FROM `cart` WHERE `session_id` = '$session_id'";
		$result = $this->db->select($query);
		return $result;
	}
	public function updateCart($quantity, $cartId) {
		$cartId = $this->fm->validation($cartId);
		$cartId = mysqli_real_escape_string($this->db->link, $cartId);
		$quantity = $this->fm->validation($quantity);
		$quantity = mysqli_real_escape_string($this->db->link, $quantity);
		$session_id = session_id();

		$query = "UPDATE `cart` SET `quantity` = '$quantity' WHERE `id` = '$cartId' AND `session_id` = '$session_id'";
		$result = $this->db->update($query);
		if ($result) {
			header("Location: cart.php");
		}
	}
	public function deleteCart($cartId) {
		$cartId = $this->fm->validation($cartId);
		$cartId = mysqli_real_escape_string($this->db->link, $cartId);
		$session_id = session_id();
		$query = "DELETE FROM `cart` WHERE `id` = '$cartId' AND `session_id` = '$session_id'";
		$result = $this->db->delete($query);
		if ($result) {
			header("Location: cart.php");
		}
	}
	public function deleteCartBySession() {
		$session_id = session_id();
		$query = "DELETE FROM `cart` WHERE `session_id` = '$session_id'";
		$result = $this->db->delete($query);
		return $result;
	}
	public function totalPrice() {
		$session_id = session_id();
		$query = "SELECT SUM(`price`*`quantity`) AS `total_price` FROM `cart` WHERE `session_id` = '$session_id'";
		$result = $this->db->select($query);
		return $result;
	}
	public function insertOrder() {
		$session_id = session_id();
		$order = "SELECT * FROM `cart` WHERE `session_id` = '$session_id'";
		$orderProduct = $this->db->select($order);
		if ($orderProduct) {
			while ($order_product = $orderProduct->fetch_assoc()) {
				$customer_id = Session::get('customerId');
				$product_id = $order_product['product_id'];
				$product_name = $order_product['product_name'];
				$quantity = $order_product['quantity'];
				$price = $order_product['price'];
				$image = $order_product['image'];
				$query = "INSERT INTO `order_table`(`customer_id`, `product_id`, `product_name`, `quantity`, `price`, `image`) VALUES ('$customer_id', '$product_id', '$product_name', '$quantity', '$price', '$image')";
				$result = $this->db->insert($query);
			}
			header("Location: success.php");
		}
	}
	public function payablePrice() {
		$customer_id = Session::get('customerId');
		$query = "SELECT sum(`price`*`quantity`) AS `payable_price` FROM `order_table` WHERE `customer_id` = '$customer_id' AND date = now()";
		$result = $this->db->select($query);
		return $result;
	}
	public function orderPrice() {
		$customer_id = Session::get('customerId');
		$query = "SELECT SUM(`price`) AS `order_price` FROM `order_table` WHERE `customer_id` = '$customer_id'";
		$result = $this->db->select($query);
		return $result;
	}
	public function viewAllOrder() {
		$query = "SELECT * FROM `order_table` ORDER BY `id` DESC";
		$result = $this->db->select($query);
		return $result;
	}
	public function viewOrder() {
		$customer_id = Session::get('customerId');
		$query = "SELECT * FROM `order_table` WHERE `customer_id` = '$customer_id' ORDER BY `id` DESC";
		$result = $this->db->select($query);
		return $result;
	}
	public function shiftStatus($id) {
		$query = "UPDATE `order_table` SET `status` = '1' WHERE `id` = '$id'";
		$result = $this->db->update($query);
		return $result;
	}
	public function confirmStatus($orderId) {
		$query = "UPDATE `order_table` SET `status` = '2' WHERE `id` = '$orderId'";
		$result = $this->db->update($query);
		return $result;
	}
	public function deleteOrder($id) {
		$id = $this->fm->validation($id);
		$id = mysqli_real_escape_string($this->db->link, $id);
		$query = "DELETE FROM `order_table` WHERE `id` = '$id'";
		$result = $this->db->delete($query);
		return $result;
	}
}

?>