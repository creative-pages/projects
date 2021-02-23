<?php
require_once "header.php";
?>
<!-- content HEADER -->
<!-- ========================================================= -->
<div class="content-header">
    <!-- leftside content header -->
    <div class="leftside-content-header">
        <ul class="breadcrumbs">
            <li><i class="fa fa-home" aria-hidden="true"></i><a href="#">Librarian Dashboard</a></li>
        </ul>
    </div>
</div>
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<div class="row animated fadeInUp">
    <div class="col-sm-12">
        <div class="row">
            <?php 
            $data = mysqli_query($dbconn, "SELECT * FROM `students`");
            $total_students = mysqli_num_rows($data);
            ?>
            <!--BOX Style 1-->
            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="panel widgetbox wbox-1 bg-light color-darker-2">
                    <a href ="students.php">
                        <div class="panel-content">
                            <h1 class="title"><i class="fa fa-users">&nbsp;&nbsp; </i><?php echo $total_students; ?> </h1>
                            <h4 class="subtitle">Total Students</h4>
                        </div>
                    </a>
                </div>
            </div>
            <?php 
            $data = mysqli_query($dbconn, "SELECT * FROM `librarian`");
            $total_librarians = mysqli_num_rows($data);
            ?>
            <!--BOX Style 1-->
            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="panel widgetbox wbox-1 bg-light color-darker-2">
                    <a href="students.php">
                        <div class="panel-content">
                            <h1 class="title"><i class="fa fa-users">&nbsp;&nbsp; </i><?php echo $total_librarians; ?> </h1>
                            <h4 class="subtitle">Total Librarians</h4>
                        </div>
                    </a>
                </div>
            </div>
            <?php 
            $data = mysqli_query($dbconn, "SELECT * FROM `books`");
            $total_books = mysqli_num_rows($data);
            $total_books_qty = mysqli_query($dbconn, "SELECT SUM(`book_qty`) AS total FROM `books`");
            $total_books_qty = mysqli_fetch_assoc($total_books_qty);

            $totala_books_qty = mysqli_query($dbconn, "SELECT SUM(`available_qty`) AS atotal FROM `books`");
            $totala_books_qty = mysqli_fetch_assoc($totala_books_qty);
            ?>
            <!--BOX Style 1-->
            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="panel widgetbox wbox-1 bg-light color-darker-2">
                    <a href="manage_book.php">
                        <div class="panel-content">
                            <h1 class="title"><i class="fa fa-users">&nbsp;&nbsp; </i><?php echo $total_books; ?> {<?php echo $total_books_qty['total'] . "} (" . $totala_books_qty['atotal'] . ")"; ?> </h1>
                            <h4 class="subtitle">Total Books</h4>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<?php
require_once "footer.php";
?>