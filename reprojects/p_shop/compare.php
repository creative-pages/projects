<?php include 'inc/header.php'; ?>
<?php 
$viewCompare = $product->viewCompare();
if ($viewCompare == NULL) {
	header("Location: index.php");
}

if (isset($_GET['deleteCompare'])) {
	$compareId = $_GET['deleteCompare'];
	$product->deleteCompare($compareId);
}

?>
 <div class="main">
    <div class="content">
    	<div class="cartoption">		
			<div class="cartpage">
			    	<h2>Your Compare</h2>
						<table class="tblone">
							<tr>
								<th>Ser. No.</th>
								<th>Product Name</th>
								<th>Image</th>
								<th>Price</th>
								<th>Action</th>
							</tr>
							<?php 
							$viewCompare = $product->viewCompare();
							if ($viewCompare) {
								$sl = 1;
								while ($row = $viewCompare->fetch_assoc()) {
							?>
							<tr>
								<td><?= $sl; ?></td>
								<td><?= $row['product_name']; ?></td>
								<td>
									<img src="admin/uploads/products/<?= $row['image']; ?>" alt=""/>
								</td>
								<td>Tk. <?= $row['price']; ?></td>
								<td>
									<a href="preview.php?productId=<?= $row['product_id']; ?>">View</a> || 
									<a href="compare.php?deleteCompare=<?= $row['id']; ?>" onclick="return confirm('Are you sure to remove?');">Remove</a>
								</td>
							</tr>
							<?php
							$sl++;
								}
							}
							?>
						</table>
					</div>
    	</div>  	
       <div class="clear"></div>
    </div>
 </div>
<?php include 'inc/footer.php'; ?>