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
                <li><i class="fa fa-home" aria-hidden="true"></i><a href="index.php">Dashboard</a></li>
                <li><a href="javascript:void(0)">Return Book</a></li>
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
                        <table id="basic-table" class="data-table table table-striped nowrap table-hover" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Roll</th>
                                    <th>Phone</th>
                                    <th>Book Name</th>
                                    <th>Book Image</th>
                                    <th>Book Issue Date</th>
                                    <th>Return</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                $result = mysqli_query($conn, "SELECT `students`.`fname`, `students`.`lname`, `students`.`roll`, `students`.`phone`, `books`.`id` AS 'book_id', `books`.`book_name`, `books`.`book_image`, `issue_books`.`book_issue_date`, `issue_books`.`id` FROM `issue_books` 
                                    INNER JOIN `students` ON `students`.`id` = `issue_books`.`student_id` 
                                    INNER JOIN `books` ON `books`.`id` = `issue_books`.`book_id`
                                    WHERE `issue_books`.`book_return_date` = ''");
                                while ($row = mysqli_fetch_assoc($result)) {
                                ?>
                                <tr>
                                    <td><?= $row['fname'] . ' ' . $row['lname']; ?></td>
                                    <td><?= $row['roll']; ?></td>
                                    <td><?= $row['phone']; ?></td>
                                    <td><?= $row['book_name']; ?></td>
                                    <td>
                                        <img style="width: 100px; height: 50px;" src="images/<?= $row['book_image']; ?>" alt="">
                                    </td>
                                    <td><?= date("d-M-Y", strtotime($row['book_issue_date'])); ?></td>
                                    <td>
                                        <a href="return_book.php?id=<?= $row['id']; ?>&book_id=<?= $row['book_id']; ?>&action=book_return" class="btn btn-warning">Return</a>
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

    <?php 

if (isset($_GET['action']) && $_GET['action'] = 'book_return') {
    $id = $_GET['id'];
    $book_id = $_GET['book_id'];
    $date = date("d-m-y");
    $result = mysqli_query($conn, "UPDATE `issue_books` SET `book_return_date` = '$date' WHERE `id` = '$id'");
    if ($result) {
        mysqli_query($conn, "UPDATE `books` SET `book_avail_qty` = `book_avail_qty`+1 WHERE `id` = '$book_id'");
    ?>
    <script type="text/javascript">
        alert("Book returned successfully.");
        javascript:history.go(-1);
    </script>
    <?php
    } else {
    ?>
    <script type="text/javascript">
        alert("Book does not returned!");
    </script>
    <?php
    }
}

?>
    <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
</div>
<?php include_once 'inc/footer.php' ?>