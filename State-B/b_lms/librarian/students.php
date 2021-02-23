<?php include_once 'inc/header.php' ?>
<?php include_once 'inc/sidebar.php' ?>

<?php 
if (isset($_GET['status']) && $_GET['status'] == 'inactive') {
    $id = base64_decode($_GET['id']);
    $status = mysqli_query($conn, "UPDATE `students` SET `status` = 1 WHERE `id` = '$id'");
    if ($status) {
        header("Location: students.php");
    }
} elseif (isset($_GET['status']) && $_GET['status'] == 'active') {
    $id = base64_decode($_GET['id']);
    $status = mysqli_query($conn, "UPDATE `students` SET `status` = 0 WHERE `id` = '$id'");
    if ($status) {
        header("Location: students.php");
    }
}
?>

<!-- CONTENT -->
<!-- ========================================================= -->
<div class="content">
    <!-- content HEADER -->
    <!-- ========================================================= -->
    <div class="content-header">
        <!-- leftside content header -->
        <div class="leftside-content-header">
            <ul class="breadcrumbs">
                <li><i class="fa fa-home" aria-hidden="true"></i><a href="index.php">Dashboard</a></li>
                <li><a href="javascript:void(0)">Students</a></li>
            </ul>
        </div>
    </div>
    <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
    <div class="row animated fadeInUp">
        <div class="col-sm-12">
            <div>
                <h4 class="section-subtitle pull-left"><b>All Students</b></h4>
                <a href="print_all_students.php" target="_blank" class="btn btn-primary pull-right"><i class="fa fa-print"></i> Print</a>
                <div class="clearfix"></div>
            </div>
            <div class="panel">
                <div class="panel-content">
                    <div class="table-responsive">
                        <table id="basic-table" class="data-table table table-striped nowrap table-hover" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Roll</th>
                                    <th>Reg</th>
                                    <th>Email</th>
                                    <th>Username</th>
                                    <th>Phone</th>
                                    <th>Image</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                $all_students = mysqli_query($conn, "SELECT * FROM `students` ORDER BY `id` DESC");
                                while ($row = mysqli_fetch_assoc($all_students)) {
                                ?>
                                <tr>
                                    <td><?= $row['fname'] . ' ' . $row['lname']; ?></td>
                                    <td><?= $row['roll']; ?></td>
                                    <td><?= $row['reg']; ?></td>
                                    <td><?= $row['email']; ?></td>
                                    <td><?= $row['username']; ?></td>
                                    <td><?= $row['phone']; ?></td>
                                    <td>
                                        <img src="images/<?= $row['image']; ?>" alt="">
                                    </td>
                                    <td>
                                        <?php 
                                        if ($row['status'] == 0) {
                                        ?>
                                            <a href="students.php?id=<?= base64_encode($row['id']); ?>&status=inactive" class="btn btn-warning btn-sm">Inactive</a>
                                        <?php
                                        } else {
                                        ?>
                                            <a href="students.php?id=<?= base64_encode($row['id']); ?>&status=active" class="btn btn-success btn-sm">Active</a>
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
</div>
<?php include_once 'inc/footer.php' ?>