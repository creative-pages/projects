<?php
require_once "header.php";
?>
<!-- content HEADER -->
<!-- ========================================================= -->
<div class="content-header">
    <!-- leftside content header -->
    <div class="leftside-content-header">
        <ul class="breadcrumbs">
            <li><i class="fa fa-home" aria-hidden="true"></i><a href="index.php">Dashboard</a></li>
            <li><a href="javascript:avid(0)">Manage Books</a></li>
        </ul>
    </div>
</div>
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<div class="row animated fadeInUp">
    <div class="col-sm-12">
        <h4 class="section-subtitle"><b>All Books</b></h4>
        <div class="panel">
            <div class="panel-content">
                <div class="table-responsive">
                    <table id="basic-table" class="data-table table table-striped nowrap table-hover table-bordered" cellspacing="0" width="100%">
                        <thead>
                            <tr>
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
                        <?php
                        $result = mysqli_query($dbconn, "SELECT * FROM `books`");
                        while ($row = mysqli_fetch_assoc($result)) {
                        ?>
                        <tr>
                            <td><?= $row['book_name']; ?></td>
                            <td>
                                <img style="width: 150px;" src="../images/books/<?= $row['book_image']; ?>" alt="">
                            </td>
                            <td><?= $row['book_author_name']; ?></td>
                            <td><?= $row['book_publications_name']; ?></td>
                            <td><?= date("d-M-y", strtotime($row['book_purchase_date'])); ?></td>
                            <td><?= $row['book_price']; ?></td>
                            <td><?= $row['book_qty']; ?></td>
                            <td><?= $row['available_qty']; ?></td>
                            <td>
                                <a class="btn btn-wide btn-info" data-toggle="modal" data-target="#bookview-<?= $row['id']; ?>" href="javascript:avoid(0)">View</a>
                                <a class="btn btn-wide btn-warning" data-toggle="modal" data-target="#bookupdate-<?= $row['id']; ?>" href="javascript:avoid(0)">Edit</a>
                                <a class="btn btn-danger" href="delete.php?id=<?= $row['id']; ?>&action=delete" onclick="return confirm('Are you sure to delete?')">Delete</a>
                            </td>
                        </tr>
                        <?php
                        }
                        ?>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
    <?php
    $result = mysqli_query($dbconn, "SELECT * FROM `books`");
    while ($row = mysqli_fetch_assoc($result)) {
    ?>
    <div class="modal fade in" id="bookview-<?= $row['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="modal-info-label">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header state modal-info">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="modal-info-label"><i class="fa fa-book"></i>Book Info</h4>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered table-hover table-striped">
                        <tr>
                            <td>Book Name</td>
                            <td><?= $row['book_name']; ?></td>
                        </tr>
                        <tr>
                            <td>Book Image</td>
                            <td>
                                <img style="width: 200px;" src="../images/books/<?= $row['book_image']; ?>" alt="">
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
                            <td><?= $row['book_purchase_date']; ?></td>
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
    ?>
    <div class="modal fade in" id="bookupdate-<?= $row['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="modal-info-label">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header state modal-info">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="modal-info-label"><i class="fa fa-book"></i>Update Book Info</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">
                        <?php if (isset($inputErr['success'])) { echo '<div class="alert alert-success">' . $inputErr['success'] . '</div>'; } ?>
                        <?php if (isset($inputErr['failed'])) { echo '<div class="alert alert-warning">' . $inputErr['failed'] . '</div>'; } ?>
                        <div class="form-group">
                            <label for="book_name" class="col-sm-4 control-label">Book Name</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="book_name" id="book_name" placeholder="Book Name"  required="" value="<?= $row['book_name']; ?>">
                                <input type="hidden" class="form-control" name="book_id" value="<?= $row['id']; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="book_author_name" class="col-sm-4 control-label">Book Author Name</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="book_author_name" id="book_author_name" placeholder="Book Author Name" required="" value="<?= $row['book_author_name'];?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="book_publications_name" class="col-sm-4 control-label">Book Publ. Name</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="book_publications_name" id="book_publications_name" placeholder="Book Publ. Name" required="" value="<?= $row['book_publications_name'];?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="book_purchase_date" class="col-sm-4 control-label">Book Purch. Date</label>
                            <div class="col-sm-8">
                                <input type="date" class="form-control" name="book_purchase_date" id="book_purchase_date" placeholder="Book Purch. Date" required="" value="<?= $row['book_purchase_date'];?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="book_price" class="col-sm-4 control-label">Book Price</label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" name="book_price" id="book_price" placeholder="Book Price" required="" value="<?= $row['book_price'];?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="book_qty" class="col-sm-4 control-label">Book Quantity</label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" name="book_qty" id="book_qty" placeholder="Book Quantity" required="" value="<?= $row['book_qty'];?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="available_qty" class="col-sm-4 control-label">Available Quantity</label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" name="available_qty" id="available_qty" placeholder="Available Quantity" required="" value="<?= $row['available_qty'];?>">
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
    <?php
    }

    if (isset($_POST['update_book'])) {
    $book_id = $_POST['book_id'];
    $book_name = $_POST['book_name'];
    $book_author_name = $_POST['book_author_name'];
    $book_publications_name = $_POST['book_publications_name'];
    $book_purchase_date = $_POST['book_purchase_date'];
    $book_price = $_POST['book_price'];
    $book_qty = $_POST['book_qty'];
    $available_qty = $_POST['available_qty'];
    
    $result = mysqli_query($dbconn, "UPDATE `books` SET `book_name`= '$book_name',`book_author_name`= '$book_author_name',`book_publications_name`= '$book_publications_name',`book_purchase_date`= '$book_purchase_date',`book_price`= '$book_price',`book_qty`= '$book_qty',`available_qty`= '$available_qty' WHERE `id` = '$book_id'");
    if ($result) {
    ?>
    <script type="text/javascript">
        alert("Book returned successfully.");
        javascript:history.go(-1);
    </script>
    <?php
    } else {
    
    ?>
    <script type="text/javascript">
        alert("Book does not return.");
    </script>
    <?php
    }

}

    ?>
    <?php
    require_once "footer.php";
    ?>