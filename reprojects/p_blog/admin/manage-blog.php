<?php 
require_once "header.php"; 

$blog = new App\classes\Blog();
$allblog = $blog->allBlog();

?>
                <!-- content HEADER -->
                <!-- ========================================================= -->
                <div class="content-header">
                    <!-- leftside content header -->
                    <div class="leftside-content-header">
                        <ul class="breadcrumbs">
                            <li><i class="fa fa-home" aria-hidden="true"></i><a href="javascript:avoid(0)">Manage Blog</a></li>
                        </ul>
                    </div>
                </div>
                <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
                <div class="row animated fadeInUp">
                    <div class="col-sm-12">
                    <h4 class="section-subtitle">Manage Blog</h4>
                    <div class="panel">
                        <div class="panel-content">
                            <div class="table-responsive">
                                <table id="basic-table" class="data-table table table-striped table-bordered table-hover" cellspacing="0" width="100%">
                                    <thead>
                                    <tr>
                                        <th>Sl. No.</th>
                                        <th>Category Name</th>
                                        <th>Title</th>
                                        <th>Content</th>
                                        <th>Image</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php 
                                    $sl = 1;
                                    while ($row = mysqli_fetch_assoc($allblog)) {
                                    ?>
									<tr>
                                    	<td><?= $sl; ?></td>
                                    	<td><?= $row['category_name']; ?></td>
                                        <td><?= $row['title']; ?></td>
                                        <td style="width: 300px;"><?= $row['content']; ?></td>
                                        <td>
                                            <img style="width: 100px;" src="../uploads/<?= $row['photo']; ?>" alt="">
                                        </td>
                                    	<td>
                                    		<?php 
                                    		if ($row['status'] == 1) {
                                    		?>
											<a class="btn btn-info" href="status.php?id=<?= $row['id']; ?>&blog=inactive">Active</a>
                                    		<?php
                                    		} else {
                                    		?>
											<a class="btn btn-warning" href="status.php?id=<?= $row['id']; ?>&blog=active">Inactive</a>
                                    		<?php
                                    		}
                                    		?>
                                    	</td>
                                    	<td>
                                    		<a class="btn btn-warning" href="edit-blog.php?id=<?= $row['id']; ?>&blog=edit">Edit</a>
                                    		<a class="btn btn-danger" href="delete.php?id=<?= $row['id']; ?>&blog=delete&file=<?= $row['photo']; ?>">Delete</a>
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