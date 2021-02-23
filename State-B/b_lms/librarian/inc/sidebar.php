<!-- LEFT SIDEBAR -->
            <!-- ========================================================= -->
            <div class="left-sidebar">
                <!-- left sidebar HEADER -->
                <div class="left-sidebar-header">
                    <div class="left-sidebar-title">Navigation</div>
                    <div class="left-sidebar-toggle c-hamburger c-hamburger--htla hidden-xs" data-toggle-class="left-sidebar-collapsed" data-target="html">
                        <span></span>
                    </div>
                </div>
                <!-- NAVIGATION -->
                <!-- ========================================================= -->
                <div id="left-nav" class="nano">
                    <div class="nano-content">
                        <nav>
                            <ul class="nav nav-left-lines" id="main-nav">
                                <!--HOME-->
                                <li class="<?= $filename == 'index.php' ? 'active-item' : ''; ?>"><a href="index.php"><i class="fa fa-home" aria-hidden="true"></i><span>Dashboard</span></a></li>
                                <li class="<?= $filename == 'students.php' ? 'active-item' : ''; ?>"><a href="students.php"><i class="fa fa-users" aria-hidden="true"></i><span>Students</span></a></li>
                                <!--books-->
                                <li class="has-child-item <?= $filename == 'add_book.php' ? 'open-item' : '' . $filename == 'manage_book.php' ? 'open-item' : ''; ?> close-item">
                                    <a><i class="fa fa-book" aria-hidden="true"></i><span>Books</span> </a>
                                    <ul class="nav child-nav level-1">
                                        <li class="<?= $filename == 'add_book.php' ? 'active-item' : ''; ?>"><a href="add_book.php">Add Book</a></li>
                                        <li class="<?= $filename == 'manage_book.php' ? 'active-item' : ''; ?>"><a href="manage_book.php">Manage Book</a></li>
                                    </ul>
                                </li>
                                <li class="<?= $filename == 'issue_book.php' ? 'active-item' : ''; ?>"><a href="issue_book.php"><i class="fa fa-book" aria-hidden="true"></i><span>Issue Book</span></a></li>
                                <li class="<?= $filename == 'return_book.php' ? 'active-item' : ''; ?>"><a href="return_book.php"><i class="fa fa-book" aria-hidden="true"></i><span>Return Book</span></a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>