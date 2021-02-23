<?php include "inc/header.php"; ?>
<?php 
if (Session::get("customerlogin") == false) {
	header("Location: login.php");
}
?>
<?php 
if (isset($_GET['orderId']) && $_GET['orderId'] == "order") {
	$customerId = Session::get("customerId");
	$isertOrder = $cart->orderProduct($customerId);
	$session_id = session_id();
	$deleteCustomerCart = $cart->deleteCustomerCart($session_id);
	header("Location: success.php");
}
?>
 <div class="main">
    <div class="content">
    	<div class="section group">
			<div class="offline">
				<div class="container">
				<div class="row">
					<div class="col-sm-6 offset-sm-3">
						<?php 
						$id = Session::get("customerId");
						$customerProfile = $customer->customerProfile($id);
						$customerPro = $customerProfile->fetch_assoc();
						?>
						<table class="table table-bordered table-hover table-striped">
							<tr>
								<td>Name</td>
								<td><?= $customerPro['name']; ?></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><?= $customerPro['email']; ?></td>
							</tr>
							<tr>
								<td>Address</td>
								<td><?= $customerPro['address']; ?></td>
							</tr>
							<tr>
								<td>City</td>
								<td><?= $customerPro['city']; ?></td>
							</tr>
							<tr>
								<td>Zip Code</td>
								<td><?= $customerPro['zip_code']; ?></td>
							</tr>
							<tr>
								<td>Country</td>
								<td><?= $customerPro['country']; ?></td>
							</tr>
							<tr>
								<td>Phone</td>
								<td><?= $customerPro['phone']; ?></td>
							</tr>
							<tr>
								<td></td>
								<td>
									<a class="btn btn-primary" href="edit-profile.php">Update Profile</a>
								</td>
							</tr>
						</table>
					</div>
					<div class="col-sm-12">
						<h2>Your Cart</h2>
						<table class="tblone">
							<tr>
								<th width="10%">Sl. No.</th>
								<th width="20%">Product Name</th>
								<th width="20%">Image</th>
								<th width="10%">Price</th>
								<th width="25%">Quantity</th>
								<th width="20%">Total Price</th>
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
								<td><?= $row['quantity']; ?></td>
								<td><?= $row['price'] * $row['quantity']; ?></td>
							</tr>
							<?php
							$sl++;
							}
							}
							?>
						</table>
						<hr class="bg-primary">
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
					   <div class="clearfix"></div>
					   <a style="margin-right: 295px;" class="btn btn-primary float-right mt-2" href="?orderId=order">Order Now</a>
					</div>
				</div>
			</div>
			</div>
 		</div>
 	</div>
<?php include "inc/footer.php"; ?>