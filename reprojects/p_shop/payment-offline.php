<?php include "inc/header.php"; ?>
<?php
if (Session::get("login") == false) {
	header("Location: login.php");
}
$id = Session::get('customerId');
$customerProfile = $customer->customerProfile($id);
$customer_profile = $customerProfile->fetch_assoc();

if (isset($_GET['orderId']) && $_GET['orderId'] == 'order') {
	$cart->insertOrder();
	$cart->deleteCartBySession();
}
?>
<div class="main">
	<div class="content">
		<div class="section group">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 offset-sm-3">
						<table class="table table-striped table-bordered table-hover">
							<tr>
								<td>Name</td>
								<td><?= $customer_profile['name']; ?></td>
							</tr>
							<tr>
								<td>Address</td>
								<td><?= $customer_profile['address']; ?></td>
							</tr>
							<tr>
								<td>City</td>
								<td><?= $customer_profile['city']; ?></td>
							</tr>
							<tr>
								<td>Country</td>
								<td><?= $customer_profile['country']; ?></td>
							</tr>
							<tr>
								<td>Zip-Code</td>
								<td><?= $customer_profile['zip_code']; ?></td>
							</tr>
							<tr>
								<td>Phone</td>
								<td><?= $customer_profile['phone']; ?></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><?= $customer_profile['email']; ?></td>
							</tr>
							<tr>
								<td></td>
								<td>
									<a class="btn btn-primary" href="update-profile.php">Update Profile</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
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
						<td><?= $row['quantity']; ?></td>
						<td>Tk. <?= $row['price'] * $row['quantity']; ?></td>
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
			<div class="text-center">
				<a class="btn btn-primary btn-lg mt-3" href="payment-offline.php?orderId=order">Order Now</a>
			</div>
		</div>
	</div>
	<?php include "inc/footer.php"; ?>