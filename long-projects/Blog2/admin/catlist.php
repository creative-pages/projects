<?php include 'inc/header.php'; ?>
<?php include 'inc/sidebar.php'; ?>
<?php 
if (isset($_GET['deleteCategory'])) {
	$id = $_GET['deleteCategory'];
	$category->deleteCategory($id);
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
						$allCategory = $category->allCategory();
						while ($row = $allCategory->fetch_assoc()) {
						?>
						<tr>
							<td><?= $sl; ?></td>
							<td><?= $row['category_name']; ?></td>
							<td><a href="update-category.php?categoryId=<?= $row['id']; ?>">Edit</a> || <a onclick="return confirm('Are you sure to delete?');" href="?deleteCategory=<?= $row['id']; ?>">Delete</a></td>
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
<?php include 'inc/footer.php'; ?>
