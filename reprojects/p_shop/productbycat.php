<?php include 'inc/header.php'; ?>
<?php 
if (!isset($_GET['categoryId']) || $_GET['categoryId'] == NULL || $_GET['categoryName'] == NULL) {
    header("Location: index.php");
} else {
    $categoryId = $_GET['categoryId'];
    $categoryName = $_GET['categoryName'];
    $productByCat = $product->productByCat($categoryId);
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
	      	if ($productByCat) {
	      		while ($row = $productByCat->fetch_assoc()) {
	      	?>
			<div class="grid_1_of_4 images_1_of_4">
				 <a href="preview.php?productId=<?= $row['id']; ?>"><img style="height: 200px;" src="admin/uploads/products/<?= $row['image']; ?>" alt="" /></a>
				 <h2><?= $row['name']; ?></h2>
				 <p><?= $format->textShorten($row['description'], 100); ?></p>
				 <p><span class="price"><?= $row['price']; ?> TK</span></p>  
			     <div class="button"><span><a href="preview.php?productId=<?= $row['id']; ?>" class="details">Details</a></span></div>
			</div>
	      	<?php
	      		}
	      	}
	      	?>
		</div>
    </div>
 </div><?php include 'inc/footer.php'; ?>