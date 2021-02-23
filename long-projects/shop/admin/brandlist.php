<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 

$allBrand = $brand->showBrand();

// delete category
if (isset($_GET['deleteId'])) {
	$id = $_GET['deleteId'];
	$brand->deleteBrand($id);
	header("Location: brandlist.php");
}

?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Brand List</h2>
                <div class="block">        
                    <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>Serial No.</th>
							<th>Brand Name</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
					<?php 
					$sl = 1;
					while ($row = $allBrand->fetch_assoc()) {
					?>
						<tr class="odd gradeX">
							<td><?= $sl; ?></td>
							<td><?= $row['brandName']; ?></td>
							<td><a href="edit-brand.php?brandId=<?= $row['brandId']; ?>">Edit</a> || <a onclick="return confirm('Are you sure to delete?')" href="?deleteId=<?= $row['brandId']; ?>">Delete</a></td>
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

