<?php include "inc/header.php"; ?>
<?php 
$sessionId = session_id();
$viewCart = $cart->viewCart($sessionId);
if ($viewCart == NULL) {
	header("Location: index.php");
}
if (isset($_GET['deleteCart'])) {
	$id = $_GET['deleteCart'];
	$cart->deleteCart($id);
}
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['updateCart'])) {
	$cart_id = $_POST['cart_id'];
	$quantity = $_POST['quantity'];
	if ($quantity <= 0) {
		$cart->deleteCart($cart_id);
	} else {
		$cart->updateCart($quantity, $cart_id);
		header("Location: cart.php");
	}
}
if (!isset($_GET['shoping'])) {
	echo "<meta http-equiv='refresh' content='0;URL=?shoping=live' />";
}
?>
 <div class="main">
    <div class="content">
    	<div class="cartoption">		
			<div class="cartpage">
			    	<h2>Your Cart</h2>
						<table class="tblone">
							<tr>
								<th width="10%">Sl. No.</th>
								<th width="20%">Product Name</th>
								<th width="20%">Image</th>
								<th width="10%">Price</th>
								<th width="25%">Quantity</th>
								<th width="20%">Total Price</th>
								<th width="10%">Action</th>
							</tr>
							<?php 
							$sl = 1;
							if ($viewCart) {
							while ($row = $viewCart->fetch_assoc()) {
							?>
							<tr>
								<td><?= $sl; ?></td>
								<td><?= $row['product_name']; ?></td>
								<td><img src="admin/upload/<?= $row['image']; ?>" alt=""/></td>
								<td><?= $row['price']; ?></td>
								<td>
									<form action="" method="post">
										<input type="hidden" name="cart_id" value="<?= $row['id']; ?>">
										<input type="number" name="quantity" value="<?= $row['quantity']; ?>"/>
										<input type="submit" name="updateCart" value="Update"/>
									</form>
								</td>
								<td><?= $row['price'] * $row['quantity']; ?></td>
								<td><a href="?deleteCart=<?= $row['id']; ?>" onclick="return confirm('Are you sure to remove?');">X</a></td>
							</tr>
							<?php
							$sl++;
							}
							}
							?>
						</table>
						<table style="float:right;text-align:left;" width="40%">
						<?php 
						$session_id = session_id();
						$sum = $cart->sumPrice($session_id);
						if ($sum) {
							$totalPrice = $sum->fetch_assoc();
							$vat = ($totalPrice['total']*0.05);
							$finalPrice = ($totalPrice['total'] + $vat);
							Session::set("sum", $finalPrice);
						}
						?>
							<tr>
								<th>Sub Total : </th>
								<td>TK. <?= isset($totalPrice['total']) ? $totalPrice['total'] : '0'; ?></td>
							</tr>
							<tr>
								<th>VAT : (5%) </th>
								<td>TK. <?= $vat; ?></td>
							</tr>
							<tr>
								<th>Grand Total :</th>
								<td>TK. <?= $finalPrice; ?></td>
							</tr>
					   </table>
					</div>
					<div class="shopping">
						<div class="shopleft">
							<a href="index.php"> <img src="images/shop.png" alt="" /></a>
						</div>
						<div class="shopright">
							<a href="payment.php"> <img src="images/check.png" alt="" /></a>
						</div>
					</div>
    	</div>  	
       <div class="clear"></div>
    </div>
 </div>
<?php include "inc/footer.php"; ?>