<?php include "inc/header.php"; ?>
<?php 
if (Session::get("customerlogin") == false) {
	header("Location: login.php");
}
$customer_id = Session::get("customerId");
$viewCompare = $product->viewCompare($customer_id);
?>
 <div class="main">
    <div class="content">
    	<div class="cartoption">		
			<div class="cartpage">
			    	<h2>Compare</h2>
						<table class="tblone">
							<tr>
								<th width="10%">Sl. No.</th>
								<th width="20%">Product Name</th>
								<th width="20%">Price</th>
								<th width="10%">Image</th>
								<th width="10%">Action</th>
							</tr>
							<?php 
							$sl = 1;
							if ($viewCompare) {
							while ($row = $viewCompare->fetch_assoc()) {
							?>
							<tr>
								<td><?= $sl; ?></td>
								<td><?= $row['product_name']; ?></td>
								<td><?= $row['price']; ?></td>
								<td><img src="admin/upload/<?= $row['image']; ?>" alt=""/></td>
								<td>
									<a href="details.php?productId=<?= $row['product_id']; ?>">View</a>
								</td>
							</tr>
							<?php
							$sl++;
							}
							}
							?>
						</table>
					</div>
					<div class="shopping">
						<div class="shopleft w-100">
							<a href="index.php"> <img src="images/shop.png" alt="" /></a>
						</div>
					</div>
    	</div>  	
       <div class="clear"></div>
    </div>
 </div>
<?php include "inc/footer.php"; ?>