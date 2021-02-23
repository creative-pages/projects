<?php 
require_once 'header.php';
?>
<?php 
$category = new App\classes\Category();
$categories = $category->allCategory();


?>
                <!-- content HEADER -->
                <!-- ========================================================= -->
                <div class="content-header">
                    <!-- leftside content header -->
                    <div class="leftside-content-header">
                        <ul class="breadcrumbs">
                            <li><i class="fa fa-home" aria-hidden="true"></i><a href="#">Dashboard</a></li>
                        </ul>
                    </div>
                </div>
                <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
                <div class="row animated fadeInRight">
                <div class="col-sm-12">
                    <h4 class="section-subtitle"><b>Manage Category</b></h4>
                    <div class="panel">
                        <div class="panel-content">
                            <div class="table-responsive">
                                <table id="basic-table" class="data-table table table-striped nowrap table-hover" cellspacing="0" width="100%">
                                    <thead>
                                    <tr>
                                        <th>Se. No.</th>
                                        <th>Category Name</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php 
                                    $sl = 1;
                                    while ($row = mysqli_fetch_assoc($categories)) {
                                    ?>
									<tr>
                                        <td><?php echo $sl; ?></td>
                                        <td><?php echo $row['category_name']; ?></td>
                                        <td><?php echo $row['status'] == 1 ? 'Active' : 'Inactive'; ?></td>
                                        <td>
                                        	<?php 
                                        	if ($row['status'] == '0') {
                                        	?>
                                        	<a href="status.php?id=<?= base64_encode($row['id']); ?>&action=active" class="btn btn-info btn-sm">Active</a>
                                        	<?php
                                        	} else {
                                        	?>
											<a href="status.php?id=<?= base64_encode($row['id']); ?>&action=inactive" class="btn btn-warning btn-sm">Inactive</a>
                                        	<?php
                                        	}
                                        	
                                        	?>
                                        	<a href="edit-category.php?id=<?= base64_encode($row['id']); ?>" class="btn btn-warning btn-sm">Edit</a>
                                        	<a href="delete.php?id=<?= base64_encode($row['id']); ?>&action=cat" class="btn btn-danger btn-sm">Delete</a>
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
<?php 
require_once "footer.php";
?>