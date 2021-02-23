<?php require_once 'header.php'; ?>

<?php 

// inactive status
if (isset($_GET['inactive'])) {
	$id = $_GET['inactive'];
	$category->inactiveStatus($id);
}

// active status
if (isset($_GET['active'])) {
	$id = $_GET['active'];
	$category->activeStatus($id);
}

// delete status
if (isset($_GET['delete_id'])) {
	$id = $_GET['delete_id'];
	$category->deleteData($id);
}

?>
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<div class="row animated fadeInRight">
    <div class="col-sm-12">
        <h2 class="section-subtitle"><b>All Category</b></h2>
        <div class="panel">
            <div class="panel-content">
                <div class="table-responsive">
                    <table id="basic-table" class="data-table table table-bordered table-striped nowrap table-hover" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th>Ser. No.</th>
                            <th>Name</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        	<?php 
                        	$sl = 1;
                        	$all_category = $category->readAllData();
                        	while ($row = mysqli_fetch_assoc($all_category)) {
                        	?>
							<tr>
                        		<td><?= $sl; ?></td>
                        		<td><?= $row['category_name']; ?></td>
                        		<td>
                        			<?php 
                        			if ($row['status'] == 1) {
                        				echo "Active";
                        			} elseif ($row['status'] == 2) {
                        				echo "Inactive";
                        			}
                        			?>
                        		</td>
                        		<td style="width: 170px;">
                        			<?php 
                        			if ($row['status'] == 1) {
                        			?>
									<a href="manage_category.php?inactive=<?= $row['id']; ?>" class="btn btn-warning btn-sm">Inactive</a>
                        			<?php
                        			} elseif ($row['status'] == 2) {
                        			?>
									<a href="manage_category.php?active=<?= $row['id']; ?>" class="btn btn-success btn-sm">Active</a>
                        			<?php
                        			}
                        			?>
                        			<a href="edit_category.php?edit_id=<?= $row['id']; ?>" class="btn btn-warning btn-sm">Edit</a>
                        			<a href="manage_category.php?delete_id=<?= $row['id']; ?>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure to delete?');">Delete</a>
                        		</td>
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
    </div>
</div>
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<?php require_once 'footer.php'; ?>