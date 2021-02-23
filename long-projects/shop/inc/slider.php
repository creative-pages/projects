	<div class="header_bottom">
		<div class="header_bottom_left">
			<div class="section group">
				<?php 
				$latestBrandOne = $product->latestBrandOne();
				$brandOne = $latestBrandOne->fetch_assoc();
				?>
				<div class="listview_1_of_2 images_1_of_2">
					<div class="listimg listimg_2_of_1">
						  <a href="details.php?productId=<?= $brandOne['id']; ?>"><img src="admin/upload/<?= $brandOne['image'];?>" alt="" / ></a>
					</div>
					<div class="text list_2_of_1">
						  <h2><?= $brandOne['brandName'];?></h2>
						  <p><?= $format->textShorten($brandOne['description'], 50);?></p>
						  <div class="button"><span><a href="details.php?productId=<?= $brandOne['id']; ?>">Add to cart</a></span></div>
					</div>
				</div>

				<?php 
				$latestBrandTwo = $product->latestBrandTwo();
				$brandTwo = $latestBrandTwo->fetch_assoc();
				?>
				<div class="listview_1_of_2 images_1_of_2">
					<div class="listimg listimg_2_of_1">
						  <a href="details.php?productId=<?= $brandTwo['id']; ?>"><img src="admin/upload/<?= $brandTwo['image'];?>" alt="" / ></a>
					</div>
					<div class="text list_2_of_1">
						  <h2><?= $brandTwo['brandName'];?></h2>
						  <p><?= $format->textShorten($brandTwo['description'], 50);?></p>
						  <div class="button"><span><a href="details.php?productId=<?= $brandTwo['id']; ?>">Add to cart</a></span></div>
					</div>
				</div>
			</div>
			<div class="section group">
				<?php 
				$latestBrandThree = $product->latestBrandThree();
				$brandThree = $latestBrandThree->fetch_assoc();
				?>
				<div class="listview_1_of_2 images_1_of_2">
					<div class="listimg listimg_2_of_1">
						  <a href="details.php?productId=<?= $brandThree['id']; ?>"><img src="admin/upload/<?= $brandThree['image'];?>" alt="" / ></a>
					</div>
					<div class="text list_2_of_1">
						  <h2><?= $brandThree['brandName'];?></h2>
						  <p><?= $format->textShorten($brandThree['description'], 50);?></p>
						  <div class="button"><span><a href="details.php?productId=<?= $brandThree['id']; ?>">Add to cart</a></span></div>
					</div>
				</div>

				<?php 
				$latestBrandFour = $product->latestBrandFour();
				$brandFour = $latestBrandFour->fetch_assoc();
				?>
				<div class="listview_1_of_2 images_1_of_2">
					<div class="listimg listimg_2_of_1">
						  <a href="details.php?productId=<?= $brandFour['id']; ?>"><img src="admin/upload/<?= $brandFour['image'];?>" alt="" / ></a>
					</div>
					<div class="text list_2_of_1">
						  <h2><?= $brandFour['brandName'];?></h2>
						  <p><?= $format->textShorten($brandFour['description'], 50);?></p>
						  <div class="button"><span><a href="details.php?productId=<?= $brandFour['id']; ?>">Add to cart</a></span></div>
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
						<li><img src="images/1.jpg" alt=""/></li>
						<li><img src="images/2.jpg" alt=""/></li>
						<li><img src="images/3.jpg" alt=""/></li>
						<li><img src="images/4.jpg" alt=""/></li>
				    </ul>
				  </div>
	      </section>
<!-- FlexSlider -->
	    </div>
	  <div class="clear"></div>
  </div>