 <?php include "inc/header.php"; ?>
<?php 
if (Session::get("customerlogin") == false) {
	header("Location: login.php");
}
$customerId = Session::get("customerId");
$productByCustomerId = $cart->productByCustomerId($customerId);

if (isset($_GET['action']) && $_GET['action'] == 'confirm') {
	$id = $_GET['confirmId'];
	$cart->confirmOrder($id);
	header("Location: order.php");
}

?>
<div class="main">
	<div class="content">
		<div class="cartpage">
			    	<h3>Your Order</h3>
						<table class="tblone">
							<tr>
								<th>Sl. No.</th>
								<th>Product Name</th>
								<th>Image</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Total Price</th>
								<th>Date</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
							<?php 
							$sl = 1;
							if ($productByCustomerId) {
							while ($row = $productByCustomerId->fetch_assoc()) {
							?>
							<tr>
								<td><?= $sl; ?></td>
								<td><?= $row['product_name']; ?></td>
								<td><img src="admin/upload/<?= $row['image']; ?>" alt=""/></td>
								<td><?= $row['price']; ?></td>
								<td><?= $row['quantity']; ?></td>
								<td><?= $row['price'] * $row['quantity']; ?></td>
								<td><?= $format->formatDate($row['date']); ?></td>
								<td>
									<?php if ($row['status'] == '1' || $row['status'] == '2') { echo "Shifted"; } else { echo "Pending"; } ?>
								</td>
								<td>
									<?php 
									if ($row['status'] == '0') { 
										echo "N/A"; 
									} elseif ($row['status'] == '1') { 
									?>
									<a href="?confirmId=<?= $row['id']; ?>&action=confirm">Confirm</a>
									<?php
									} elseif ($row['status'] == '2') {
										echo "Confirmed";
									}
									?>
								</td>
							</tr>
							<?php
							$sl++;
							}
							}
							?>
						</table>
						<table style="float:right;text-align:left;" width="40%">
						<?php 

						$sum = $cart->sumOrderPrice($customerId);
						if ($sum) {
							$totalPrice = $sum->fetch_assoc();
							$vat = ($totalPrice['total']*0.05);
							$finalPrice = ($totalPrice['total'] + $vat);
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
	</div>
</div>
<?php include "inc/footer.php"; ?>