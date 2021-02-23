<?php 
ob_start();
include_once "../lib/Session.php";
Session::checkSession();
include_once "../lib/Database.php";
include_once "../helpers/Format.php";

spl_autoload_register(function($class_name) {
    include_once '../classes/' . $class_name . ".php";
});
$database = new Database();
$format = new Format();
$adminLogin = new AdminLogin();
$category = new Category();
$brand = new Brand();
$product = new Product();
$cart = new Cart();
$customer = new Customer();
$contact = new Contact();
$slider = new Slider();
$footerarea = new FooterArea();

?>
<?php
  header("Cache-Control: no-cache, must-revalidate");
  header("Pragma: no-cache"); 
  header("Expires: Sat, 26 Jul 1997 05:00:00 GMT"); 
  header("Cache-Control: max-age=2592000");
?>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Admin</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/text.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/grid.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/layout.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/nav.css" media="screen" />
    <link href="css/table/demo_page.css" rel="stylesheet" type="text/css" />
    <!-- BEGIN: load jquery -->
    <script src="js/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery-ui/jquery.ui.core.min.js"></script>
    <script src="js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.ui.accordion.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.effects.core.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.effects.slide.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.ui.mouse.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.ui.sortable.min.js" type="text/javascript"></script>
    <script src="js/table/jquery.dataTables.min.js" type="text/javascript"></script>
    <!-- END: load jquery -->
    <script type="text/javascript" src="js/table/table.js"></script>
    <script src="js/setup.js" type="text/javascript"></script>
	 <script type="text/javascript">
        $(document).ready(function () {
            setupLeftMenu();
		    setSidebarHeight();
        });
    </script>

</head>
<body>
    <div class="container_12">
        <div class="grid_12 header-repeat">
            <div id="branding">
				<div class="floatleft middle">
					<h1>Web Room</h1>
					<p>
                        <a href="http://web-room.epizy.com" target="_blank">www.web-room.epizy.com</a>
                    </p>
				</div>
                <div class="floatright">
                    <div class="floatleft">
                        <img src="img/img-profile.jpg" alt="Profile Pic" /></div>
                    <div class="floatleft marginleft10">
                        <ul class="inline-ul floatleft">
                            <li>Hello <?= Session::get('userName'); ?></li>
                            <?php 
                            if (isset($_GET['logout'])) {
                                Session::destroy();
                            }
                            ?>
                            <li><a href="?logout">Logout</a></li>
                        </ul>
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
        <div class="grid_12">
            <ul class="nav main">
                <li class="ic-dashboard"><a href="index.php"><span>Dashboard</span></a> </li>
                <li class="ic-form-style"><a href="profile.php"><span>User Profile</span></a></li>
				<li class="ic-typography"><a href="changepassword.php"><span>Change Password</span></a></li>
                <?php 
                if (Session::get('userlevel') == '1') {
                ?>
                <li class="ic-typography"><a href="add-user.php"><span>Add User</span></a></li>
                <?php
                }
                ?>
				<li class="ic-grid-tables"><a href="order.php"><span>Order</span></a></li>
                <li class="ic-grid-tables"><a href="inbox.php"><span>
                <?php 
                $totalUnseenMessage = $contact->viewUnseenMessage();
                $totalUnseen = mysqli_num_rows($totalUnseenMessage);
                ?>
                Inbox
                (<?= $totalUnseen; ?>)
                </span></a></li>
                <li class="ic-charts"><a href="http://web-room.epizy.com" target="_blank"><span>Visit Website</span></a></li>
            </ul>
        </div>
        <div class="clear">
        </div>
    