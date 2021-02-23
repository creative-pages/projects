<?php include_once 'inc/header.php' ?>
<?php include_once 'inc/sidebar.php' ?>
<!-- CONTENT -->
<!-- ========================================================= -->
<div class="content">
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
    <div class="row animated fadeInUp">
        <div class="col-sm-12">
            <h4 class="section-subtitle"><b>All Students</b></h4>
            <div class="panel">
                <div class="panel-content">
                    <div class="table-responsive">
                        <table id="basic-table" class="table-bordered data-table table table-striped nowrap table-hover" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>Serial No.</th>
                                    <th>Book Name</th>
                                    <th>Book Image</th>
                                    <th>Book Issue Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                $sl = 1;
                                $student_id = $_SESSION['student_id'];
                                $issue_book = mysqli_query($conn, "SELECT `books`.`book_name`, `books`.`book_image`, `issue_books`.`book_issue_date`
                                FROM `books`
                                INNER JOIN `issue_books` ON `issue_books`.`book_id` = `books`.`id`
                                WHERE `issue_books`.`student_id` = '$student_id';");
                                while ($row = mysqli_fetch_assoc($issue_book)) {
                                ?>
                                <tr>
                                    <td><?= $sl; ?></td>
                                    <td><?= $row['book_name']; ?></td>
                                    <td>
                                        <img style="width: 100px; height: 50px;" src="../librarian/images/<?= $row['book_image']; ?>" alt="">
                                    </td>
                                    <td><?= date("d-M-Y", strtotime($row['book_issue_date'])); ?></td>
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
</div>
<?php include_once 'inc/footer.php' ?>