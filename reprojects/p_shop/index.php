<?php include 'inc/header.php'; ?>
<?php include 'inc/slider.php'; ?>
 <div class="main">
    <div class="content">
    	<div class="content_top">
    		<div class="heading">
    		<h3>Feature Products</h3>
    		</div>
    		<div class="clear"></div>
    	</div>
	      <div class="section group">
				<?php 
				$featuredProduct = $product->featuredProduct();
				if ($featuredProduct) {
					while ($row = $featuredProduct->fetch_assoc()) {
				?>
				<div class="grid_1_of_4 images_1_of_4">
					<img style="height: 200px;" src="admin/uploads/products/<?= $row['image']; ?>" alt="" />
					 <h2><?= $row['name']; ?></h2>
					 <p><?= $format->textShorten($row['description'], 100); ?></p>
					 <p><span class="price"><?= $row['price']; ?> TK</span></p>  
				     <div class="button">
				     	<span><a href="preview.php?productId=<?= $row['id']; ?>" class="details">Details</a></span>
				 	</div>
				</div>
				<?php
					}
				}
				?>
				
			</div>
			<div class="content_bottom">
    		<div class="heading">
    		<h3>New Products</h3>
    		</div>
    		<div class="clear"></div>
    	</div>
			<div class="section group">
				<?php 
				$sl = 1;
				$newProduct = $product->newProduct();
				if ($newProduct) {
					while ($row = $newProduct->fetch_assoc()) {
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
				$sl++;
					}
				}
				?>
			</div>
    </div>
 </div>
<?php include 'inc/footer.php'; ?>