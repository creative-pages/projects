<?php
require_once "header.php";
?>
<!-- content HEADER -->
<!-- ========================================================= -->
<div class="content-header">
    <!-- leftside content header -->
    <div class="leftside-content-header">
        <ul class="breadcrumbs">
            <li><i class="fa fa-home" aria-hidden="true"></i><a href="index.php">Librarian Dashboard</a></li>
            <li><a href="javascript:avoid(0)">Manage Books</a></li>
        </ul>
    </div>
</div>
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<div class="row animated fadeInUp">
    <div class="col-sm-12">
        <h4 class="section-subtitle"><b>Books</b></h4>
        <div class="panel">
            <div class="panel-content">
                <div class="table-responsive">
                    <table id="basic-table" class="data-table table table-striped nowrap table-hover table-bordered" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Book Name</th>
                                <th>Book Image</th>
                                <th>Author Name</th>
                                <th>Publications Name</th>
                                <th>Purchase Date</th>
                                <th>Book Price</th>
                                <th>Book Quantity</th>
                                <th>Available Quantity</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $result = mysqli_query($dbconn, "SELECT * FROM `books`");
                            while ($row = mysqli_fetch_assoc($result)) {
                            ?>
                            <tr>
                                <td><?= $row['id']; ?></td>
                                <td><?= $row['book_name']; ?></td>
                                <td>
                                    <img style="width: 100px;" src="../images/books/<?= $row['book_image']; ?>" alt="">
                                </td>
                                <td><?= $row['book_author_name']; ?></td>
                                <td><?= $row['book_publications_name']; ?></td>
                                <td><?= date("d-M-Y", strtotime($row['book_purchase_date'])); ?></td>
                                <td><?= $row['book_price']; ?></td>
                                <td><?= $row['book_qty']; ?></td>
                                <td><?= $row['available_qty']; ?></td>
                                <td>
                                    <a href="javascript:avoid(0)" class="btn btn-info btn-sm" data-toggle="modal" data-target="#book-<?= $row['id']; ?>">View</a>
                                    <a href="" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#book-update-<?= $row['id']; ?>">Edit</a>
                                    <a href="delete.php?bookdelete=<?= base64_encode($row['id']); ?>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure to delete?')">Delete</a>
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
    $result = mysqli_query($dbconn, "SELECT * FROM `books`");
    while ($row = mysqli_fetch_assoc($result)) {
?>
<div class="modal fade in" id="book-<?= $row['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="modal-info-label">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header state modal-info">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title" id="modal-info-label"><i class="fa fa-book"></i>Book Info</h4>
            </div>
            <div class="modal-body">
                <table class="table table-hover table-bordered">
                    <tr>
                        <td>ID</td>
                        <td><?= $row['id']; ?></td>
                    </tr>
                    <tr>
                        <td>Book Name</td>
                        <td><?= $row['book_name']; ?></td>
                    </tr>
                    <tr>
                        <td>Book Image</td>
                        <td>
                            <img style="width: 300px;" src="../images/books/<?= $row['book_image']; ?>" alt="">
                        </td>
                    </tr>
                    <tr>
                        <td>Author Name</td>
                        <td><?= $row['book_author_name']; ?></td>
                    </tr>
                    <tr>
                        <td>Publications Name</td>
                        <td><?= $row['book_publications_name']; ?></td>
                    </tr>
                    <tr>
                        <td>Purchase Date</td>
                        <td><?= date("d-M-Y", strtotime($row['book_purchase_date'])); ?></td>
                    </tr>
                    <tr>
                        <td>Book Price</td>
                        <td><?= $row['book_price']; ?></td>
                    </tr>
                    <tr>
                        <td>Book Quantity</td>
                        <td><?= $row['book_qty']; ?></td>
                    </tr>
                    <tr>
                        <td>Available Quantity</td>
                        <td><?= $row['available_qty']; ?></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<?php
}
?>



<?php 
    $result = mysqli_query($dbconn, "SELECT * FROM `books`");
    while ($row = mysqli_fetch_assoc($result)) {
        $id = $row["id"];
        $book_info = mysqli_query($dbconn, "SELECT * FROM `books` WHERE `id` = '$id'");
        $book_info_row = mysqli_fetch_assoc($book_info);
?>
<div class="modal fade in" id="book-update-<?= $row['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="modal-info-label">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header state modal-info">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title" id="modal-info-label"><i class="fa fa-book"></i>Update Book Info</h4>
            </div>
            <div class="modal-body">
                <div class="panel">
                        <div class="panel-content">
                            <div class="row">
                                <div class="col-md-12">
                                    <form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">
                                        <?php if (isset($insertSuc)) { echo '<div class="alert alert-success col-sm-9 col-sm-offset-3" style="margin-top: 5px;">' . $insertSuc . '</div>'; } ?>
                                        <?php if (isset($isnertErr)) { echo '<div class="alert alert-warning col-sm-9 col-sm-offset-3" style="margin-top: 5px;">' . $isnertErr . '</div>'; } ?>
                                        <div class="form-group">
                                            <label for="book_name" class="col-sm-4 control-label">Book Name</label>
                                            <div class="col-sm-8">
                                                <input type="hidden" name="id" value="<?= $book_info_row['id']; ?>">
                                                <input type="text" class="form-control" id="book_name" name="book_name" placeholder="Book Name" required="" value="<?= $book_info_row['book_name']; ?>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="book_author_name" class="col-sm-4 control-label">Book Author Name</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="book_author_name" name="book_author_name" placeholder="Book Author Name" required=""value="<?= $book_info_row['book_author_name']; ?>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="book_publications_name" class="col-sm-4 control-label">Book Publi. Name</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="book_publications_name" name="book_publications_name" placeholder="Book Publications Name" required=""value="<?= $book_info_row['book_publications_name']; ?>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="book_purchase_date" class="col-sm-4 control-label">Book Purchase Date</label>
                                            <div class="col-sm-8">
                                                <input type="date" class="form-control" id="book_purchase_date" name="book_purchase_date" placeholder="Book Publications Date" required=""value="<?= $book_info_row['book_purchase_date']; ?>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="book_price" class="col-sm-4 control-label">Book Price</label>
                                            <div class="col-sm-8">
                                                <input type="number" class="form-control" id="book_price" name="book_price" placeholder="Book Price" required=""value="<?= $book_info_row['book_price']; ?>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="book_qty" class="col-sm-4 control-label">Book Quantity</label>
                                            <div class="col-sm-8">
                                                <input type="number" class="form-control" id="book_qty" name="book_qty" placeholder="Book Quantity" required=""value="<?= $book_info_row['book_qty']; ?>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="available_qty" class="col-sm-4 control-label">Available Quantity</label>
                                            <div class="col-sm-8">
                                                <input type="number" class="form-control" id="available_qty" name="available_qty" placeholder="Available Quantity" required=""value="<?= $book_info_row['available_qty']; ?>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-4 col-sm-8">
                                                <button type="submit" name="update_book" class="btn btn-primary">Update Book</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>

<?php
}

if (isset($_POST['update_book'])) {
    $id = $_POST['id'];
    $book_name = $_POST['book_name'];
    $book_author_name = $_POST['book_author_name'];
    $book_publications_name = $_POST['book_publications_name'];
    $book_purchase_date = $_POST['book_purchase_date'];
    $book_price = $_POST['book_price'];
    $book_qty = $_POST['book_qty'];
    $available_qty = $_POST['available_qty'];


    $result = mysqli_query($dbconn, "UPDATE `books` SET `book_name`='$book_name',`book_author_name`='$book_author_name',`book_publications_name`= '$book_publications_name',`book_purchase_date`='$book_purchase_date',`book_price`='$book_price',`book_qty`='$book_qty',`available_qty`='$available_qty' WHERE `id` = '$id'");

    if ($result) {
    ?>
        <script type="text/javascript">
            alert("Book updated successfully.");
            javascript:history.go(-1);
        </script>
    <?php
    } else {
    ?>
        <script type="text/javascript">
            alert("Book not update!");
        </script>
    <?php
    }
}



?>

<?php
require_once "footer.php";
?>