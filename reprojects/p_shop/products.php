<?php include 'inc/header.php'; ?>
 <div class="main">
    <div class="content">
    	<?php 
    	$allBrand = $brand->allBrand();
    	while ($brands = $allBrand->fetch_assoc()) {
    	?>
    	<div class="content_top">
    		<div class="heading">
    		<h3>Latest from <?= $brands['name']; ?></h3>
    		</div>
    		<div class="clear"></div>
    	</div>
	    <div class="section group">
	    	<?php 
	    	$brandId = $brands['id'];
	    	$productByBrand = $product->productByBrand($brandId);
	    	if ($productByBrand) {
	    		while ($products = $productByBrand->fetch_assoc()) {
	    	?>
			<div class="grid_1_of_4 images_1_of_4">
				 <a href="preview.php?productId=<?= $products['id']; ?>"><img style="height: 200px;" src="admin/uploads/products/<?= $products['image']; ?>" alt="" /></a>
				 <h2><?= $products['name']; ?></h2>
				 <p><?= $format->textShorten($products['description'], 100); ?></p>
				 <p><span class="price"><?= $products['price']; ?> TK</span></p>
			     <div class="button"><span><a href="preview.php?productId=<?= $products['id']; ?>" class="details">Details</a></span></div>
			</div>
	    	<?php
	    		}
	    	} else {
	    		echo '<h2 class="p-3">No products available in this brand!</h2>';
	    	}
	    	?>
		</div>
		<?php
    	}
    	?>
    </div>
 </div><?php include 'inc/footer.php'; ?>