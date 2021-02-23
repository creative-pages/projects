<?php include 'inc/header.php'; ?>
<?php 
if (isset($_GET['productId'])) {
    $productId = $_GET['productId'];
    $previewProduct = $product->previewProduct($productId);
    $preview_product = $previewProduct->fetch_assoc();
}
if ($_SERVER['REQUEST_METHOD'] == 'POST' || isset($_POST['add_cart'])) {
	$quantity = $_POST['quantity'];
	$add_cart = $cart->addCart($quantity, $productId);
}

if (isset($_GET['compareId'])) {
	$productId = $_GET['compareId'];
    $compareProduct = $product->compareProduct($productId);
}
if (isset($_GET['wishlistId'])) {
	$productId = $_GET['wishlistId'];
    $wishlistProduct = $product->wishlistProduct($productId);
}
?>
 <div class="main">
    <div class="content">
    	<div class="section group">
				<div class="cont-desc span_1_of_2">				
					<div class="grid images_3_of_2">
						<img src="admin/uploads/products/<?= $preview_product['image']; ?>" alt="" />
					</div>
				<div class="desc span_3_of_2">
					<h2><?= $preview_product['name']; ?></h2>				
					<div class="price">
						<p>Price: <span><?= $preview_product['price']; ?> Tk</span></p>
						<p>Category: <span><?= $preview_product['brand_name']; ?></span></p>
						<p>Brand:<span><?= $preview_product['category_name']; ?></span></p>
					</div>
				<div class="add-cart">
					<form action="" method="POST">
						<input type="number" class="buyfield" name="quantity" value="1"/>
						<input type="submit" class="buysubmit" name="add_cart" value="Buy Now"/>
					</form>
				</div>
				<div>
					<?php 
					if (Session::get('login') == true) {
					?>
					<a class="btn btn-info mt-3" href="preview.php?compareId=<?= $preview_product['id']; ?>&productId=<?= $preview_product['id']; ?>">Add To Compare</a>
					<a class="btn btn-success mt-3" href="preview.php?wishlistId=<?= $preview_product['id']; ?>&productId=<?= $preview_product['id']; ?>">Add To Wishlist</a>
					<?php
					}
					?>
				</div>
			</div>
			<div class="product-desc">
			<?php if (isset($compareProduct)) { echo $compareProduct; } ?>
			<?php if (isset($wishlistProduct)) { echo $wishlistProduct; } ?>
			<h2>Product Details</h2>
			<?php if (isset($add_cart)) { echo $add_cart; } ?>
			<div>
				<?= $preview_product['description']; ?>
			</div>
	    </div>
				
	</div>
				<div class="rightsidebar span_3_of_1">
					<h2>CATEGORIES</h2>
					<ul>
						<?php 
						$allCategory = $category->allCategory();
						if ($allCategory) {
							while ($row = $allCategory->fetch_assoc()) {
						?>
				      <li><a href="productbycat.php?categoryId=<?= $row['id']; ?>&categoryName=<?= $row['name']; ?>"><?= $row['name']; ?></a></li>
				      <?php
							}
						}
						?>
    				</ul>
    	
 				</div>
 		</div>
 	</div><?php include 'inc/footer.php'; ?>