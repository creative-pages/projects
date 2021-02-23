<?php include "inc/header.php"; ?>
<?php
if (Session::get("login") == false) {
	header("Location: login.php");
}
$id = Session::get('customerId');
$customerProfile = $customer->customerProfile($id);
$customer_profile = $customerProfile->fetch_assoc();

?>
<div class="main">
	<div class="content">
		<div class="section group">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 offset-sm-3">
						<table class="table table-bordered">
							<?php 
							$payablePrice = $cart->payablePrice();
							if ($payablePrice) {
								$payable_price = $payablePrice->fetch_assoc();
								$vat = $payable_price['payable_price'] * 0.10;
								$grand_total = $payable_price['payable_price'] + $vat;
							}
							?>
							<tr>
								<td class="text-center" colspan="2"><h2 class="mb-0 text-success">Oder Successfull</h2></td>
							</tr>
							<tr>
								<td>Sub Total :</td>
								<td>TK. <?= isset($payable_price['payable_price']) ? $payable_price['payable_price'] : '0'; ?></td>
							</tr>
							<tr>
								<td>VAT : (10%)</td>
								<td>TK. <?= $vat; ?></td>
							</tr>
							<tr>
								<td>Grand Total :</td>
								<td>TK. <?= $grand_total; ?></td>
							</tr>
							<tr>
								<td colspan="2">
									Thanks for purchase. We will contact you ASAP with delivery details. Here is your order details.. <a href="order.php">Visit Here</a> .
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<?php include "inc/footer.php"; ?>