<?php include "inc/header.php"; ?>
<?php 

if (isset($_GET['productId'])) {
	$productId = $_GET['productId'];
	$signleProduct = $product->signleProduct($productId);
	$row = $signleProduct->fetch_assoc();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add_cart'])) {
	$quantity = $_POST['quantity'];
	$addCart = $cart->addCart($quantity, $productId);
}

?>
 <div class="main">
    <div class="content">
    	<div class="section group">
				<div class="cont-desc span_1_of_2">				
					<div class="grid images_3_of_2">
						<img src="admin/upload/<?= $row['image']; ?>" alt="" />
					</div>
				<div class="desc span_3_of_2">
					<h2><?= $row['name']; ?></h2>					
					<div class="price">
						<p>Price: <span>$<?= $row['price']; ?></span></p>
						<p>Category: <span><?= $row['categoryName']; ?></span></p>
						<p>Brand:<span><?= $row['brandName']; ?></span></p>
					</div>
				<div class="add-cart">
					<form action="" method="post">
						<input type="number" class="buyfield" name="quantity" value="1"/>
						<input type="submit" class="buysubmit" name="add_cart" value="Buy Now"/>
					</form>				
				</div>
				<?php 
				if (isset($_GET['compareId'])) {
					$customer_id = Session::get("customerId");
					$compareId = $_GET['compareId'];
					$compareMsg = $product->insertCompareProduct($compareId, $customer_id);
				}

				if (isset($_GET['wishlistId'])) {
					$customer_id = Session::get("customerId");
					$wishlistId = $_GET['wishlistId'];
					$wishlistMsg = $product->insertWishlistProduct($wishlistId, $customer_id);
				}
				
				?>
				<div class="add-cart">
					<?php 
					if (Session::get("customerlogin") == true) {
					?>
					<a class="btn btn-primary" href="?compareId=<?= $productId; ?>&productId=<?= $productId; ?>">Add To Compare</a>	
					<a class="btn btn-primary" href="?wishlistId=<?= $productId; ?>&productId=<?= $productId; ?>">Add To Wishlist</a>	
					<?php
					}
					?>
							
				</div>
			</div>
			<div class="product-desc">
			<div>
				<?php if (isset($compareMsg)) { echo $compareMsg; } ?>
				<?php if (isset($wishlistMsg)) { echo $wishlistMsg; } ?>
			</div>
			<h2>Product Details</h2>
			<p><?= $row['description']; ?></p>
	    </div>
				
	</div>
				<div class="rightsidebar span_3_of_1">
					<h2>CATEGORIES</h2>
					<ul>
						<?php 
						$showCategory = $category->showCategory();
						if ($showCategory !== NULL) {
						while ($allCategory = $showCategory->fetch_assoc()) {
						?>
						<li><a href="productbycat.php?categoryId=<?= $allCategory['categoryId']; ?>&categoryName=<?= $allCategory['categoryName']; ?>"><?= $allCategory['categoryName']; ?></a></li>
						<?php
						}
						}
						?>
				      
    				</ul>
 				</div>
 		</div>
 	</div>
<?php include "inc/footer.php"; ?>