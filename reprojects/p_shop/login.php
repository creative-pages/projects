<?php include 'inc/header.php'; ?>
<?php 
Session::checkLogin();
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add_customer'])) {
	$addCustomer = $customer->addCustomer($_POST);
}
?>
<div class="main">
	<div class="content">
		<div class="login_panel">
			<h3>Existing Customers</h3>
			<p>Sign in with the form below.</p>
			<?php 
			if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['customer_login'])) {
				$customerLogin = $customer->customerLogin($_POST);
			}
			?>
			<form action="" method="POST" id="member">
				<input name="email" type="email" placeholder="Enter email" class="form-control">
				<?php if (isset($customer->emailErr)) { echo $customer->emailErr; } ?>
				<input name="password" type="password" placeholder="Enter password" class="form-control">
				<?php if (isset($customer->passwordErr)) { echo $customer->passwordErr; } ?>
				<div class="buttons">
				<div><button type="submit" name="customer_login" class="grey">Sign In</button></div>
			</div>
			</form>
			<?php if (isset($customerLogin)) { echo $customerLogin; } ?>
		</div>
		<div class="register_account">
			<h3>Register New Account</h3>
			<form action="" method="POST">
				<?php if (isset($addCustomer)) { echo $addCustomer; } ?>
				<table>
					<tbody>
						<tr>
							<td>
								<input type="text" placeholder="Name" name="name" class="form-control" >
								<?php if (isset($customer->name)) { echo $customer->name; } ?>
							</td>
							<td>
								<input type="text" placeholder="Address" name="address" class="form-control" >
								<?php if (isset($customer->address)) { echo $customer->address; } ?>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" placeholder="City" name="city" class="form-control" >
								<?php if (isset($customer->city)) { echo $customer->city; } ?>
							</td>
							<td>
								<input type="text" placeholder="Country" name="country" class="form-control" >
								<?php if (isset($customer->country)) { echo $customer->country; } ?>
							</td>
						</tr>
						<tr>
							<td>
								<input type="number" placeholder="Zip-Code" name="zip_code" class="form-control" >
								<?php if (isset($customer->zip_code)) { echo $customer->zip_code; } ?>
							</td>
							<td>
								<input type="text" placeholder="Number" name="phone" class="form-control" pattern="01[3|4|5|6|7|8|9][0-9]{8}" >
								<?php if (isset($customer->phone)) { echo $customer->phone; } ?>
							</td>
						</tr>
						<tr>
							<td>
								<input type="email" placeholder="Email" name="email" class="form-control" >
								<?php if (isset($customer->email)) { echo $customer->email; } ?>
							</td>
							<td>
								<input type="password" placeholder="Password" name="password" class="form-control" >
								<?php if (isset($customer->password)) { echo $customer->password; } ?>
							</td>
						</tr>
					</tbody>
				</table>
					<div class="search">
						<div><button type="submit" name="add_customer" class="grey">Create Account</button></div>
					</div>
					<div class="clear"></div>
				</form>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<?php include 'inc/footer.php'; ?>