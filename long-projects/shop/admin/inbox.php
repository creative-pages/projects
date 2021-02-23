<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 

if (isset($_GET['action']) && $_GET['action'] == 'shift') {
	$id = $_GET['shiftId'];
	$cart->shiftOrder($id);
	header("Location: inbox.php");
}
if (isset($_GET['action']) && $_GET['action'] == 'delete') {
	$id = $_GET['deleteId'];
	$cart->deleteOrder($id);
	header("Location: inbox.php");
}

?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Inbox</h2>
                <div class="block">        
                    <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>Customer Id</th>
							<th>Date & Time</th>
							<th>Product</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Address</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						$cart = new Cart();
						$getOrder = $cart->getAllOrder();
						if ($getOrder) {
							while ($row = $getOrder->fetch_assoc()) {
						?>
						<tr>
							<td><?= $row['customer_id']; ?></td>
							<td><?= $format->formatDate($row['date']); ?></td>
							<td><?= $row['product_name']; ?></td>
							<td><?= $row['quantity']; ?></td>
							<td><?= $row['price']; ?></td>
							<td><a href="customer.php?customerId=<?= $row['customer_id']; ?>">Address</a></td>
							<td>
								<?php 
								if ($row['status'] == '0') {
								?>
								<a href="?shiftId=<?= $row['id']; ?>&action=shift">Shift</a>
								<?php
								} elseif ($row['status'] == '1') {
									echo "Shifted";
								} elseif ($row['status'] == '2') {
								?>
								<a href="?deleteId=<?= $row['id']; ?>&action=delete">Remove</a>
								<?php
								}
								?>
							</td>
						</tr>
						<?php
							}
						}
						?>
					</tbody>
				</table>
               </div>
            </div>
        </div>
<script type="text/javascript">
    $(document).ready(function () {
        setupLeftMenu();

        $('.datatable').dataTable();
        setSidebarHeight();
    });
</script>
<?php include 'inc/footer.php';?>
