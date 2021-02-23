<?php include 'inc/header.php'; ?>
<?php 
$topBrand = $brand->topBrand();
$top_brand = $topBrand->fetch_assoc();

$f_b = $brand->singleBrand($top_brand['first_brand']);
if ($f_b) {
	$f_br = $f_b->fetch_assoc();
}
$t_b = $brand->singleBrand($top_brand['second_brand']);
if ($t_b) {
	$t_br = $t_b->fetch_assoc();
}
$th_b = $brand->singleBrand($top_brand['third_brand']);
if ($th_b) {
	$th_br = $th_b->fetch_assoc();
}
$fr_b = $brand->singleBrand($top_brand['fourth_brand']);
if ($fr_b) {
	$fr_br = $fr_b->fetch_assoc();
}

$secondBrand = $product->secondBrand($top_brand['second_brand']);
if ($secondBrand) {
	$second_brand = $secondBrand->fetch_assoc();
}
$thirdBrand = $product->thirdBrand($top_brand['third_brand']);
if ($thirdBrand) {
	$third_brand = $thirdBrand->fetch_assoc();
}
$fourthBrand = $product->fourthBrand($top_brand['fourth_brand']);
if ($fourthBrand) {
	$fourth_brand = $fourthBrand->fetch_assoc();
}
?>
 <div class="main">
    <div class="content">
    	<div class="content_top">
    		<div class="heading">
    		<h3>LATEST FROM <?= $f_br['name']; ?></h3>
    		</div>
    		<div class="clear"></div>
    	</div>
	      <div class="section group">
	      	<?php 
	      	$firstBrand = $product->firstBrand($top_brand['first_brand']);
			if ($firstBrand) {
				while ($first_brand = $firstBrand->fetch_assoc()) {
			?>
			<div class="grid_1_of_4 images_1_of_4">
				 <a href="preview.php?productId=<?= $first_brand['id']; ?>"><img class="h-200" src="admin/uploads/products/<?= $first_brand['image']; ?>" alt="" /></a>
				 <h2><?= $first_brand['name']; ?></h2>
				 <p><span class="price"><?= $first_brand['price']; ?> Tk</span></p>
			     <div class="button"><span><a href="preview.php?productId=<?= $first_brand['id']; ?>" class="details">Details</a></span></div>
			</div>
			<?php
				}
			}
	      	?>
			</div>
		<div class="content_bottom">
    		<div class="heading">
    		<h3>LATEST FROM <?= $t_br['name']; ?></h3>
    		</div>
    		<div class="clear"></div>
    	</div>
			<div class="section group">
				<?php 
	      	$secondBrand = $product->secondBrand($top_brand['second_brand']);
			if ($secondBrand) {
				while ($second_brand = $secondBrand->fetch_assoc()) {
			?>
			<div class="grid_1_of_4 images_1_of_4">
				 <a href="preview.php?productId=<?= $second_brand['id']; ?>"><img class="h-200" src="admin/uploads/products/<?= $second_brand['image']; ?>" alt="" /></a>
				 <h2><?= $second_brand['name']; ?></h2>
				 <p><span class="price"><?= $second_brand['price']; ?> Tk</span></p>
			     <div class="button"><span><a href="preview.php?productId=<?= $second_brand['id']; ?>" class="details">Details</a></span></div>
			</div>
			<?php
				}
			}
	      	?>
			</div>
		<div class="content_bottom">
    		<div class="heading">
    		<h3>LATEST FROM <?= $th_br['name']; ?></h3>
    		</div>
    		<div class="clear"></div>
    	</div>
			<div class="section group">
				<?php 
	      	$thirdBrand = $product->thirdBrand($top_brand['third_brand']);
			if ($thirdBrand) {
				while ($third_brand = $thirdBrand->fetch_assoc()) {
			?>
			<div class="grid_1_of_4 images_1_of_4">
				 <a href="preview.php?productId=<?= $third_brand['id']; ?>"><img class="h-200" src="admin/uploads/products/<?= $third_brand['image']; ?>" alt="" /></a>
				 <h2><?= $third_brand['name']; ?></h2>
				 <p><span class="price"><?= $third_brand['price']; ?> Tk</span></p>
			     <div class="button"><span><a href="preview.php?productId=<?= $third_brand['id']; ?>" class="details">Details</a></span></div>
			</div>
			<?php
				}
			}
	      	?>
			</div>
		<div class="content_bottom">
    		<div class="heading">
    		<h3>LATEST FROM <?= $fr_br['name']; ?></h3>
    		</div>
    		<div class="clear"></div>
    	</div>
			<div class="section group">
				<?php 
	      	$fourthBrand = $product->fourthBrand($top_brand['fourth_brand']);
			if ($fourthBrand) {
				while ($fourth_brand = $fourthBrand->fetch_assoc()) {
			?>
			<div class="grid_1_of_4 images_1_of_4">
				 <a href="preview.php?productId=<?= $fourth_brand['id']; ?>"><img class="h-200" src="admin/uploads/products/<?= $fourth_brand['image']; ?>" alt="" /></a>
				 <h2><?= $fourth_brand['name']; ?></h2>
				 <p><span class="price"><?= $fourth_brand['price']; ?> Tk</span></p>
			     <div class="button"><span><a href="preview.php?productId=<?= $fourth_brand['id']; ?>" class="details">Details</a></span></div>
			</div>
			<?php
				}
			}
	      	?>
			</div>
    </div>
 </div><?php include 'inc/footer.php'; ?>