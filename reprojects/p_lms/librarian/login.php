<?php 
require_once "../dbconn.php";
session_start();

if (isset($_SESSION['librarian_login'])) {
	header("Location: index.php");
}


if (isset($_POST['login'])) {
    $emailusername = $_POST['emailusername'];
    $password = $_POST['password'];

    $result = mysqli_query($dbconn, "SELECT * FROM `librarian` WHERE `email` = '$emailusername' || `username` = '$emailusername'");
    if (mysqli_num_rows($result) == 1) {
        $row =  mysqli_fetch_assoc($result);
        if ($row['password'] == $password) {
            $_SESSION['librarian_login'] = $row['username'];
                header("Location: index.php");
        } else {
            $errorP = "Password not match!";
        }
        
    } else {
        $error = "Email or username is not found.";
    }
    
}



?>

<!doctype html>
<html lang="en" class="fixed accounts sign-in">


<!-- Mirrored from myiideveloper.com/helsinki/last-version/helsinki_green-dark/src/pages_sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 05 Mar 2019 13:05:33 GMT -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>Helsinki</title>
    <link rel="apple-touch-icon" sizes="120x120" href="../assets/favicon/apple-icon-120x120.png">
    <link rel="icon" type="image/png" sizes="192x192" href="../assets/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="../assets/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/favicon/favicon-16x16.png">
    <!--BASIC css-->
    <!-- ========================================================= -->
    <link rel="stylesheet" href="../assets/vendor/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../assets/vendor/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="../assets/vendor/animate.css/animate.css">
    <!--SECTION css-->
    <!-- ========================================================= -->
    <!--TEMPLATE css-->
    <!-- ========================================================= -->
    <link rel="stylesheet" href="../assets/stylesheets/css/style.css">
</head>

<body>
<div class="wrap">
    <!-- page BODY -->
    <!-- ========================================================= -->
    <div class="page-body animated slideInDown">
        <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
        <!--LOGO-->
        <div class="logo">
            <h1 class="text-center">Admin Login</h1>
        </div>
        <div class="box">
            <!--SIGN IN FORM-->
            <div class="panel mb-none">
                <div class="panel-content bg-scale-0">
                    <form method="POST" action="<?= $_SERVER['PHP_SELF']; ?>">
                        <div class="form-group mt-md">
                            <span class="input-with-icon">
                                <input type="text" class="form-control" name="emailusername" placeholder="Email or Username" value="<?= isset($emailusername) ? $emailusername : ''; ?>">
                                <i class="fa fa-envelope"></i>
                            </span>
                        </div>
                        <div class="form-group">
                            <span class="input-with-icon">
                                <input type="password" class="form-control" name="password" placeholder="Password" value="<?= isset($password) ? $password : ''; ?>">
                                <i class="fa fa-key"></i>
                            </span>
                            <?php if (isset($error)) { echo '<div class="mt-sm alert alert-warning">' . $error . '</div>'; } ?>
                            <?php if (isset($errorP)) { echo '<div class="mt-sm alert alert-warning">' . $errorP . '</div>'; } ?>
                            <?php if (isset($errorS)) { echo '<div class="mt-sm alert alert-warning">' . $errorS . '</div>'; } ?>
                        </div>
                        <div class="form-group">
                            <input class="btn btn-primary btn-block" type="submit" name="login" value="Login">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
    </div>
</div>
<!--BASIC scripts-->
<!-- ========================================================= -->
<script src="../assets/vendor/jquery/jquery-1.12.3.min.js"></script>
<script src="../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="../assets/vendor/nano-scroller/nano-scroller.js"></script>
<!--TEMPLATE scripts-->
<!-- ========================================================= -->
<script src="../assets/javascripts/template-script.min.js"></script>
<script src="../assets/javascripts/template-init.min.js"></script>
<!-- SECTION script and examples-->
<!-- ========================================================= -->
</body>


<!-- Mirrored from myiideveloper.com/helsinki/last-version/helsinki_green-dark/src/pages_sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 05 Mar 2019 13:05:37 GMT -->
</html>
