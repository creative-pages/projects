<?php
require_once "header.php";
?>
<!-- content HEADER -->
<!-- ========================================================= -->
<div class="content-header">
    <!-- leftside content header -->
    <div class="leftside-content-header">
        <ul class="breadcrumbs">
            <li><i class="fa fa-home" aria-hidden="true"></i><a href="#">Dashboard</a></li>
            <li><a href="javascript:avid(0)">All Books</a></li>
        </ul>
    </div>
</div>
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<div class="row animated fadeInUp">
    <div class="col-sm-12">
        <div class="panel">
            <div class="panel-content">
                <form class="" method="POST" action="">
                    <div class="row pt-md">
                        <div class="form-group col-sm-9 col-lg-10">
                            <span class="input-with-icon">
                                <input type="text" name="search" class="form-control" id="lefticon" placeholder="Search" required="">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                        <div class="form-group col-sm-3  col-lg-2 ">
                            <button type="submit" class="btn btn-primary btn-block" name="search_books">Search</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <?php 
    if (isset($_POST['search_books'])) {
        $search = $_POST['search'];
    ?>
    <div class="col-sm-12">
        <div class="row">
            <?php 
            $booksearch = mysqli_query($dbconn, "SELECT * FROM `books` WHERE `book_name` LIKE '%$search%'");
            $temp = mysqli_num_rows($booksearch);
            if ($temp > 0) {
            ?>
            <?php
            while ($row = mysqli_fetch_assoc($booksearch)) {
            ?>
            <div class="col-sm-3">
                <div class="panel">
                    <div class="panel-content">
                        <img style="width: 220px; height: 250px;" src="../images/books/<?= $row['book_image']; ?>" alt="">
                        <p class="mt-sm mb-sm">Book Name: <?= $row['book_name']; ?></p>
                        <h4>Available Quantity: <?= $row['available_qty']; ?></h4>
                    </div>
                </div>
            </div>
            <?php
            }
            ?> 
            <?php  
            } else {
                echo '<h1 style="text-center">No results found.</h1>';
            }
            ?>
            
        </div>
    </div>
    <?php
    } else {
    ?>
    <div class="col-sm-12">
        <div class="row">
            <?php 
            $books = mysqli_query($dbconn, "SELECT * FROM `books`");
            while ($row = mysqli_fetch_assoc($books)) {
            ?>
            <div class="col-sm-3">
                <div class="panel">
                    <div class="panel-content">
                        <img style="width: 220px; height: 250px;" src="../images/books/<?= $row['book_image']; ?>" alt="">
                        <p class="mt-sm mb-sm">Book Name: <?= $row['book_name']; ?></p>
                        <h4>Available Quantity: <?= $row['available_qty']; ?></h4>
                    </div>
                </div>
            </div>
            <?php
            }
            ?> 
        </div>
    </div>
    <?php
    }
    
    ?>
</div>
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<?php
require_once "footer.php";
?>