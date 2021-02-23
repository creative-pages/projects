<?php
require_once "header.php";

if (isset($_POST['issue_book'])) {
    $student_id = $_POST['student_id'];
    $book_id = $_POST['book_id'];
    $book_issue_date = $_POST['book_issue_date'];

    $result = mysqli_query($dbconn, "INSERT INTO `issue_books`(`book_id`, `student_id`, `book_issue_date`) VALUES ('$book_id', '$student_id', '$book_issue_date')");

    if ($result) {
        mysqli_query($dbconn, "UPDATE `books` SET `available_qty`= `available_qty`-1 WHERE `id` = '$book_id'");
        $inputErr['success'] = "Book issued successfully.";
    } else {
        $inputErr['failed'] = "Book not issued!";
    }
}


?>
<!-- content HEADER -->
<!-- ========================================================= -->
<div class="content-header">
    <!-- leftside content header -->
    <div class="leftside-content-header">
        <ul class="breadcrumbs">
            <li><i class="fa fa-home" aria-hidden="true"></i><a href="index.php">Dashboard</a></li>
            <li><a href="javascript:avid(0)">Issue Book</a></li>
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
                        <form class="form-inline row" action="" method="POST">
                            <h3 class="mb-lg text-center">Issue Book</h3>
                            <div class="form-group col-sm-9">
                                <select class="form-control" style="width: 100%;" name="student_id">
                                    <option value="">Select Id</option>
                                    <?php
                                    $result = mysqli_query($dbconn, "SELECT * FROM `students` WHERE `status` = '1'");
                                    while ($row = mysqli_fetch_assoc($result)) {
                                    ?>
                                    <option value="<?= $row['id']; ?>"><?= $row['fname'] . ' ' . $row['lname'] . '  &nbsp;&nbsp;&nbsp;{' . $row['email'] . '}'; ?></option>
                                    <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="form-group col-sm-3">
                                <button type="submit" name="search_book" class="btn btn-primary">Search</button>
                            </div>
                        </form>
                        <?php if (isset($inputErr['success'])) { echo '<div class="mt-md alert alert-success">' . $inputErr['success'] . '</div>'; } ?>
                        <?php if (isset($inputErr['failed'])) { echo '<div class="mt-md alert alert-warning">' . $inputErr['failed'] . '</div>'; } ?>
                    </div>
                </div>
                <?php
                if (isset($_POST['search_book'])) {
                $id = $_POST['student_id'];
                $result = mysqli_query($dbconn, "SELECT * FROM `students` WHERE `id` = '$id'");
                $row = mysqli_fetch_assoc($result);
                ?>
                <div class="panel">
                    <div class="panel-content">
                        <div class="row">
                            <div class="col-md-12">
                                <form action="" method="POST">
                                    <div class="form-group">
                                        <label for="name">Student Name</label>
                                        <input type="text" class="form-control" name="name" id="name" value="<?= $row['fname'] . ' ' . $row['lname']; ?>" readonly>
                                        <input type="hidden" name="student_id" value="<?= $row['id']; ?>">
                                    </div>
                                    <div class="form-group">
                                        <label for="book_id">Select Book</label>
                                        <select id="book_id" class="form-control" style="width: 100%;" name="book_id" required="">
                                            <option value="">Select Book</option>
                                            <?php
                                            $result = mysqli_query($dbconn, "SELECT * FROM `books` WHERE `available_qty` > '0'");
                                            while ($row = mysqli_fetch_assoc($result)) {
                                            ?>
                                            <option value="<?= $row['id']; ?>"><?= $row['book_name'] ?></option>
                                            <?php
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="book_issue_date">Book Issue Date</label>
                                        <input type="text" class="form-control" id="book_issue_date" name="book_issue_date" value="<?= date("d-m-Y"); ?>" readonly>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" name="issue_book" class="btn btn-primary">Issue Book</button>
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
<?php
require_once "footer.php";
?>