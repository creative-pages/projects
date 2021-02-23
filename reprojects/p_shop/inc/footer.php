</div>
   <div class="footer">
   	  <div class="wrapper">	
	     <div class="section group">
				<div class="col_1_of_4 span_1_of_4">
						<h4>Information</h4>
						<ul>
							<li><a href="index.php">Home</a></li>
							<li><a href="contact.php"><span>Contact Us</span></a></li>
						</ul>
					</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>My account</h4>
						<ul><?php 
						   	if (Session::get('login') == true) {
						   	?>
							<li><a href="?customer_logout">Logout</a></li>
						   	<?php
						   	} else {
						   	?>
							<li><a href="login.php">Login</a></li>
						   	<?php
						   	}
						   	?>
							<?php 
							  $checkCart = $cart->viewCart();
							  if ($checkCart) {
							  ?>
							  <li><a href="cart.php">View Cart</a></li>
							  <?php
							  }
							 ?>
							  <?php 
							  $checkWishlist = $product->viewWishlist();
							  if (Session::get('login') == true && $checkWishlist) {
							  ?>
							  <li><a href="wishlist.php">My Wishlist</a></li>
							  <?php
							  }
							  ?>
							  <?php 
							  $checkOrder = $cart->viewOrder();
							  if (Session::get('login') == true && $checkOrder) {
							  ?>
							  <li><a href="order.php">Track My Order</a></li>
							  <?php
							  }
							  ?>
							<li><a href="contact.php">Help</a></li>
						</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Company Address</h4>
					<p style="color: #979797;line-height: 1.7;">
						<?php 
						$viewAddress = $footerarea->showAddress();
						$view_address = $viewAddress->fetch_assoc();
						echo $view_address['company_address'];
						?>
					</p>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Contact</h4>
						<ul>
							<?php 
							$viewCopyContact = $footerarea->viewCopyContact();
							$viewCopy_contact = $viewCopyContact->fetch_assoc();
							?>
							<li><span>+88-<?= $viewCopy_contact['number_one']; ?></span></li>
							<li><span>+88-<?= $viewCopy_contact['number_two']; ?></span></li>
						  </ul>
						<div class="social-icons">
							<h4>Follow Us</h4>
					   		  <ul>
					   		  	<?php 
					   		  	$viewSocial = $footerarea->viewSocial();
								$view_social = $viewSocial->fetch_assoc();
					   		  	?>
							      <li class="facebook"><a href="<?= $view_social['facebook']; ?>" target="_blank"> </a></li>
							      <li class="twitter"><a href="<?= $view_social['twitter']; ?>" target="_blank"> </a></li>
							      <li class="googleplus"><a href="<?= $view_social['google']; ?>" target="_blank"> </a></li>
							      <li class="contact"><a href="mailto:<?= $view_social['mail']; ?>"></a></li>
							      <div class="clear"></div>
						     </ul>
   	 					</div>
				</div>
			</div>
			<div class="copy_right">
				<p><?= $viewCopy_contact['copy_right']; ?></p>
		   </div>
     </div>
    </div>
    <script type="text/javascript">
		$(document).ready(function() {
			/*
			var defaults = {
	  			containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
	 		};
			*/
			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
	</script>
    <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
    <link href="css/flexslider.css" rel='stylesheet' type='text/css' />
	  <script defer src="js/jquery.flexslider.js"></script>
	  <script type="text/javascript">
		$(function(){
		  SyntaxHighlighter.all();
		});
		$(window).load(function(){
		  $('.flexslider').flexslider({
			animation: "slide",
			start: function(slider){
			  $('body').removeClass('loading');
			}
		  });
		});
	  </script>
</body>
</html>
