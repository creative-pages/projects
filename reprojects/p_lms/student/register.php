<?php 
require_once "../dbconn.php";

session_start();

if (isset($_SESSION['student_login'])) {
    header("Location: index.php");
}

if (isset($_POST['register'])) {
    $fname = $_POST['fname'];
    $lname = $_POST['lname'];
    $roll = $_POST['roll'];
    $reg = $_POST['reg'];
    $email = $_POST['email'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $phone = $_POST['phone'];

    $inputErr = array();
    if (empty($fname)) {
        $inputErr['fname'] = "First Name is required.";
    }
    if (empty($lname)) {
        $inputErr['lname'] = "Last Name is required.";
    }
    if (empty($roll)) {
        $inputErr['roll'] = "Roll No. is required.";
    }
    if (empty($reg)) {
        $inputErr['reg'] = "Reg. No. is required.";
    }
    if (empty($email)) {
        $inputErr['email'] = "Email is required.";
    }
    if (empty($username)) {
        $inputErr['username'] = "Username is required.";
    }
    if (empty($password)) {
        $inputErr['password'] = "Password is required.";
    }
    if (empty($phone)) {
        $inputErr['phone'] = "Phone number is required.";
    }
    
    if (count($inputErr) == 0) {
        $email_check = mysqli_query($dbconn, "SELECT * FROM `students` WHERE `email` = '$email'");
        $email_check_row = mysqli_fetch_assoc($email_check);
        if ($email_check_row == 0) {
            $username_check = mysqli_query($dbconn, "SELECT * FROM `students` WHERE `username` = '$username'");
            $username_check_row = mysqli_fetch_assoc($username_check);
            if ($username_check_row == 0) {
                if (strlen($username) > 7) {
                    if (strlen($password) > 7) {
                        $password_hash = password_hash($password, PASSWORD_DEFAULT);
                        $result = mysqli_query($dbconn, "INSERT INTO `students`(`fname`, `lname`, `roll`, `reg`, `email`, `username`, `password`, `status`, `phone`) VALUES ('$fname', '$lname', '$roll', '$reg', '$email', '$username', '$password_hash', '0', '$phone')");
                        if ($result) {
                            $inputErr['success'] = "Data inserted successfully.";
                        } else {
                            $inputErr['failed'] = "Data not inserted.";
                        }
                    } else {
                        $inputErr['password'] = "Password minimum 8 character.";
                    }
                    
                } else {
                    $inputErr['username'] = "Username minimum 8 character.";
                }
                
            } else {
                $inputErr['username'] = "This username has already exits.";
            }
            
        } else {
            $inputErr['email'] = "This email has already exits.";
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
            <h1 class="text-center">Students Registration</h1>
        </div>
        <div class="box">
            <!--SIGN IN FORM-->
            <div class="panel mb-none">
                <div class="panel-content bg-scale-0">
                    <form action="<?= $_SERVER['PHP_SELF'] ?>" method="POST">
                        <?php if (isset($inputErr['success'])) { echo '<div class="alert alert-success">' . $inputErr['success'] . '</div>'; } ?>
                        <?php if (isset($inputErr['failed'])) { echo '<div class="alert alert-warning">' . $inputErr['failed'] . '</div>'; } ?>
                        <div class="form-group mt-md">
                            <span class="input-with-icon">
                                <input type="text" class="form-control" name="fname" placeholder="First Name" value="<?= isset($fname) ? $fname:''; ?>">
                                <?php if (isset($inputErr['fname'])) { echo '<div class="alert alert-warning">' . $inputErr['fname'] . '</div>'; } ?>
                            </span>
                        </div>
                        <div class="form-group mt-md">
                            <span class="input-with-icon">
                                <input type="text" class="form-control" name="lname" placeholder="Last Name" value="<?= isset($lname) ? $lname:''; ?>">
                                <?php if (isset($inputErr['lname'])) { echo '<div class="alert alert-warning">' . $inputErr['lname'] . '</div>'; } ?>
                            </span>
                        </div>
                        <div class="form-group mt-md">
                            <span class="input-with-icon">
                                <input type="number" class="form-control" name="roll" placeholder="Roll No." pattern="[0-9]{6}" value="<?= isset($roll) ? $roll:''; ?>">
                                <?php if (isset($inputErr['roll'])) { echo '<div class="alert alert-warning">' . $inputErr['roll'] . '</div>'; } ?>
                            </span>
                        </div>
                        <div class="form-group mt-md">
                            <span class="input-with-icon">
                                <input type="number" class="form-control" name="reg" placeholder="Regeistraiton No." pattern="[0-9]{6}" value="<?= isset($reg) ? $reg:''; ?>">
                                <?php if (isset($inputErr['reg'])) { echo '<div class="alert alert-warning">' . $inputErr['reg'] . '</div>'; } ?>
                            </span>
                        </div>
                        <div class="form-group mt-md">
                            <span class="input-with-icon">
                                <input type="email" class="form-control" name="email" placeholder="Email" value="<?= isset($email) ? $email:''; ?>">
                                <?php if (isset($inputErr['email'])) { echo '<div class="alert alert-warning">' . $inputErr['email'] . '</div>'; } ?>
                            </span>
                        </div>
                        <div class="form-group">
                            <span class="input-with-icon">
                                <input type="text" class="form-control" name="username" placeholder="Username" value="<?= isset($username) ? $username:''; ?>">
                                <?php if (isset($inputErr['username'])) { echo '<div class="alert alert-warning">' . $inputErr['username'] . '</div>'; } ?>
                            </span>
                        </div>
                        <div class="form-group">
                            <span class="input-with-icon">
                                <input type="password" class="form-control" name="password" placeholder="Password" value="<?= isset($password) ? $password:''; ?>">
                                <?php if (isset($inputErr['password'])) { echo '<div class="alert alert-warning">' . $inputErr['password'] . '</div>'; } ?>
                            </span>
                        </div>
                        <div class="form-group">
                            <span class="input-with-icon">
                                <input type="text" class="form-control" name="phone" placeholder="Phone Number" value="<?= isset($phone) ? $phone:''; ?>" pattern="01[3|4|5|6|7|8|9][0-9]{8}">
                                <?php if (isset($inputErr['phone'])) { echo '<div class="alert alert-warning">' . $inputErr['phone'] . '</div>'; } ?>
                            </span>
                        </div>
                        <div class="form-group">
                            <input class="btn btn-primary btn-block" type="submit" name="register" value="Register">
                        </div>
                        <div class="form-group text-center">
                            Have an account?, <a href="sign-in.php">Sign In</a>
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
