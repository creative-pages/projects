<?php include 'inc/header.php'; ?>
<?php 
if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['search'])) {
	$keyword = $_GET['keyword'];
	$searchProduct = $product->searchProduct($keyword);
} else {
	header("Location: index.php");
}
?>
 <div class="main">
    <div class="content">
    	<div class="content_top">
    		<div class="heading">
    		<h3>You Search Products</h3>
    		</div>
    		<div class="clear"></div>
    	</div>
    	<div class="section group">
				<?php 
				if ($searchProduct) {
					while ($row = $searchProduct->fetch_assoc()) {
				?>
				<div class="grid_1_of_4 images_1_of_4 <?= $sl == '5' ? 'ml-0' : ''; ?>">
					<a href="preview.php?productId=<?= $row['id']; ?>">
						<img style="height: 200px;" src="admin/uploads/products/<?= $row['image']; ?>" alt="" />
					</a>
					 <h2><?= $row['name']; ?></h2>
					 <p><span class="price"><?= $row['price']; ?> TK</span></p>  
				     <div class="button">
				     	<span><a href="preview.php?productId=<?= $row['id']; ?>" class="details">Details</a></span>
				 	</div>
				</div>
				<?php
					}
				} else {
					echo '<h2 class="p-3">No Search Results found!</h2>';
				}
				?>
			</div>
    </div>
 </div><?php include 'inc/footer.php'; ?>