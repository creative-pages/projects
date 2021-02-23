<?php include "inc/header.php"; ?>
<?php 
if (Session::get("login") == false) {
	header("Location: login.php");
}
if ($checkCart == NULL) {
	header("Location: index.php");
}
?>
 <div class="main">
    <div class="content">
    	<div class="section group">
			<div class="payment w-50 text-center m-auto py-5 border-success border">
				<h2 class="text-capitalize border-bottom pb-3 mb-5 border-primary">Choose your payment option.</h2>
				<a class="btn btn-primary btn-lg rounded-pill" href="payment-offline.php">Offline</a>
				<a class="btn btn-success btn-lg rounded-pill" href="payment-online.php">Online</a>
				<br>
				<a class="btn btn-info btn-sm mt-5" href="cart.php">Back To Cart</a>
			</div>
 		</div>
 	</div>
<?php include "inc/footer.php"; ?>