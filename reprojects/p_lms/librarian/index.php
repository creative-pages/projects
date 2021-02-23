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
                        </ul>
                    </div>
                </div>
                <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
                <div class="row animated fadeInUp">
                    <?php 
                    $students = mysqli_query($dbconn, "SELECT * FROM `students`");
                    $total_students = mysqli_num_rows($students);
                    ?>
                    <!--BOX Style 1-->
                    <div class="col-sm-6 col-md-4 col-lg-3">
                        <div class="panel widgetbox wbox-1 bg-darker-2 color-light">
                            <a href="students.php">
                                <div class="panel-content">
                                    <h1 class="title color-light-1"> <i class="fa fa-users"></i>&nbsp;<?= $total_students; ?></h1>
                                    <h4 class="subtitle">Total Students</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                    <?php 
                    $librarian = mysqli_query($dbconn, "SELECT * FROM `librarian`");
                    $total_librarian = mysqli_num_rows($librarian);
                    ?>
                    <!--BOX Style 1-->
                    <div class="col-sm-6 col-md-4 col-lg-3">
                        <div class="panel widgetbox wbox-1 bg-darker-2 color-light">
                            <a href="javascript:avoid(0)">
                                <div class="panel-content">
                                    <h1 class="title color-light-1"> <i class="fa fa-users"></i>&nbsp;<?= $total_librarian; ?></h1>
                                    <h4 class="subtitle">Total Librarian</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                    <?php 
                    $books = mysqli_query($dbconn, "SELECT * FROM `books`");
                    $total_books = mysqli_num_rows($books);
                    $book_qty = mysqli_query($dbconn, "SELECT SUM(`book_qty`) AS `total` FROM `books`");
                    $book_qtys = mysqli_fetch_assoc($book_qty);
                    $booka_qty = mysqli_query($dbconn, "SELECT SUM(`available_qty`) AS `total` FROM `books`");
                    $booka_qtys = mysqli_fetch_assoc($booka_qty);
                    ?>
                    <!--BOX Style 1-->
                    <div class="col-sm-6 col-md-4 col-lg-3">
                        <div class="panel widgetbox wbox-1 bg-darker-2 color-light">
                            <a href="javascript:avoid(0)">
                                <div class="panel-content">
                                    <h1 class="title color-light-1"> <i class="fa fa-users"></i>&nbsp;<?= $total_books . ' {' . $book_qtys['total'] . ' - ' . $booka_qtys['total'] . '}'; ?></h1>
                                    <h4 class="subtitle">Total Books</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<?php 
require_once "footer.php";
?>   