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
 		</div>
 	</div>
<?php include "inc/footer.php"; ?>