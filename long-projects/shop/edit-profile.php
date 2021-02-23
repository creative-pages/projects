<?php include "inc/header.php"; ?>
<?php 
if (Session::get("customerlogin") == false) {
	header("Location: login.php");
}
?>
<style>
	.register_account {
		width: 100%;
	}
	.register_account form input[type="text"], .register_account form input[type="email"], .register_account form input[type="password"], .register_account form select {
		width: 480px;
	}
</style>
 <div class="main">
    <div class="content">
         <?php 
         if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update'])) {
         	$updateProfile = $customer->updateProfile($_POST);
         }
         $id = Session::get("customerId");
		$customerProfile = $customer->customerProfile($id);
		$customerPro = $customerProfile->fetch_assoc();
         ?>
    	<div class="register_account">
    		<h3>Edit Profile</h3>
    		<form action="" method="POST">
		   			 <table>
		   				<tbody>
						<tr>
						<td>
							<div>
							<input type="text" placeholder="Name" name="name" value="<?= $customerPro['name']; ?>">
							<input type="hidden" name="customer_id" value="<?= $customerPro['id']; ?>">
							<?php if (isset($customer->name)) { echo '<div class="alert alert-warning">' . $customer->name . '</div>'; } ?>
							</div>
							
							<div>
							   <input type="text" placeholder="City" name="city" value="<?= $customerPro['city']; ?>">
							   <?php if (isset($customer->city)) { echo '<div class="alert alert-warning">' . $customer->city . '</div>'; } ?>
							</div>
							
							<div>
								<input type="text" placeholder="Zip-Code" name="zip_code" value="<?= $customerPro['zip_code']; ?>">
								<?php if (isset($customer->zip_code)) { echo '<div class="alert alert-warning">' . $customer->zip_code . '</div>'; } ?>
							</div>
							<div>
								<input type="email" placeholder="Email" name="email" value="<?= $customerPro['email']; ?>">
								<?php if (isset($customer->email)) { echo '<div class="alert alert-warning">' . $customer->email . '</div>'; } ?>
							</div>
		    			 </td>
		    			<td>
						<div>
							<input type="text" placeholder="Address" name="address" value="<?= $customerPro['address']; ?>">
							<?php if (isset($customer->address)) { echo '<div class="alert alert-warning">' . $customer->address . '</div>'; } ?>
						</div>
		    		<div>
						<input type="text" placeholder="Country" name="country" value="<?= $customerPro['country']; ?>">
						<?php if (isset($customer->country)) { echo '<div class="alert alert-warning">' . $customer->country . '</div>'; } ?>
				 </div>		        
	
		           <div>
		          <input type="text" placeholder="Phone" name="phone" pattern="01[3|4|5|6|7|8|9][0-9]{8}" value="<?= $customerPro['phone']; ?>">
		          <?php if (isset($customer->phone)) { echo '<div class="alert alert-warning">' . $customer->phone . '</div>'; } ?>
		          </div>
				  
				  <div>
					<input type="password" placeholder="Password" name="password">
					<?php if (isset($customer->password)) { echo '<div class="alert alert-warning">' . $customer->password . '</div>'; } ?>
				</div>
		    	</td>
		    </tr> 
		    </tbody></table>
		   <div class="search"><div><button class="grey" name="update" type="submit">Update Account</button></div></div>
		    <div class="clear"></div>
		    </form>
		    <?php if (isset($updateProfile)) { echo $updateProfile; } ?>
    	</div>  	
       <div class="clear"></div>
 	</div>
<?php include "inc/footer.php"; ?>