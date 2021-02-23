<?php include 'inc/header.php'; ?>
<?php 
$viewCart = $cart->viewCart();
if ($viewCart == NULL) {
	header("Location: index.php");
}
if ($_SERVER['REQUEST_METHOD'] == 'POST' || isset($_POST['update_quantity'])) {
	$quantity = $_POST['quantity'];
	$cartId = $_POST['cartId'];
	if ($quantity > 0) {
		$cart->updateCart($quantity, $cartId);
	}
}

if (isset($_GET['cartId'])) {
	$cartId = $_GET['cartId'];
	$cart->deleteCart($cartId);
}

?>
 <div class="main">
    <div class="content">
    	<div class="cartoption">		
			<div class="cartpage">
			    	<h2>Your Cart</h2>
						<table class="tblone">
							<tr>
								<th width="20%">Ser. No.</th>
								<th width="20%">Product Name</th>
								<th width="10%">Image</th>
								<th width="15%">Price</th>
								<th width="25%">Quantity</th>
								<th width="20%">Total Price</th>
								<th width="10%">Action</th>
							</tr>
							<?php 
							$viewCart = $cart->viewCart();
							if ($viewCart) {
								$sl = 1;
								while ($row = $viewCart->fetch_assoc()) {
							?>
							<tr>
								<td><?= $sl; ?></td>
								<td><?= $row['product_name']; ?></td>
								<td>
									<img src="admin/uploads/products/<?= $row['image']; ?>" alt=""/>
								</td>
								<td>Tk. <?= $row['price']; ?></td>
								<td>
									<form action="" method="post">
										<input type="hidden" name="cartId" value="<?= $row['id']; ?>">
										<input type="number" name="quantity" value="<?= $row['quantity']; ?>"/>
										<input type="submit" name="update_quantity" value="Update"/>
									</form>
								</td>
								<td>Tk. <?= $row['price'] * $row['quantity']; ?></td>
								<td><a href="cart.php?cartId=<?= $row['id']; ?>" onclick="return confirm('Are you sure to remove?');">X</a></td>
							</tr>
							<?php
							$sl++;
								}
							}
							?>
						</table>
						<table style="float:right;text-align:left;" width="40%">
							<?php 
							$totalPrice = $cart->totalPrice();
							if ($totalPrice) {
								$total_price = $totalPrice->fetch_assoc();
								$vat = $total_price['total_price'] * 0.10;
								$grand_total = $total_price['total_price'] + $vat;
								Session::set('grand_total', $grand_total);
							}
							?>
							<tr>
								<th>Sub Total : </th>
								<td>TK. <?= isset($total_price['total_price']) ? $total_price['total_price'] : '0'; ?></td>
							</tr>
							<tr>
								<th>VAT : (10%)</th>
								<td>TK. <?= $vat; ?></td>
							</tr>
							<tr>
								<th>Grand Total :</th>
								<td>TK. <?= $grand_total; ?></td>
							</tr>
					   </table>
					</div>
					<div class="shopping">
						<div class="shopleft">
							<a href="index.php"> <img src="images/shop.png" alt="" /></a>
						</div>
						<div class="shopright">
							<?php 
							if (Session::get('login') == true) {
							?>
							<a href="payment.php"> <img src="images/check.png" alt="" /></a>
							<?php
							} else {
							?>
							<a href="login.php"> <img src="images/check.png" alt="" /></a>
							<?php
							}
							?>
						</div>
					</div>
    	</div>  	
       <div class="clear"></div>
    </div>
 </div>
<?php include 'inc/footer.php'; ?>