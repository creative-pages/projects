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
                <li><a href="javascript:vaoid(0)">Books</a></li>
            </ul>
        </div>
    </div>
    <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
    <div class="row animated fadeInUp">
        <div class="col-sm-12">
            <div class="panel">
                <div class="panel-content">
                    <form class="" action="" method="GET">
                        <div class="row pt-md">
                            <div class="form-group col-sm-9 col-lg-10">
                                <span class="input-with-icon">
                                    <input type="text" class="form-control" name="keyword" placeholder="Search">
                                    <i class="fa fa-search"></i>
                                </span>
                            </div>
                            <div class="form-group col-sm-3  col-lg-2 ">
                                <button type="submit" name="search" class="btn btn-primary btn-block">Search</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <?php 

        if (isset($_GET['search'])) {
            $keyword = $_GET['keyword'];
            $books = mysqli_query($conn, "SELECT * FROM `books` WHERE `book_name` LIKE '%$keyword%'");
            $books_count = mysqli_num_rows($books);
            
            if ($books_count) {
                while ($row = mysqli_fetch_assoc($books)) {
                ?>
                <div class="col-sm-4 col-md-3">
                    <div class="panel">
                        <div class="panel-content">
                            <img style="width: 100%; height: 250px;" src="../librarian/images/<?= $row['book_image'] ?>" alt="">
                            <h5>Book Name: <?= $row['book_name'] ?></h5>
                            <h5>Available Quantity: <?= $row['book_avail_qty'] ?></h5>
                        </div>
                    </div>
                </div>
                <?php
                }
            } else {
                echo '<h1 class="text-center">No search results found!</h1>';
            }
        } else {

            $books = mysqli_query($conn, "SELECT * FROM `books`");
            
            while ($row = mysqli_fetch_assoc($books)) {
            ?>
            <div class="col-sm-4 col-md-3">
                <div class="panel">
                    <div class="panel-content">
                        <img style="width: 100%; height: 250px;" src="../librarian/images/<?= $row['book_image'] ?>" alt="">
                        <h5>Book Name: <?= $row['book_name'] ?></h5>
                        <h5>Available Quantity: <?= $row['book_avail_qty'] ?></h5>
                    </div>
                </div>
            </div>
            <?php
            }
        }
        ?>
        
    </div>
    <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
</div>
<?php include_once 'inc/footer.php' ?>