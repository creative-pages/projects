<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php
if (!isset($_GET['customerId']) || $_GET['customerId'] == NULL) {
	header("Location: order.php");
} else {
	$id = $_GET['customerId'];
	$customerProfile = $customer->customerProfile($id);
	$customer_profile = $customerProfile->fetch_assoc();
}
?>
<div class="grid_10">
	<div class="box round first grid">
		<h2>Customer Profile</h2>
		<div class="block">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 offset-sm-3">
						<table class="table table-striped table-hover">
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
								<td>0<?= $customer_profile['phone']; ?></td>
							</tr>
							<tr>
								<td>email</td>
								<td><?= $customer_profile['email']; ?></td>
							</tr>
							<tr>
								<td></td>
								<td>
									<a class="btn btn-primary" href="order.php">Back To Order Page</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php include 'inc/footer.php';?>