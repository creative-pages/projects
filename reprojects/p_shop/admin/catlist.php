<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 
if (isset($_GET['deleteId'])) {
	$category_id = $_GET['deleteId'];
	$category->deleteCategory($category_id);
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
							<th>Date</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						$sl = 1;
						$allCategory = $category->allCategory();
						if ($allCategory) {
							while ($row = $allCategory->fetch_assoc()) {
						?>
						<tr>
							<td><?= $sl; ?></td>
							<td><?= $row['name']; ?></td>
							<td><?= $format->dateFormat($row['update_date']); ?></td>
							<td><a href="edit-category.php?editId=<?= $row['id']; ?>">Edit</a> || <a href="?deleteId=<?= $row['id']; ?>" onclick="return confirm('Are you sure to delete?');">Delete</a></td>
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

