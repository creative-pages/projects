<?php
ob_start();
session_start(); 

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
}

// menu active
$full_path = explode("/", $_SERVER['PHP_SELF']);
$path = end($full_path);

require_once '../vendor/autoload.php';

$category = new App\classes\Category();
$blog = new App\classes\Blog();

?>

<!doctype html>
<html lang="en" class="fixed left-sidebar-top">


<!-- Mirrored from myiideveloper.com/helsinki/last-version/helsinki_green-dark/src/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 05 Mar 2019 13:03:33 GMT -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>Blog || Dashboard</title>
    <link rel="apple-touch-icon" sizes="120x120" href="assets/favicon/apple-icon-120x120.png">
    <link rel="icon" type="image/png" sizes="192x192" href="assets/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/favicon/favicon-16x16.png">
    <!--load progress bar-->
    <script src="assets/vendor/pace/pace.min.js"></script>
    <link href="assets/vendor/pace/pace-theme-minimal.css" rel="stylesheet" />

    <!--BASIC css-->
    <!-- ========================================================= -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="assets/vendor/animate.css/animate.css">
    <!--SECTION css-->
    <!-- ========================================================= -->
    <!--Notification msj-->
    <link rel="stylesheet" href="assets/vendor/toastr/toastr.min.css">
    <!--Magnific popup-->
    <link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css">
    <!--dataTable-->
    <link rel="stylesheet" href="assets/vendor/data-table/media/css/dataTables.bootstrap.min.css">
    <!--TEMPLATE css-->
    <!-- ========================================================= -->
    <link rel="stylesheet" href="assets/stylesheets/css/style.css">


</head>

<body>
    <div class="wrap">
        <!-- page HEADER -->
        <!-- ========================================================= -->
        <div class="page-header">
            <!-- LEFTSIDE header -->
            <div class="leftside-header">
                <div class="logo">
                    <a href="index.html" class="on-click">
                        <h3 class="ml-md">Blog</h3>
                    </a>
                </div>
                <div id="menu-toggle" class="visible-xs toggle-left-sidebar" data-toggle-class="left-sidebar-open" data-target="html">
                    <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
                </div>
            </div>
            <!-- RIGHTSIDE header -->
            <div class="rightside-header">
                <div class="header-middle"></div>
                <!--USER HEADERBOX -->
                <div class="header-section" id="user-headerbox">
                    <div class="user-header-wrap">
                        <div class="user-photo">
                            <img alt="profile photo" src="assets/images/avatar/avatar_user.jpg" />
                        </div>
                        <div class="user-info">
                            <span class="user-name"><?= isset($_SESSION['name']) ? $_SESSION['name'] : ''; ?></span>
                            <span class="user-profile">Admin</span>
                        </div>
                        <i class="fa fa-plus icon-open" aria-hidden="true"></i>
                        <i class="fa fa-minus icon-close" aria-hidden="true"></i>
                    </div>
                    <div class="user-options dropdown-box">
                        <div class="drop-content basic">
                            <ul>
                                <li> <a href="pages_user-profile.html"><i class="fa fa-user" aria-hidden="true"></i> Profile</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="header-separator"></div>
                <!--Log out -->
                <div class="header-section">
                    <a href="index.php?action=logout" data-toggle="tooltip" data-placement="left" title="Logout"><i class="fa fa-sign-out log-out" aria-hidden="true"></i></a>
                    <?php 
                    if (isset($_GET['action']) && $_GET['action'] == 'logout') {
                        session_destroy();
                        header("Location: login.php");
                    }
                    ?>
                </div>
            </div>
        </div>
        <!-- page BODY -->
        <!-- ========================================================= -->
        <div class="page-body">
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
                                <li class="<?= $path == 'index.php' ? 'active-item' : ''; ?>"><a href="index.php"><i class="fa fa-home" aria-hidden="true"></i><span>Dashboard</span></a></li>
                                <!--Category-->
                                <li class="has-child-item close-item <?= $path == 'add_category.php' || $path == 'manage_category.php'  ? 'open-item' : ''; ?>">
                                    <a><i class="fa fa-pie-chart" aria-hidden="true"></i><span>Category</span> </a>
                                    <ul class="nav child-nav level-1">
                                        <li class="<?= $path == 'add_category.php' ? 'active-item' : ''; ?>"><a href="add_category.php">Add Category</a></li>
                                        <li class="<?= $path == 'manage_category.php' ? 'active-item' : ''; ?>"><a href="manage_category.php">Manage Category</a></li>
                                    </ul>
                                </li>
                                <!--Blog-->
                                <li class="has-child-item close-item <?= $path == 'add_blog.php' || $path == 'manage_blog.php'  ? 'open-item' : ''; ?>">
                                    <a><i class="fa fa-pie-chart" aria-hidden="true"></i><span>Blog</span> </a>
                                    <ul class="nav child-nav level-1">
                                        <li class="<?= $path == 'add_blog.php' ? 'active-item' : ''; ?>"><a href="add_blog.php">Add Blog</a></li>
                                        <li class="<?= $path == 'manage_blog.php' ? 'active-item' : ''; ?>"><a href="manage_blog.php">Manage Blog</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- CONTENT -->
            <!-- ========================================================= -->
            <div class="content">
                <!-- content HEADER -->
                <!-- ========================================================= -->
                <div class="content-header">
                    <!-- leftside content header -->
                    <div class="leftside-content-header">
                        <ul class="breadcrumbs">
                            <li><i class="fa fa-home" aria-hidden="true"></i><a href="#">Dashboard</a></li>
                        </ul>
                    </div>
                </div>