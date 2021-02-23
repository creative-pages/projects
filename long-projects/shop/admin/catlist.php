<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 

$allCategory = $category->showCategory();

// delete category
if (isset($_GET['deleteId'])) {
	$id = $_GET['deleteId'];
	$catetory->deleteCategory($id);
	header("Location: catlist.php");
}

?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Category List</h2>
                <div class="block">        
                    <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>Serial No.</th>
							<th>Category Name</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
					<?php 
					$sl = 1;
					while ($row = $allCategory->fetch_assoc()) {
					?>
						<tr class="odd gradeX">
							<td><?= $sl; ?></td>
							<td><?= $row['categoryName']; ?></td>
							<td><a href="edit-category.php?categoryId=<?= $row['categoryId']; ?>">Edit</a> || <a onclick="return confirm('Are you sure to delete?')" href="?deleteId=<?= $row['categoryId']; ?>">Delete</a></td>
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

