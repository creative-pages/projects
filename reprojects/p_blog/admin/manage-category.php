<?php 
require_once "header.php"; 

$category = new App\classes\Category();
$allcategory = $category->allCategory();

?>
                <!-- content HEADER -->
                <!-- ========================================================= -->
                <div class="content-header">
                    <!-- leftside content header -->
                    <div class="leftside-content-header">
                        <ul class="breadcrumbs">
                            <li><i class="fa fa-home" aria-hidden="true"></i><a href="javascript:avoid(0)">Manage Category</a></li>
                        </ul>
                    </div>
                </div>
                <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
                <div class="row animated fadeInUp">
                    <div class="col-sm-12">
                    <h4 class="section-subtitle">Manage Category</h4>
                    <div class="panel">
                        <div class="panel-content">
                            <div class="table-responsive">
                                <table id="basic-table" class="data-table table table-striped nowrap table-hover" cellspacing="0" width="100%">
                                    <thead>
                                    <tr>
                                        <th>Sl. No.</th>
                                        <th>Category Name</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php 
                                    $sl = 1;
                                    while ($row = mysqli_fetch_assoc($allcategory)) {
                                    ?>
									<tr>
                                    	<td><?= $sl; ?></td>
                                    	<td><?= $row['category_name']; ?></td>
                                    	<td>
                                    		<?php 
                                    		if ($row['status'] == 1) {
                                    		?>
											<a class="btn btn-info" href="status.php?id=<?= $row['id']; ?>&action=inactive">Active</a>
                                    		<?php
                                    		} else {
                                    		?>
											<a class="btn btn-warning" href="status.php?id=<?= $row['id']; ?>&action=active">Inactive</a>
                                    		<?php
                                    		}
                                    		?>
                                    	</td>
                                    	<td>
                                    		<a class="btn btn-warning" href="edit-category.php?id=<?= $row['id']; ?>&action=edit">Edit</a>
                                    		<a class="btn btn-danger" href="delete.php?id=<?= $row['id']; ?>&action=delete">Delete</a>
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
<?php require_once "footer.php"; ?>