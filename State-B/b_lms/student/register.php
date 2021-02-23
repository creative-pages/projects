<?php 

require_once '../dbconn.php';
session_start();
if (isset($_SESSION['student_login'])) {
    header("Location: sign_in.php");
}

if (isset($_POST['students_register'])) {
    $fname = $_POST['fname'];
    $lname = $_POST['lname'];
    $roll = $_POST['roll'];
    $reg = $_POST['reg'];
    $email = $_POST['email'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $password_hash = password_hash($password, PASSWORD_DEFAULT);
    $phone = $_POST['phone'];

    $input_errors = array();

    if (empty($fname)) {
        $input_errors['fname'] = "First name field is required!";
    }
    if (empty($lname)) {
        $input_errors['lname'] = "Last name field is required!";
    }
    if (empty($roll)) {
        $input_errors['roll'] = "Enter roll number.";
    }
    if (empty($reg)) {
        $input_errors['reg'] = "Enter regstration number.";
    }
    if (empty($email)) {
        $input_errors['email'] = "Email is required!";
    }
    if (empty($username)) {
        $input_errors['username'] = "Username is required!";
    }
    if (empty($password)) {
        $input_errors['password'] = "Enter your password.";
    }
    if (empty($phone)) {
        $input_errors['phone'] = "Enter your phone.";
    }

    
    if (count($input_errors) == 0) {
        $email_check = mysqli_query($conn, "SELECT * FROM `students` WHERE `email` = '$email'");
        if (mysqli_num_rows($email_check) == 0) {
            $username_check = mysqli_query($conn, "SELECT * FROM `students` WHERE `username` = '$username'");
            if (mysqli_num_rows($username_check) == 0) {
                if (strlen($username) > 5) {
                    if (strlen($password) > 5) {
                        $sql = "INSERT INTO `students`(`fname`, `lname`, `roll`, `reg`, `email`, `username`, `password`, `phone`) VALUES ('$fname', '$lname', '$roll', '$reg', '$email', '$username', '$password_hash', '$phone')";
                        $result = mysqli_query($conn, $sql);
                        if ($result) {
                            $success = "Registration successfull.";
                        } else {
                            $error = "Registration failed!";
                        }
                    } else {
                        $input_errors['password'] = "Password should be minimum 6 characters!";
                    }
                } else {
                    $input_errors['username'] = "Username should be minimum 6 characters!";
                }
            } else {
                $input_errors['username'] = "This username have already exist!";
            }
        } else {
            $input_errors['email'] = "This email have already exist!";
        }
    }

}

?>

<!doctype html>
<html lang="en" class="fixed accounts sign-in">


<!-- Mirrored from myiideveloper.com/helsinki/last-version/helsinki_green-dark/src/pages_register.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 05 Mar 2019 13:06:17 GMT -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>LMS || Student Register</title>
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
            <?php 
            if (isset($success)) {
                echo '<div class="alert alert-success fade in">
                <a href="#" class="close" data-dismiss="alert">×</a>' . $success . '</div>';
            } elseif (isset($error)) {
                echo '<div class="alert alert-warning fade in">
                <a href="#" class="close" data-dismiss="alert">×</a>' . $error . '</div>';
            }
            ?>
        </div>
        <div class="box">
            <!--SIGN IN FORM-->
            <div class="panel mb-none">
                <div class="panel-content bg-scale-0">
                    <form action="<?= $_SERVER['PHP_SELF']; ?>" method="POST">
                        <div class="form-group mt-md">
                            <span class="input-with-icon">
                                <input type="text" class="form-control" name="fname" value="<?= isset($fname) ? $fname : ''; ?>" placeholder="First Name">
                                <i class="fa fa-user"></i>
                            </span>
                            <?php if (isset($input_errors['fname'])) { echo '<div class="alert alert-warning mb-none">' . $input_errors['fname'] . '</div>'; } ?>
                        </div>
                        <div class="form-group mt-md">
                            <span class="input-with-icon">
                                <input type="text" class="form-control" name="lname" value="<?= isset($lname) ? $lname : ''; ?>" placeholder="Last Name">
                                <i class="fa fa-user"></i>
                            </span>
                            <?php if (isset($input_errors['lname'])) { echo '<div class="alert alert-warning mb-none">' . $input_errors['lname'] . '</div>'; } ?>
                        </div>
                        <div class="form-group mt-md">
                            <span class="input-with-icon">
                                <input type="text" class="form-control" name="roll" value="<?= isset($roll) ? $roll : ''; ?>" pattern="[0-9]{6}" placeholder="Roll">
                                <i class="fa fa-envelope"></i>
                            </span>
                            <?php if (isset($input_errors['roll'])) { echo '<div class="alert alert-warning mb-none">' . $input_errors['roll'] . '</div>'; } ?>
                        </div>
                        <div class="form-group mt-md">
                            <span class="input-with-icon">
                                <input type="text" class="form-control" name="reg" value="<?= isset($reg) ? $reg : ''; ?>" pattern="[0-9]{6}" placeholder="Reg. No.">
                                <i class="fa fa-envelope"></i>
                            </span>
                            <?php if (isset($input_errors['reg'])) { echo '<div class="alert alert-warning mb-none">' . $input_errors['reg'] . '</div>'; } ?>
                        </div>
                        <div class="form-group">
                            <span class="input-with-icon">
                                <input type="email" class="form-control" name="email" value="<?= isset($email) ? $email : ''; ?>" placeholder="Email">
                                <i class="fa fa-key"></i>
                            </span>
                            <?php if (isset($input_errors['email'])) { echo '<div class="alert alert-warning mb-none">' . $input_errors['email'] . '</div>'; } ?>
                        </div>
                        <div class="form-group">
                            <span class="input-with-icon">
                                <input type="text" class="form-control" name="username" value="<?= isset($username) ? $username : ''; ?>" placeholder="Username">
                                <i class="fa fa-key"></i>
                            </span>
                            <?php if (isset($input_errors['username'])) { echo '<div class="alert alert-warning mb-none">' . $input_errors['username'] . '</div>'; } ?>
                        </div>
                        <div class="form-group">
                            <span class="input-with-icon">
                                <input type="password" class="form-control" name="password" placeholder="Password">
                                <i class="fa fa-key"></i>
                            </span>
                            <?php if (isset($input_errors['password'])) { echo '<div class="alert alert-warning mb-none">' . $input_errors['password'] . '</div>'; } ?>
                        </div>
                        <div class="form-group">
                            <span class="input-with-icon">
                                <input type="text" class="form-control" name="phone" value="<?= isset($phone) ? $phone : ''; ?>" pattern="01[3|4|5|6|7|8|9][0-9]{8}" placeholder="01*********">
                                <i class="fa fa-key"></i>
                            </span>
                            <?php if (isset($input_errors['phone'])) { echo '<div class="alert alert-warning mb-none">' . $input_errors['phone'] . '</div>'; } ?>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-primary btn-block" name="students_register" value="Register">
                        </div>
                        <div class="form-group text-center">
                            Have an account?, <a href="sign_in.php">Sign In</a>
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


<!-- Mirrored from myiideveloper.com/helsinki/last-version/helsinki_green-dark/src/pages_register.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 05 Mar 2019 13:06:17 GMT -->
</html>
