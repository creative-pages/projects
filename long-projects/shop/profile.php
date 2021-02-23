<?php include "inc/header.php"; ?>
<?php 
if (Session::get("customerlogin") == false) {
	header("Location: login.php");
}
?>
 <div class="main">
    <div class="content">
    	<div class="section group">
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
									<a class="btn btn-primary" href="edit-profile.php">Edit Profile</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
 		</div>
 	</div>
<?php include "inc/footer.php"; ?>