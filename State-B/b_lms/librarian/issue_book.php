<?php include_once 'inc/header.php' ?>
<?php include_once 'inc/sidebar.php' ?>

<?php 
if (isset($_POST['save_issue_book'])) {
    $student_id = $_POST['student_id'];
    $book_id = $_POST['book_id'];
    $book_issue_date = $_POST['book_issue_date'];

    $result = mysqli_query($conn, "INSERT INTO `issue_books`(`student_id`, `book_id`, `book_issue_date`) VALUES('$student_id', '$book_id', '$book_issue_date')");
    if ($result) {
        mysqli_query($conn, "UPDATE `books` SET `book_avail_qty` = `book_avail_qty`-1 WHERE `id` = '$book_id'");
        $success = "Book issued successfully.";
    } else {
        $error = "Book does not issued successfully!";
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
                <li><a href="javascript:void(0)">Issue Book</a></li>
            </ul>
        </div>
    </div>
    <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
    <div class="row animated fadeInUp">
        <div class="col-sm-6 col-sm-offset-3">
            <div class="panel">
                <div class="panel-content">
                    <div class="row">
                        <div class="col-md-12">
                            <form class="form-inline" action="" method="POST">
                                <h3 class="mb-lg ">Search Students</h3>
                                <div class="form-group" style="width: 80%;">
                                    <select class="form-control" style="width: 100%;" name="students">
                                        <option value="">Select Student</option>
                                        <?php 
                                        $all_student = mysqli_query($conn, "SELECT * FROM `students` WHERE `status` = '1'");
                                        while ($row = mysqli_fetch_assoc($all_student)) {
                                        ?>
                                        <option value="<?= $row['id']; ?>"><?= $row['fname'] . ' ' . $row['lname'] . ' - (' . $row['roll'] . ')'; ?></option>
                                        <?php
                                        }
                                        ?>
                                    </select>
                                </div>
                                <div class="form-group" style="width: 19%;">
                                    <button type="submit" name="search" class="btn btn-primary btn-block">Search</button>
                                </div>
                                <?php 
                                if (isset($success)) {
                                ?>
                                <div class="alert alert-success fade in">
                                    <a href="#" class="close" data-dismiss="alert">×</a>
                                    <?= $success; ?>
                                </div>
                                <?php
                                } elseif(isset($error)) {
                                ?>
                                <div class="alert alert-warning fade in">
                                    <a href="#" class="close" data-dismiss="alert">×</a>
                                    <?= $error; ?>
                                </div>
                                <?php
                                }
                                ?>
                            </form>
                        </div>
                    </div>
                    <?php 
                    if (isset($_POST['search'])) {
                        $id = $_POST['students'];
                        $search_result = mysqli_query($conn, "SELECT * FROM `students` WHERE `id` = '$id'");
                        $search_row = mysqli_fetch_assoc($search_result);
                    ?>
                    <div class="panel">
                        <div class="panel-content">
                            <div class="row">
                                <div class="col-md-12">
                                    <form action="" method="POST">
                                        <div class="form-group">
                                            <label for="name">Student Name</label>
                                            <input type="hidden" name="student_id" value="<?= $search_row['id']; ?>">
                                            <input type="text" class="form-control" readonly="" id="name" value="<?= $search_row['fname'] . ' ' . $search_row['lname']; ?>">
                                        </div>
                                        <div class="form-group">
                                            <label for="book">Select Book</label>
                                            <select class="form-control" style="width: 100%;" name="book_id">
                                                <option value="">Select Book</option>
                                                <?php 
                                                $all_book = mysqli_query($conn, "SELECT * FROM `books` WHERE `book_avail_qty` > 0");
                                                while ($book_row = mysqli_fetch_assoc($all_book)) {
                                                ?>
                                                <option value="<?= $book_row['id']; ?>"><?= $book_row['book_name']; ?></option>
                                                <?php
                                                }
                                                ?>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Book Issue Date</label>
                                            <input type="text" class="form-control" name="book_issue_date" value="<?= date('d-m-Y'); ?>" readonly="">
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary" name="save_issue_book">Save Issue Book</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>
    <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
</div>
<?php include_once 'inc/footer.php' ?>