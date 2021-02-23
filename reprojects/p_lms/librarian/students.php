<?php 
require_once "header.php";
?>
                <!-- content HEADER -->
                <!-- ========================================================= -->
                <div class="content-header">
                    <!-- leftside content header -->
                    <div class="leftside-content-header">
                        <ul class="breadcrumbs">
                            <li><i class="fa fa-home" aria-hidden="true"></i><a href="#">Dashboard</a></li>
                            <li><a href="javascript:avid(0)">Studetns</a></li>
                        </ul>
                    </div>
                </div>
                <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
                <div class="row animated fadeInUp">
                    <div class="col-sm-12">
                    <h4 class="pull-left section-subtitle"><b>All Students</b></h4>
                    <div class="pull-right">
                        <a href="print-all-students.php" target="_blank" class="btn btn-primary">Print</a>
                    </div>
                    <div class="clearfix"></div>
                    <div class="panel">
                        <div class="panel-content">
                            <div class="table-responsive">
                                <table id="basic-table" class="data-table table table-striped nowrap table-hover" cellspacing="0" width="100%">
                                    <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Roll</th>
                                        <th>Reg No.</th>
                                        <th>Email</th>
                                        <th>Username</th>
                                        <th>Phone</th>
                                        <th>Image</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php 
                                    $result = mysqli_query($dbconn, "SELECT * FROM `students`");
                                    while ($row = mysqli_fetch_assoc($result)) {
                                    ?>
                                    <tr>
                                        <td><?= $row['fname'] . ' ' . $row['lname']; ?></td>
                                        <td><?= $row['roll']; ?></td>
                                        <td><?= $row['reg']; ?></td>
                                        <td><?= $row['email']; ?></td>
                                        <td><?= $row['username']; ?></td>
                                        <td><?= $row['phone']; ?></td>
                                        <td>
                                            <img src="<?= $row['image']; ?>" alt="">
                                        </td>
                                        <td><?= $row['status'] == '1' ? 'Active' : 'Inactive'; ?></td>
                                        <td>
                                            <?php 
                                            if ($row['status'] == 1) {
                                            ?>
                                            <a class="btn btn-warning btn-sm" href="status.php?id=<?= $row['id']; ?>&action=active">Inactive</a>
                                            <?php
                                            } else {
                                            ?>
                                            <a class="btn btn-info btn-sm" href="status.php?id=<?= $row['id']; ?>&action=inactive">Active</a>
                                            <?php
                                            }
                                            
                                            ?>
                                            
                                        </td>
                                    </tr>
                                    <?php
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