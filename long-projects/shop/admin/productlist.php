<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 

$allProduct = $product->allProduct();

if (isset($_GET['productDeleteId'])) {
	$id = $_GET['productDeleteId'];
	$product->deleteProduct($id);
	header("Location: productlist.php");
}

?>
<div class="grid_10">
    <div class="box round first grid">
        <h2>Post List</h2>
        <div class="block">  
            <table class="data display datatable" id="example">
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
				while ($row = $allProduct->fetch_assoc()) {
				?>
				<tr>
					<td><?= $sl; ?></td>
					<td><?= $row['name']; ?></td>
					<td><?= $row['categoryName']; ?></td>
					<td><?= $row['brandName']; ?></td>
					<td style="width: 250px;"><?= $format->textShorten($row['description'], 50); ?></td>
					<td>
						<img style="width: 150px;" src="upload/<?= $row['image']; ?>" alt="">
					</td>
					<td>
						<?php if ($row['type'] == '1') { echo 'Featured'; } else { echo 'Non-Featured'; } ?>
					</td>
					<td><a href="product-edit.php?productEditId=<?= $row['id']; ?>">Edit</a> || <a href="?productDeleteId=<?= $row['id']; ?>" onclick="return confirm('Are you sure to delete?');">Delete</a></td>
				</tr>
				<?php
				$sl++;
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
