<?php include "inc/header.php"; ?>
<?php 
if (Session::get("customerlogin") == true) {
	header("Location: order.php");
}
 if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['login'])) {
 	$loginMsg = $customer->login($_POST);
 }
 ?>
 <div class="main">
    <div class="content">
    	 <div class="login_panel">
        	<h3>Existing Customers</h3>
        	<p>Sign in with the form below.</p>
        	<form action="" method="POST">
                	<input name="email" placeholder="Enter your username" type="email">
                	<?php if (isset($customer->matchEmail)) { echo '<div class="alert alert-warning">' . $customer->matchEmail . '</div>'; } ?>
                    <input name="password" placeholder="Enter your password" type="password">
                    <?php if (isset($customer->matchPassword)) { echo '<div class="alert alert-warning">' . $customer->matchPassword . '</div>'; } ?>
                    <div class="buttons">
                    	<div>
                    		<button name="login" type="submit" class="grey">Sign In</button>
                    	</div>
                    	
                    </div>
                 </form>
            </div>
                 <?php if (isset($loginMsg)) { echo $loginMsg; } ?>
         <?php 
         if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['register'])) {
         	$registerMsg = $customer->registration($_POST);
         }
         ?>
    	<div class="register_account">
    		<h3>Register New Account</h3>
    		<form action="" method="POST">
		   			 <table>
		   				<tbody>
						<tr>
						<td>
							<div>
							<input type="text" placeholder="Name" name="name">
							<?php if (isset($customer->name)) { echo '<div class="alert alert-warning">' . $customer->name . '</div>'; } ?>
							</div>
							
							<div>
							   <input type="text" placeholder="City" name="city">
							   <?php if (isset($customer->city)) { echo '<div class="alert alert-warning">' . $customer->city . '</div>'; } ?>
							</div>
							
							<div>
								<input type="text" placeholder="Zip-Code" name="zip_code">
								<?php if (isset($customer->zip_code)) { echo '<div class="alert alert-warning">' . $customer->zip_code . '</div>'; } ?>
							</div>
							<div>
								<input type="email" placeholder="Email" name="email">
								<?php if (isset($customer->email)) { echo '<div class="alert alert-warning">' . $customer->email . '</div>'; } ?>
							</div>
		    			 </td>
		    			<td>
						<div>
							<input type="text" placeholder="Address" name="address">
							<?php if (isset($customer->address)) { echo '<div class="alert alert-warning">' . $customer->address . '</div>'; } ?>
						</div>
		    		<div>
						<input type="text" placeholder="Country" name="country">
						<?php if (isset($customer->country)) { echo '<div class="alert alert-warning">' . $customer->country . '</div>'; } ?>
				 </div>		        
	
		           <div>
		          <input type="text" placeholder="Phone" name="phone" pattern="01[3|4|5|6|7|8|9][0-9]{8}">
		          <?php if (isset($customer->phone)) { echo '<div class="alert alert-warning">' . $customer->phone . '</div>'; } ?>
		          </div>
				  
				  <div>
					<input type="password" placeholder="Password" name="password">
					<?php if (isset($customer->password)) { echo '<div class="alert alert-warning">' . $customer->password . '</div>'; } ?>
				</div>
		    	</td>
		    </tr> 
		    </tbody></table>
		   <div class="search"><div><button class="grey" name="register" type="submit">Create Account</button></div></div>
		    <div class="clear"></div>
		    </form>
		    <?php if (isset($registerMsg)) { echo $registerMsg; } ?>
    	</div>  	
       <div class="clear"></div>
    </div>
 </div>
<?php include "inc/footer.php"; ?>