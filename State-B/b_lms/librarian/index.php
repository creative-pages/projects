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
                        </ul>
                    </div>
                </div>
                <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
                <div class="row animated fadeInUp">
                    <div class="col-12">
                        <div class="row">
                            <!--Total Students-->
                            <?php 
                            $total_students = mysqli_query($conn, "SELECT * FROM `students`");
                            $all_students = mysqli_num_rows($total_students);
                            ?>
                            <div class="col-sm-6 col-md-4 col-lg-3">
                                <div class="panel widgetbox wbox-1 bg-darker-1">
                                    <a href="students.php">
                                        <div class="panel-content">
                                            <h1 class="title color-w"><i class="fa fa-users"></i> <?= $all_students; ?> </h1>
                                            <h4 class="subtitle color-lighter-1">Total Students</h4>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <!--Total Librarian-->
                            <?php 
                            $total_librarian = mysqli_query($conn, "SELECT * FROM `librarian`");
                            $all_librarian = mysqli_num_rows($total_librarian);
                            ?>
                            <div class="col-sm-6 col-md-4 col-lg-3">
                                <div class="panel widgetbox wbox-1 bg-darker-1">
                                    <a href="#">
                                        <div class="panel-content">
                                            <h1 class="title color-w"><i class="fa fa-users"></i> <?= $all_librarian; ?> </h1>
                                            <h4 class="subtitle color-lighter-1">Total Librarians</h4>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <!--Total Books-->
                            <?php 
                            $total_book = mysqli_query($conn, "SELECT * FROM `books`");
                            $all_book = mysqli_num_rows($total_book);

                            $book_qty = mysqli_query($conn, "SELECT SUM(`book_qty`) AS `total` FROM `books`");
                            $total_qty = mysqli_fetch_assoc($book_qty);

                            $avail_book_qty = mysqli_query($conn, "SELECT SUM(`book_avail_qty`) AS `available_total` FROM `books`");
                            $avail_total_qty = mysqli_fetch_assoc($avail_book_qty);
                            ?>
                            <div class="col-sm-6 col-md-4 col-lg-3">
                                <div class="panel widgetbox wbox-1 bg-darker-1">
                                    <a href="manage_book.php">
                                        <div class="panel-content">
                                            <h1 class="title color-w"><i class="fa fa-users"></i> <?= $all_book . ' (' . $total_qty['total'] . ' - ' . $avail_total_qty['available_total'] . ')'; ?> </h1>
                                            <h4 class="subtitle color-lighter-1">Total Books</h4>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
            </div>
<?php include_once 'inc/footer.php' ?>