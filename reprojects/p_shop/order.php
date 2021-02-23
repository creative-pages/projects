<?php include 'inc/header.php'; ?>
<?php 
$viewOrder = $cart->viewOrder();
if ($viewOrder == NULL) {
	header("Location: index.php");
}

if (isset($_GET['confirmStarus'])) {
	$orderId = $_GET['confirmStarus'];
	$cart->confirmStatus($orderId);
	header("Location: order.php");
}

?>
 <div class="main">
    <div class="content">
    	<div class="cartoption">		
			<div class="cartpage">
			    	<h2>Your Order</h2>
						<table class="tblone">
							<tr>
								<th>Ser. No.</th>
								<th>Product Name</th>
								<th>Image</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Total Price</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
							<?php 
							$viewOrder = $cart->viewOrder();
							if ($viewOrder) {
								$sl = 1;
								while ($row = $viewOrder->fetch_assoc()) {
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
								<td>
									<?php 
									if ($row['status'] == 0) {
										echo "Pending";
									} else {
										echo "Shifted"; 
									}
									?>
								</td>
								<td>
									<?php 
									if ($row['status'] == 0) {
										echo "N/A";
									} elseif ($row['status'] == 1) {
									?>
									<a href="?confirmStarus=<?= $row['id']; ?>">Confirm</a>
									<?php
									} elseif ($row['status'] == 2) {
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
							$orderPrice = $cart->orderPrice();
							if ($orderPrice) {
								$order_price = $orderPrice->fetch_assoc();
								$vat = $order_price['order_price'] * 0.10;
								$grand_total = $order_price['order_price'] + $vat;
							}
							?>
							<tr>
								<th>Sub Total : </th>
								<td>TK. <?= isset($order_price['order_price']) ? $order_price['order_price'] : '0'; ?></td>
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
       <div class="clear"></div>
    </div>
 </div>
<?php include 'inc/footer.php'; ?>