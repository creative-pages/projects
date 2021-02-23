<?php 
require_once "header.php";

if (isset($_POST['save_book'])) {
    $book_name = $_POST['book_name'];
    $book_author_name = $_POST['book_author_name'];
    $book_publications_name = $_POST['book_publications_name'];
    $book_purchase_date = $_POST['book_purchase_date'];
    $book_price = $_POST['book_price'];
    $book_qty = $_POST['book_qty'];
    $available_qty = $_POST['available_qty'];
    $librarian_username = $_SESSION['librarian_username'];
    $book_exte = explode(".", $_FILES['book_image']['name']);
    $book_exte = end($book_exte);
    $book_image = date("Ymdhis.") . $book_exte;

    $result = mysqli_query($dbconn, "INSERT INTO `books`(`book_name`, `book_image`, `book_author_name`, `book_publications_name`, `book_purchase_date`, `book_price`, `book_qty`, `available_qty`, `librarian_username`) VALUES ('$book_name', '$book_image', '$book_author_name', '$book_publications_name', '$book_purchase_date', '$book_price', '$book_qty', '$available_qty', '$librarian_username')");

    if ($result) {
        move_uploaded_file($_FILES['book_image']['tmp_name'], "../images/books/".$book_image);
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
                            <li><i class="fa fa-home" aria-hidden="true"></i><a href="index.php">Librarian Dashboard</a></li>
                            <li><a href="javascript:avoid(0)">Add Book</a></li>
                        </ul>
                    </div>
                </div>
                <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
                <div class="row animated fadeInUp">
                    <div class="col-sm-8 col-sm-offset-2">
                        <div class="panel">
                        <div class="panel-content">
                            <div class="row">
                                <div class="col-md-12">
                                    <h1 class="text-center">LMS</h1>
                                    <form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">
                                        <h5 class="mb-lg text-center">Add Book</h5>
                                        <?php if (isset($insertSuc)) { echo '<div class="alert alert-success col-sm-9 col-sm-offset-3" style="margin-top: 5px;">' . $insertSuc . '</div>'; } ?>
                                        <?php if (isset($isnertErr)) { echo '<div class="alert alert-warning col-sm-9 col-sm-offset-3" style="margin-top: 5px;">' . $isnertErr . '</div>'; } ?>
                                        <div class="form-group">
                                            <label for="book_name" class="col-sm-3 control-label">Book Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="book_name" name="book_name" placeholder="Book Name" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="book_image" class="col-sm-3 control-label">Book Image</label>
                                            <div class="col-sm-9">
                                                <input type="file" class="form-control" id="book_image" name="book_image" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="book_author_name" class="col-sm-3 control-label">Book Author Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="book_author_name" name="book_author_name" placeholder="Book Author Name" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="book_publications_name" class="col-sm-3 control-label">Book Publi. Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="book_publications_name" name="book_publications_name" placeholder="Book Publications Name" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="book_purchase_date" class="col-sm-3 control-label">Book Purchase Date</label>
                                            <div class="col-sm-9">
                                                <input type="date" class="form-control" id="book_purchase_date" name="book_purchase_date" placeholder="Book Publications Date" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="book_price" class="col-sm-3 control-label">Book Price</label>
                                            <div class="col-sm-9">
                                                <input type="number" class="form-control" id="book_price" name="book_price" placeholder="Book Price" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="book_qty" class="col-sm-3 control-label">Book Quantity</label>
                                            <div class="col-sm-9">
                                                <input type="number" class="form-control" id="book_qty" name="book_qty" placeholder="Book Quantity" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="available_qty" class="col-sm-3 control-label">Available Quantity</label>
                                            <div class="col-sm-9">
                                                <input type="number" class="form-control" id="available_qty" name="available_qty" placeholder="Available Quantity" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-3 col-sm-9">
                                                <button type="submit" name="save_book" class="btn btn-primary">Save Book</button>
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
