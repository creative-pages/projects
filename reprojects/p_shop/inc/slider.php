<?php 
$topBrand = $brand->topBrand();
$top_brand = $topBrand->fetch_assoc();

$firstBrand = $brand->firstBrand($top_brand['first_brand']);
if ($firstBrand) {
	$first_brand = $firstBrand->fetch_assoc();
}
$secondBrand = $brand->secondBrand($top_brand['second_brand']);
if ($secondBrand) {
	$second_brand = $secondBrand->fetch_assoc();
}
$thirdBrand = $brand->thirdBrand($top_brand['third_brand']);
if ($thirdBrand) {
	$third_brand = $thirdBrand->fetch_assoc();
}
$fourthBrand = $brand->fourthBrand($top_brand['fourth_brand']);
if ($fourthBrand) {
	$fourth_brand = $fourthBrand->fetch_assoc();
}
?>
	<div class="header_bottom">
		<div class="header_bottom_left">
			<div class="section group">
				<div class="listview_1_of_2 images_1_of_2">
					<div class="listimg listimg_2_of_1">
						 <a href="preview.php?productId=<?= $first_brand['id']; ?>"> <img src="admin/uploads/products/<?= isset($first_brand['image']) ? $first_brand['image'] : ''; ?>" alt="" /></a>
					</div>
				    <div class="text list_2_of_1">
						<h2><?= isset($first_brand['name']) ? $first_brand['name'] : ''; ?></h2>
						<p><?= isset($first_brand['description']) ? $format->textShorten($first_brand['description'], 50) : ''; ?></p>
						<div class="button"><span><a href="preview.php?productId=<?= $first_brand['id']; ?>">Add to cart</a></span></div>
				   </div>
			   </div>
				<div class="listview_1_of_2 images_1_of_2">
					<div class="listimg listimg_2_of_1">
						 <a href="preview.php?productId=<?= $second_brand['id']; ?>"> <img src="admin/uploads/products/<?= isset($second_brand['image']) ? $second_brand['image'] : ''; ?>" alt="" /></a>
					</div>
				    <div class="text list_2_of_1">
						<h2><?= isset($second_brand['name']) ? $second_brand['name'] : ''; ?></h2>
						<p><?= isset($second_brand['description']) ? $format->textShorten($second_brand['description'], 50) : ''; ?></p>
						<div class="button"><span><a href="preview.php?productId=<?= $second_brand['id']; ?>">Add to cart</a></span></div>
				   </div>
			   </div>
				<div class="listview_1_of_2 images_1_of_2 ml-0">
					<div class="listimg listimg_2_of_1">
						 <a href="preview.php?productId=<?= $third_brand['id']; ?>"> <img src="admin/uploads/products/<?= isset($third_brand['image']) ? $third_brand['image'] : ''; ?>" alt="" /></a>
					</div>
				    <div class="text list_2_of_1">
						<h2><?= isset($third_brand['name']) ? $third_brand['name'] : ''; ?></h2>
						<p><?= isset($third_brand['description']) ? $format->textShorten($third_brand['description'], 50) : ''; ?></p>
						<div class="button"><span><a href="preview.php?productId=<?= $third_brand['id']; ?>">Add to cart</a></span></div>
				   </div>
			   </div>
				<div class="listview_1_of_2 images_1_of_2">
					<div class="listimg listimg_2_of_1">
						 <a href="preview.php?productId=<?= $fourth_brand['id']; ?>"> <img src="admin/uploads/products/<?= isset($fourth_brand['image']) ? $fourth_brand['image'] : ''; ?>" alt="" /></a>
					</div>
				    <div class="text list_2_of_1">
						<h2><?= isset($fourth_brand['name']) ? $fourth_brand['name'] : ''; ?></h2>
						<p><?= isset($fourth_brand['description']) ? $format->textShorten($fourth_brand['description'], 50) : ''; ?></p>
						<div class="button"><span><a href="preview.php?productId=<?= $fourth_brand['id']; ?>">Add to cart</a></span></div>
				   </div>
			   </div>
			</div>
		  <div class="clear"></div>
		</div>
			 <div class="header_bottom_right_images">
		   <!-- FlexSlider -->
             
			<section class="slider">
				  <div class="flexslider">
					<ul class="slides">
					<?php
					$viewSlider = $slider->viewSlider(); 
					if ($viewSlider) {
						while ($row = $viewSlider->fetch_assoc()) {
					?>
					<li><img src="admin/uploads/slider/<?= $row['image']; ?>" alt=""/></li>
					<?php
						}
					}
					?>
				    </ul>
				  </div>
	      </section>
<!-- FlexSlider -->
	    </div>
	  <div class="clear"></div>
  </div>	
