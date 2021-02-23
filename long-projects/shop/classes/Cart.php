<?php 
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . '/../lib/Database.php');
include_once ($filepath . '/../healper/Format.php');

class Cart {
	private $db;
	private $fm;

	public function __construct() {
		$this->db = new Database();
		$this->fm = new Format();
	}
	public function addCart($quantity, $id) {
		$quantity = $this->fm->validation($quantity);
		$quantity = mysqli_real_escape_string($this->db->link, $quantity);
		$product_id = $this->fm->validation($id);
		$product_id = mysqli_real_escape_string($this->db->link, $product_id);
		$session_id = session_id();

		$productQuery = "SELECT * FROM `product` WHERE `id` = '$product_id'";
		$product_details = $this->db->select($productQuery)->fetch_assoc();
		$product_name = $product_details['name'];
		$price = $product_details['price'];
		$image = $product_details['image'];

		$productCheck = "SELECT * FROM `cart` WHERE `product_name` = '$product_name' AND `session_id` = '$session_id'";
		$checkResult = $this->db->select($productCheck);
		if ($checkResult) {
		?>
			<script type="text/javascript">
				alert("This product already added! Please select another product.");
				window.location = "index.php";
			</script>
		<?php
		} else {
		$query = "INSERT INTO `cart`(`session_id`, `product_id`, `product_name`, `price`, `quantity`, `image`) VALUES ('$session_id', '$product_id', '$product_name', '$price', '$quantity', '$image')";
			$result = $this->db->insert($query);
			if ($result) {
				header("Location: cart.php");
			} else {
			?>
			<script type="text/javascript">
				alert("Something is wrong!");
			</script>
			<?php
			}
		}
	}
	public function viewCart($sessionId) {
		$query = "SELECT * FROM `cart` WHERE `session_id` = '$sessionId'";
		$result = $this->db->select($query);
		return $result;
	}
	public function updateCart($quantity, $cart_id) {
		$quantity = $this->fm->validation($quantity);
		$quantity = mysqli_real_escape_string($this->db->link, $quantity);
		$query = "UPDATE `cart` SET `quantity` = '$quantity' WHERE `id` = '$cart_id'";
		$result = $this->db->update($query);
		if ($result) {
			header("Location: cart.php");
		} else {
		?>
		<script type="text/javascript">
			alert("Something is wrong!");
		</script>
		<?php
		}
	}
	public function deleteCart($id) {
		$query = "DELETE FROM `cart` WHERE `id` = '$id'";
		$result = $this->db->delete($query);
		if ($result) {
			header("Location: cart.php");
		} else {
		?>
		<script type="text/javascript">
			alert("Something is wrong!");
		</script>
		<?php
		}
	} 
	public function sumPrice($session_id) {
		$query = "SELECT SUM(`price`*`quantity`) AS `total` FROM `cart` WHERE `session_id` = '$session_id'";
		$result = $this->db->select($query);
		return $result;
	}
	public function deleteCustomerCart($id) {
		$query = "DELETE FROM `cart` WHERE `session_id` = '$id'";
		$result = $this->db->delete($query);
		return $result;
	}
	public function productByCustomerId($customerId) {
		$query = "SELECT * FROM `order_table` WHERE `customer_id` = '$customerId'";
		$result = $this->db->select($query);
		return $result;
	}
	public function orderProduct($customer_id) {
		$session_id = session_id();
		$query = "SELECT * FROM `cart` WHERE `session_id` = '$session_id'";
		$allProduct = $this->db->select($query);
		if ($allProduct) {
			while ($result = $allProduct->fetch_assoc()) {
				$product_id = $result['product_id'];
				$product_name = $result['product_name'];
				$product_name = $result['product_name'];
				$quantity = $result['quantity'];
				$price = $result['price'];
				$price = $quantity*$price;
				$image = $result['image'];
				$insertQuery = "INSERT INTO `order_table`(`customer_id`, `product_id`, `product_name`, `quantity`, `price`, `image`) VALUES ('$customer_id', '$product_id', '$product_name', '$quantity', '$price', '$image')";
				$insertRow = $this->db->insert($insertQuery);

			}
		}
	}
	public function payableAmount($customerId) {
		$query = "SELECT sum(`price`) AS total FROM `order_table` WHERE `customer_id` = '$customerId' AND date = now()";
		$result = $this->db->select($query);
		return $result;
	}
	public function sumOrderPrice($customerId) {
		$query = "SELECT SUM(`price`*`quantity`) AS `total` FROM `order_table` WHERE `customer_id` = '$customerId'";
		$result = $this->db->select($query);
		return $result;
	}
	public function getAllOrder() {
		$query = "SELECT * FROM `order_table` ORDER BY `date`";
		$result = $this->db->select($query);
		return $result;
	}
	public function shiftOrder($id) {
		$query = "UPDATE `order_table` SET `status`= '1' WHERE `id` = '$id'";
		$result = $this->db->update($query);
		return $result;
	}
	public function confirmOrder($id) {
		$query = "UPDATE `order_table` SET `status`= '2' WHERE `id` = '$id'";
		$result = $this->db->update($query);
		return $result;
	}
	public function deleteOrder($id) {
		$query = "DELETE FROM `order_table` WHERE `id` = '$id'";
		$result = $this->db->delete($query);
		return $result;
	}
}

?>