<?php 
require_once '../dbconn.php';
session_start();

if (isset($_SESSION['librarian_login'])) {
    header("Location: index.php");
}

if (isset($_POST['students_login'])) {
    $email_username = $_POST['email_username'];
    $password = $_POST['password'];

    $input_errors = array();
    if (empty($email_username)) {
        $input_errors['email_username'] = 'Please enter your email or useranme.';
    }
    if (empty($password)) {
        $input_errors['password'] = 'Please enter your password.';
    }

    if (count($input_errors) == 0) {
        $email_username_check = mysqli_query($conn, "SELECT * FROM `librarian` WHERE `email` = '$email_username' || `username` = '$email_username'");
        if (mysqli_num_rows($email_username_check) > 0) {
            $row = mysqli_fetch_assoc($email_username_check);
            if ($row['password'] == $password) {
                $_SESSION['librarian_login'] = $email_username;
                $_SESSION['librarian_username'] = $row['username'];
                header("Location: index.php");
            } else {
                $input_errors['password'] = 'Password is incorrect!';
            }
        } else {
            $input_errors['email_username'] = 'Email or Username is incorrect!';
        }
    }
}

?>

<!doctype html>
<html lang="en" class="fixed accounts sign-in">


<!-- Mirrored from myiideveloper.com/helsinki/last-version/helsinki_green-dark/src/pages_sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 05 Mar 2019 13:05:33 GMT -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>LMS || Student Login</title>
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
            <h1 class="text-center">LMS</h1>
        </div>
        <div class="box">
            <!--SIGN IN FORM-->
            <div class="panel mb-none">
                <div class="panel-content bg-scale-0">
                    <form action="<?= $_SERVER['PHP_SELF']; ?>" method="POST">
                        <div class="form-group mt-md">
                            <span class="input-with-icon">
                                <input type="text" class="form-control" name="email_username" value="<?= isset($email_username) ? $email_username : ''; ?>" placeholder="Email or Username">
                                <i class="fa fa-envelope"></i>
                            </span>
                            <?php if (isset($input_errors['email_username'])) { echo '<div class="alert alert-warning mb-none">' . $input_errors['email_username'] . '</div>'; } ?>
                        </div>
                        <div class="form-group">
                            <span class="input-with-icon">
                                <input type="password" class="form-control" name="password" placeholder="Password">
                                <i class="fa fa-key"></i>
                            </span>
                            <?php if (isset($input_errors['password'])) { echo '<div class="alert alert-warning mb-none">' . $input_errors['password'] . '</div>'; } ?>
                            <?php if (isset($input_errors['status'])) { echo '<div class="alert alert-warning mb-none">' . $input_errors['status'] . '</div>'; } ?>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-primary btn-block" name="students_login" value="Login">
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
