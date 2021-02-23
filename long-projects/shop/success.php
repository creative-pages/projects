<?php include "inc/header.php"; ?>
<?php 
if (Session::get("customerlogin") == false) {
	header("Location: login.php");
}
?>
 <div class="main">
    <div class="content">
    	<div class="section group">
			<div class="payment w-50 text-center m-auto pt-3 border-success border">
				<h2>Order successfull.</h2>
				<table class="table table-bordered table-striped">
						<?php 
						$customerId = Session::get("customerId");
						$payableAmount = $cart->payableAmount($customerId);
						if ($payableAmount) {
							 $amount = $payableAmount->fetch_assoc();
								$sum = $amount['total'];
								$vat = $sum*0.05;
								$total = $sum+$vat;
						}
						?>
							<tr>
								<th>Sub Total : </th>
								<td>TK. <?= isset($sum) ? $sum : '0'; ?> </td>
							</tr>
							<tr>
								<th>VAT : (5%) </th>
								<td>TK. <?= isset($vat) ? $vat : '0'; ?></td>
							</tr>
							<tr>
								<th>Grand Total :</th>
								<td>TK. <?= isset($total) ? $total : '0'; ?></td>
							</tr>
					   </table>
					   <p>Thanks for purchase. We will contact you ASAP with delivery details. Here is your order details.. <a href="order.php">Visit Here.</a></p>
			</div>
 		</div>
 	</div>
<?php include "inc/footer.php"; ?>