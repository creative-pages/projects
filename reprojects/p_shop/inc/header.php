<?php 
include_once "lib/Database.php";
include_once "helpers/Format.php";

spl_autoload_register(function($class_name) {
    include_once 'classes/' . $class_name . ".php";
});
$database = new Database();
$format = new Format();
$category = new Category();
$brand = new Brand();
$product = new Product();
$cart = new Cart();
$customer = new Customer();
$contact = new Contact();
$slider = new Slider();
$footerarea = new FooterArea();

// code for link active
$full_path = $_SERVER['SCRIPT_FILENAME'];
$path = basename($full_path);

?>
<?php
  header("Cache-Control: no-cache, must-revalidate");
  header("Pragma: no-cache"); 
  header("Expires: Sat, 26 Jul 1997 05:00:00 GMT"); 
  header("Cache-Control: max-age=2592000");
?>
<!DOCTYPE HTML>
<head>
<title>Store Website</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/menu.css" rel="stylesheet" type="text/css" media="all"/>
<script src="js/jquerymain.js"></script>
<script src="js/script.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="js/nav.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script> 
<script type="text/javascript" src="js/nav-hover.js"></script>
<link href='http://fonts.googleapis.com/css?family=Monda' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Doppio+One' rel='stylesheet' type='text/css'>
<script type="text/javascript">
  $(document).ready(function($){
    $('#dc_mega-menu-orange').dcMegaMenu({rowItems:'4',speed:'fast',effect:'fade'});
  });
</script>
</head>
<body>
  <div class="wrap">
		<div class="header_top">
			<div class="logo">
				<?php 
				$viewCopyContact = $footerarea->viewCopyContact();
				$viewCopy_contact = $viewCopyContact->fetch_assoc();
				?>
				<a href="index.php">
					<img src="admin/uploads/logo/<?= $viewCopy_contact['logo']; ?>" alt="" />
				</a>
			</div>
			  <div class="header_top_right">
			    <div class="search_box">
				    <form action="search.php" method="GET">
				    	<input type="text" name="keyword" placeholder="Search for Products">
				    	<input type="submit" name="search" value="SEARCH">
				    </form>
			    </div>
			    <div class="shopping_cart">
					<div class="cart">
						<a href="#" title="View my shopping cart" rel="nofollow">
								<span class="cart_title">Cart</span>
								<span class="no_product">
								<?php echo Session::get('grand_total') != NULL ? Session::get('grand_total') . ' Taka' : '(empty)' ?>
							</span>
							</a>
						</div>
			      </div>
			<?php 
			if (isset($_GET['customer_logout'])) {
				$cart->deleteCartBySession();
				$product->deleteCustomerCompare();
				Session::destroy();
			}
			?>
		   <div class="login">
		   	<?php 
		   	if (Session::get('login') == true) {
		   	?>
			<a href="?customer_logout">Logout</a>
		   	<?php
		   	} else {
		   	?>
			<a href="login.php">Login</a>
		   	<?php
		   	}
		   	?>
		   </div>
		 <div class="clear"></div>
	 </div>
	 <div class="clear"></div>
 </div>
<div class="menu">
	<ul id="dc_mega-menu-orange" class="dc_mm-orange">
	  <li class="<?= $path == 'index.php' ? 'link-active' : '' ?>"><a href="index.php">Home</a></li>
	  <li class="<?= $path == 'products.php' ? 'link-active' : '' ?>"><a href="products.php">Products</a> </li>
	  <li class="<?= $path == 'topbrands.php' ? 'link-active' : '' ?>"><a href="topbrands.php">Top Brands</a></li>
	  <?php 
	  $checkCart = $cart->viewCart();
	  if ($checkCart) {
	  ?>
	  <li class="<?= $path == 'cart.php' ? 'link-active' : '' ?>"><a href="cart.php">Cart</a></li>
	  <?php
	  }
	  ?>
	  <?php 
	  $checkCompare = $product->viewCompare();
	  if (Session::get('login') == true && $checkCompare) {
	  ?>
	  <li class="<?= $path == 'compare.php' ? 'link-active' : '' ?>"><a href="compare.php">Compare</a></li>
	  <?php
	  }
	  ?>
	  <?php 
	  $checkWishlist = $product->viewWishlist();
	  if (Session::get('login') == true && $checkWishlist) {
	  ?>
	  <li class="<?= $path == 'wishlist.php' ? 'link-active' : '' ?>"><a href="wishlist.php">Wishlist</a></li>
	  <?php
	  }
	  ?>
	  <?php 
	  if (Session::get('login') == true && $checkCart) {
	  ?>
	  <li class="<?= $path == 'payment.php' ? 'link-active' : '' ?>"><a href="payment.php">Payment</a></li>
	  <?php
	  }
	  ?>
	  <?php 
	  $checkOrder = $cart->viewOrder();
	  if (Session::get('login') == true && $checkOrder) {
	  ?>
	  <li class="<?= $path == 'order.php' ? 'link-active' : '' ?>"><a href="order.php">Order</a></li>
	  <?php
	  }
	  ?>
	  <?php 
	  if (Session::get('login') == true) {
	  ?>
	  <li class="<?= $path == 'profile.php' ? 'link-active' : '' ?>"><a href="profile.php">Profile</a></li>
	  <?php
	  }
	  ?>
	  <li class="<?= $path == 'contact.php' ? 'link-active' : '' ?>"><a href="contact.php">Contact</a> </li>
	  <div class="clear"></div>
	</ul>
</div>