<?php require_once 'header.php'; ?>

<?php 

// inactive status
if (isset($_GET['inactive'])) {
	$id = $_GET['inactive'];
	$blog->inactiveStatus($id);
}

// active status
if (isset($_GET['active'])) {
	$id = $_GET['active'];
	$blog->activeStatus($id);
}

// delete status
if (isset($_GET['delete_id']) && isset($_GET['old_file'])) {
	$id = $_GET['delete_id'];
	$old_file = $_GET['old_file'];
	$blog->deleteData($id, $old_file);
}

?>
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<div class="row animated fadeInRight">
    <div class="col-sm-12">
        <h2 class="section-subtitle"><b>All Blog</b></h2>
        <div class="panel">
            <div class="panel-content">
                <div class="table-responsive">
                    <table id="basic-table" class="data-table table table-bordered table-striped wrap table-hover" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th>Sl.</th>
                            <th>Title</th>
                            <th>Category</th>
                            <th>Content</th>
                            <th>Image</th>
                            <th>Status</th>
                            <th>Post By</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        	<?php 
                        	$sl = 1;
                        	$all_blog = $blog->readAllData();
                        	while ($row = mysqli_fetch_assoc($all_blog)) {
                        	?>
							<tr>
                        		<td><?= $sl; ?></td>
                        		<td style="width: 180px;"><?= $row['title']; ?></td>
                        		<td><?= $row['category_name']; ?></td>
                        		<td style="width: 220px;"><?= substr($row['content'], 0, 150); ?>...</td>
                        		<td>
                        			<img style="width: 150px;" src="../uploads/<?= $row['image']; ?>" alt="">
                        		</td>
                        		<td>
                        			<?php 
                        			if ($row['status'] == 1) {
                        			?>
									<a href="manage_blog.php?inactive=<?= $row['id']; ?>" class="btn btn-success btn-sm">Active</a>
                        			<?php
                        			} elseif ($row['status'] == 2) {
                        			?>
									<a href="manage_blog.php?active=<?= $row['id']; ?>" class="btn btn-warning btn-sm">Inactive</a>
                        			<?php
                        			}
                        			?>
                        		</td>
                        		<td><?= $row['post_by']; ?></td>
                        		<td>
                        			<a href="edit_blog.php?edit_id=<?= $row['id']; ?>" class="btn btn-warning btn-sm">Edit</a>
                        			<a href="manage_blog.php?delete_id=<?= $row['id']; ?>&old_file=<?= $row['image']; ?>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure to delete?');">Delete</a>
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