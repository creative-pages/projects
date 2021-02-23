<?php include "inc/header.php"; ?>
<?php 
if (Session::get("login") == false) {
	header("Location: login.php");
}
$id = Session::get('customerId');
$customerProfile = $customer->customerProfile($id);
$customer_profile = $customerProfile->fetch_assoc();
?>
<?php 
Session::checkSession();
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_customer'])) {
	$update_customer = $customer->updateCustomer($_POST);
}
?>
 <div class="main">
    <div class="content">
    	<div class="section group">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 offset-sm-3">
						<form action="" method="POST">
							<?php if (isset($update_customer)) { echo $update_customer; } ?>
							<table class="table table-borderless">
							<tr>
								<td class="pt-4">Name</td>
								<td>
									<input class="form-control" type="text" name="name" placeholder="Enter Name" value="<?= $customer_profile['name']; ?>" >
									<?php if (isset($customer->name)) { echo $customer->name; } ?>
								</td>
							</tr>
							<tr>
								<td class="pt-4">Address</td>
								<td>
									<input class="form-control" type="text" name="address" placeholder="Enter Name" value="<?= $customer_profile['address']; ?>" >
									<?php if (isset($customer->address)) { echo $customer->address; } ?>
								</td>
							</tr>
							<tr>
								<td class="pt-4">City</td>
								<td>
									<input class="form-control" type="text" name="city" placeholder="Enter Name" value="<?= $customer_profile['city']; ?>" >
									<?php if (isset($customer->city)) { echo $customer->city; } ?>
								</td>
							</tr>
							<tr>
								<td class="pt-4">Country</td>
								<td>
									<input class="form-control" type="text" name="country" placeholder="Enter Name" value="<?= $customer_profile['country']; ?>" >
									<?php if (isset($customer->country)) { echo $customer->country; } ?>
								</td>
							</tr>
							<tr>
								<td class="pt-4">Zip-Code</td>
								<td>
									<input class="form-control" type="number" name="zip_code" placeholder="Enter Name" value="<?= $customer_profile['zip_code']; ?>" >
									<?php if (isset($customer->zip_code)) { echo $customer->zip_code; } ?>
								</td>
							</tr>
							<tr>
								<td class="pt-4">Phone</td>
								<td>
									<input class="form-control" type="text" name="phone" placeholder="Enter Name" pattern="01[3|4|5|6|7|8|9][0-9]{8}" value="<?= $customer_profile['phone']; ?>" >
									<?php if (isset($customer->phone)) { echo $customer->phone; } ?>
								</td>
							</tr>
							<tr>
								<td class="pt-4">Email</td>
								<td>
									<input class="form-control" type="email" name="email" placeholder="Enter Name" value="<?= $customer_profile['email']; ?>" >
									<?php if (isset($customer->email)) { echo $customer->email; } ?>
								</td>
							</tr>
							<tr>
								<td class="pt-4">Password</td>
								<td>
									<input class="form-control" type="password" name="password" placeholder="Enter Name" value="<?= $customer_profile['password']; ?>" >
									<?php if (isset($customer->password)) { echo $customer->password; } ?>
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<input class="btn btn-info" type="submit" name="update_customer" value="Update">
								</td>
							</tr>
						</table>
						</form>
					</div>
				</div>
			</div>
 		</div>
 	</div>
<?php include "inc/footer.php"; ?>