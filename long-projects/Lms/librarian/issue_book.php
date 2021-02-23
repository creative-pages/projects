<?php 
require_once "header.php";

if (isset($_POST['issue_book'])) {
    $student_id = $_POST['student_id'];
    $book_id = $_POST['book_id'];
    $book_issue_date = $_POST['book_issue_date'];
    $result = mysqli_query($dbconn, "INSERT INTO `issue_books`(`student_id`, `books_id`, `book_issue_date`) VALUES ('$student_id', '$book_id', '$book_issue_date')");

    if ($result) {
        mysqli_query($dbconn, "UPDATE `books` SET `available_qty`= `available_qty`-1 WHERE `id` = '$book_id'");
        $insertSuc =  "Data inserted successfully.";
    } else {
        $isnertErr =  "Data not inserted.";
    }
    
}


?>
                <!-- content HEADER -->
                <!-- ========================================================= -->
                <div class="content-header">
                    <!-- leftside content header -->
                    <div class="leftside-content-header">
                        <ul class="breadcrumbs">
                            <li><i class="fa fa-home" aria-hidden="true"></i><a href="#">Librarian Dashboard</a></li>
                            <li><a href="javascript:avoid(0)">Issue Book</a></li>
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
                                    <form class="form-inline" method="POST" action="">
                                        <div class="form-group col-sm-10">
                                        <select class="form-control" style="width: 100%;" name="student_id">
                                            <option value="">Select Name</option>
                                            <?php
                                            $result = mysqli_query($dbconn, "SELECT * FROM `students` WHERE `status` = '1'");
                                            while ($row = mysqli_fetch_assoc($result)){
                                            ?>
                                            <option value="<?= $row['id']; ?>"><?php echo $row['fname'] . ' ' . $row['lname'] . " - (" . $row['email'] . " )"; ?></option>
                                            <?php
                                            }
                                            ?>
                                            
                                        </select>
                                        </div>
                                        <div class="form-group col-sm-2">
                                            <button type="submit" name="search" class="btn btn-primary">Send</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-12">
                                    <?php if (isset($insertSuc)) { echo '<div class="alert alert-success" style="margin-top: 5px;">' . $insertSuc . '</div>'; } ?>
                                    <?php if (isset($isnertErr)) { echo '<div class="alert alert-warning" style="margin-top: 5px;">' . $isnertErr . '</div>'; } ?>
                                </div>
                            </div>
                            <?php 
                            if (isset($_POST['search'])) {
                                $id = $_POST['student_id'];
                                $result = mysqli_query($dbconn, "SELECT * FROM `students` WHERE `id` = '$id' AND `status` = '1'");
                                    $row = mysqli_fetch_assoc($result);
                                ?>
                                <div class="panel">
                        <div class="panel-content">
                            <div class="row">
                                <div class="col-md-12">
                                    <form method="POST" action="">
                                        <div class="form-group">
                                            <label for="name">Student Name</label>
                                            <input type="text" class="form-control" readonly id="name" name="student_id" value="<?php echo $row['fname'] . ' ' . $row['lname']; ?>">
                                            <input type="hidden" name="student_id" value="<?= $row['id'] ?>">
                                        </div>
                                        <div class="form-group">
                                            <label for="book_name">Book Name</label>
                                            <select name="book_id" class="form-control" style="width: 100%;" name="student_id">
                                            <option value="">Select Book</option>
                                            <?php
                                            $result = mysqli_query($dbconn, "SELECT * FROM `books` WHERE `available_qty` > 0");
                                            while ($row = mysqli_fetch_assoc($result)){
                                            ?>
                                            <option value="<?= $row['id']; ?>"><?= $row['book_name']; ?></option>
                                            <?php
                                            }
                                            ?>
                                            
                                        </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Book Issue Date</label>
                                            <input class="form-control" name="book_issue_date" type="text" value="<?= date("d-M-y"); ?>" readonly>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" name="issue_book" class="btn btn-primary">Save Issue Book</button>
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
