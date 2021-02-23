<?php include "inc/header.php"; ?>
<?php 

if (!isset($_GET['categoryId']) || $_GET['categoryId'] == NULL) {
	echo '<script>window.location = "404.php";</script>';
} else {
	$id = $_GET['categoryId'];
	$categoryName = $_GET['categoryName'];
	$productByCategory = $product->productByCategory($id); 
}

?>
 <div class="main">
    <div class="content">
    	<div class="content_top">
    		<div class="heading">
    		<h3>Latest from :- <?= $categoryName; ?></h3>
    		</div>
    		<div class="clear"></div>
    	</div>
	      <div class="section group">
			<?php 
			if ($productByCategory) {
				while ($byCategory = $productByCategory->fetch_assoc()) {
			?>
			<div class="grid_1_of_4 images_1_of_4">
				 <a href="details.php?productId=<?= $byCategory['id']; ?>"><img style="height: 200px;" src="admin/upload/<?= $byCategory['image']; ?>" alt="" /></a>
				 <h2><?= $byCategory['name']; ?></h2>
				 <p><?= $format->textShorten($byCategory['description'], 50); ?></p>
				 <p><span class="price"><?= $byCategory['price']; ?></span></p>
			     <div class="button"><span><a href="details.php?productId=<?= $byCategory['id']; ?>" class="details">Details</a></span></div>
			</div>
			<?php
				}
			} else {
				echo '<h2 style="padding-top: 50px; padding-bottom: 50px; text-align-center; font-size: 50px;">No Products available!</h2>';
			}
			?>
			</div>
    </div>
 </div>
<?php include "inc/footer.php"; ?>