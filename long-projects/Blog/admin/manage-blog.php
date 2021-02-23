<?php 
require_once 'header.php';
?>
<?php 
$blog = new App\classes\Blog();
$blogs = $blog->allBlog();


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
                    <h4 class="section-subtitle"><b>Manage Blog</b></h4>
                    <div class="panel">
                        <div class="panel-content">
                            <div class="table-responsive">
                                <table id="basic-table" class="data-table table table-striped table-hover" cellspacing="0" width="100%">
                                    <thead>
                                    <tr>
                                        <th>Se. No</th>
                                        <th>Category Name</th>
                                        <th>Title</th>
                                        <th>Content</th>
                                        <th>Photo</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php 
                                    $sl = 1;
                                    while ($row = mysqli_fetch_assoc($blogs)) {
                                    ?>
									<tr>
                                        <td><?php echo $sl; ?></td>
                                        <td><?php echo $row['category_name']; ?></td>
                                        <td><?php echo $row['title']; ?></td>
                                        <td style="width: 400px;"><?php echo $row['content']; ?></td>
                                        <td>
                                            <img style="width: 200px;" src="../uploads/<?= $row['photo']; ?>" alt="">
                                        </td>
                                        <td>
                                            <?php 
                                            if ($row['status'] == '1') {
                                            ?>
                                            <a href="status.php?id=<?= base64_encode($row['id']); ?>&blog=blog&action=inactive" class="btn btn-info btn-sm">Active</a>
                                            
                                            <?php
                                            } else {
                                            ?>
                                            <a href="status.php?id=<?= base64_encode($row['id']); ?>&blog=blog&action=active" class="btn btn-warning btn-sm">Inactive</a>
                                            <?php
                                            }
                                            
                                            ?>
                                        <td>
                                        	<a href="edit-blog.php?id=<?= base64_encode($row['id']); ?>" class="btn btn-warning btn-sm">Edit</a>
                                        	<a href="delete.php?id=<?= base64_encode($row['id']); ?>&action=blog&filename=<?= $row['photo']; ?>" class="btn btn-danger btn-sm">Delete</a>
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