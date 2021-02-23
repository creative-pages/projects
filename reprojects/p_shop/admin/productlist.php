<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 
if (isset($_GET['deleteId'])) {
	$product_id = $_GET['deleteId'];
	$product->deleteProduct($product_id);
}
?>
<div class="grid_10">
    <div class="box round first grid">
        <h2>Product List</h2>
        <div class="block">  
            <table class="data display datatable table table-bordered" id="example">
			<thead>
				<tr>
					<th>Sl. No.</th>
					<th>Product Name</th>
					<th>Brand</th>
					<th>Category</th>
					<th>Description</th>
					<th>Image</th>
					<th>Type</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<?php 
				$sl = 1;
				$allProduct = $product->allProduct();
				if ($allProduct) {
					while ($row = $allProduct->fetch_assoc()) {
				?>
				<tr>
					<td><?= $sl; ?></td>
					<td><?= $row['name']; ?></td>
					<td><?= $row['brand_name']; ?></td>
					<td><?= $row['category_name']; ?></td>
					<td style="width: 200px;"><?= $format->textShorten($row['description'], 70); ?></td>
					<td>
						<img style="width: 80px;" src="uploads/products/<?= $row['image']; ?>" alt="">
					</td>
					<td>
						<?php
						if ($row['type'] == 1) {
							echo "Featured";
						} else {
							echo "Non-Featured";
						}
						?>
					</td>
					<td><a href="edit-product.php?productId=<?= $row['id']; ?>">Edit</a> || <a href="?deleteId=<?= $row['id']; ?>" onclick="return confirm('Are you sure to delete?');">Delete</a></td>
				</tr>
				<?php
				$sl++;
					}
				}
				?>
			</tbody>
		</table>

       </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        setupLeftMenu();
        $('.datatable').dataTable();
		setSidebarHeight();
    });
</script>
<?php include 'inc/footer.php';?>
