<?php 
require_once "header.php";

if (isset($_POST['add_book'])) {
    $book_name = $_POST['book_name'];
    
    $book_author_name = $_POST['book_author_name'];
    $book_publications_name = $_POST['book_publications_name'];
    $book_purchase_date = $_POST['book_purchase_date'];
    $book_price = $_POST['book_price'];
    $book_qty = $_POST['book_qty'];
    $available_qty = $_POST['available_qty'];
    $librarian_username = $_SESSION['librarian_login'];
    $image = explode(".", $_FILES['book_image']['name']);
    $book_image = date("ymdhis.") . end($image);
    $result = mysqli_query($dbconn, "INSERT INTO `books`(`book_name`, `book_image`, `book_author_name`, `book_publications_name`, `book_purchase_date`, `book_price`, `book_qty`, `available_qty`, `librarian_username`) VALUES ('$book_name', '$book_image', '$book_author_name', '$book_publications_name', '$book_purchase_date', '$book_price', '$book_qty', '$available_qty', '$librarian_username')");
    if ($result) {
        move_uploaded_file($_FILES['book_image']['tmp_name'], "../images/books/" . $book_image);
        $inputErr['success'] = "Book add successfully.";
    } else {
        $inputErr['failed'] = "Book not added!";
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
                            <li><a href="javascript:avid(0)">Add Book</a></li>
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
                                    <form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">
                                        <h5 class="mb-lg text-center">Add Book</h5>
                                        <?php if (isset($inputErr['success'])) { echo '<div class="alert alert-success">' . $inputErr['success'] . '</div>'; } ?>
                                        <?php if (isset($inputErr['failed'])) { echo '<div class="alert alert-warning">' . $inputErr['failed'] . '</div>'; } ?>
                                        <div class="form-group">
                                            <label for="book_name" class="col-sm-4 control-label">Book Name</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="book_name" id="book_name" placeholder="Book Name" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="book_image" class="col-sm-4 control-label">Book Image</label>
                                            <div class="col-sm-8">
                                                <input type="file" class="form-control" name="book_image" id="book_image" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="book_author_name" class="col-sm-4 control-label">Book Author Name</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="book_author_name" id="book_author_name" placeholder="Book Author Name" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="book_publications_name" class="col-sm-4 control-label">Book Publ. Name</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="book_publications_name" id="book_publications_name" placeholder="Book Publ. Name" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="book_purchase_date" class="col-sm-4 control-label">Book Purch. Date</label>
                                            <div class="col-sm-8">
                                                <input type="date" class="form-control" name="book_purchase_date" id="book_purchase_date" placeholder="Book Purch. Date" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="book_price" class="col-sm-4 control-label">Book Price</label>
                                            <div class="col-sm-8">
                                                <input type="number" class="form-control" name="book_price" id="book_price" placeholder="Book Price" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="book_qty" class="col-sm-4 control-label">Book Quantity</label>
                                            <div class="col-sm-8">
                                                <input type="number" class="form-control" name="book_qty" id="book_qty" placeholder="Book Quantity" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="available_qty" class="col-sm-4 control-label">Available Quantity</label>
                                            <div class="col-sm-8">
                                                <input type="number" class="form-control" name="available_qty" id="available_qty" placeholder="Available Quantity" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-4 col-sm-8">
                                                <button type="submit" name="add_book" class="btn btn-primary">Add Book</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<?php 
require_once "footer.php";
?>   