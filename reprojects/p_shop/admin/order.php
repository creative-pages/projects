<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 
if (isset($_GET['shiftOrder'])) {
	$id = $_GET['shiftOrder'];
	$cart->shiftStatus($id);
	header("Location: order.php");
}
if (isset($_GET['deleteOrder'])) {
	$id = $_GET['deleteOrder'];
	$cart->deleteOrder($id);
	header("Location: order.php");
}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Inbox</h2>
                <div class="block">        
                    <table class="data display datatable table-bordered" id="example">
					<thead>
						<tr>
							<th>Serial No.</th>
							<th>Product Name</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Image</th>
							<th>Address</th>
							<th>Date</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						$sl = 1;
						$viewAllOrder = $cart->viewAllOrder();
						if ($viewAllOrder) {
							while ($viewAll_order = $viewAllOrder->fetch_assoc()) {
						?>
						<tr>
							<td><?= $sl; ?></td>
							<td><?= $viewAll_order['product_name']; ?></td>
							<td><?= $viewAll_order['quantity']; ?></td>
							<td><?= $viewAll_order['quantity']*$viewAll_order['price']; ?></td>
							<td>
								<img style="width: 100px;" src="uploads/products/<?= $viewAll_order['image']; ?>" alt="">
							</td>
							<td>
								<a href="customer-details.php?customerId=<?= $viewAll_order['customer_id']; ?>">Address</a>
							</td>
							<td><?= $format->dateFormat($viewAll_order['date']); ?></td>
							<td>
								<?php 
								if ($viewAll_order['status'] == 0) {
								?>
								<a href="order.php?shiftOrder=<?= $viewAll_order['id']; ?>">Shift</a>
								<?php
								} elseif ($viewAll_order['status'] == 1) {
									echo "Shifted";
								} else {
								?>
								<a href="order.php?deleteOrder=<?= $viewAll_order['id']; ?>" onclick="return confirm('Are you sure to delete?');">Remove</a>
								<?php
								}
								?>
							</td>
						</tr>
						<?php
						$sl++;
							}
						}
						?>
					</tbody>
				</table>
               </div>
            </div>
        </div>
<?php include 'inc/footer.php';?>
