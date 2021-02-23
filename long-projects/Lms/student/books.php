<?php require_once "header.php" ?>
<!-- content HEADER -->
<!-- ========================================================= -->
<div class="content-header">
    <!-- leftside content header -->
    <div class="leftside-content-header">
        <ul class="breadcrumbs">
            <li><i class="fa fa-home" aria-hidden="true"></i><a href="index.php">Dashboard</a></li>
            <li><a href="javascript:avoid(0)">Books</a></li>
        </ul>
    </div>
</div>
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<div class="row animated fadeInUp">
    <div class="col-sm-12">
        <div class="panel">
            <div class="panel-content">
                <form class="" action="" method="POST">
                    <div class="row pt-md">
                        <div class="form-group col-sm-9 col-lg-10">
                            <span class="input-with-icon">
                                <input type="text" name="sr_book" class="form-control" id="lefticon" placeholder="Search" required="">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                        <div class="form-group col-sm-3  col-lg-2 ">
                            <button type="submit" name="search_book" class="btn btn-primary btn-block">Search</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <?php 
    if (isset($_POST['search_book'])) {
        $sr_book = $_POST['sr_book'];
    ?>
    <div class="col-sm-12">
        <div class="row">
            <?php 
            $data = mysqli_query($dbconn, "SELECT * FROM `books` WHERE `book_name` LIKE '%$sr_book%'");
            $empty = mysqli_num_rows($data);
            if ($empty > 0) {
            ?>
            <?php
            
            while ($row = mysqli_fetch_assoc($data)) {
            ?>
            <div class="col-sm-4 col-md-3">
                <div class="panel">
                    <div class="panel-content">
                        
                        <img style="width: 220px; height: 250px;" src="../images/books/<?= $row['book_image']; ?>" alt="">
                        <p style="margin-bottom: 0px; margin-top: 10px;">Book Name: <?= $row['book_name']; ?></p>
                        <span>Available Books: <?= $row['available_qty']; ?></span>
                        
                    </div>
                </div>
            </div>
            <?php
            }
            ?>
            <?php
                
            } else {
                echo "<h1 style='text-align: center;'>No search results available.</h1>";
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
            $data = mysqli_query($dbconn, "SELECT * FROM `books`");
            while ($row = mysqli_fetch_assoc($data)) {
            ?>
            <div class="col-sm-4 col-md-3">
                <div class="panel">
                    <div class="panel-content">
                        
                        <img style="width: 220px; height: 250px;" src="../images/books/<?= $row['book_image']; ?>" alt="">
                        <p style="margin-bottom: 0px; margin-top: 10px;">Book Name: <?= $row['book_name']; ?></p>
                        <span>Available Books: <?= $row['available_qty']; ?></span>
                        
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
<?php require_once "footer.php" ?>