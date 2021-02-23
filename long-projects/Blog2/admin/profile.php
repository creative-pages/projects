<?php include 'inc/header.php'; ?>
<?php include 'inc/sidebar.php'; ?>
<?php 
$userId = Session::get("userId");
$userRole = Session::get("userRole");
$viewUserProfile = $user->viewUserProfile($userId, $userRole);
$viewProfile = $viewUserProfile->fetch_assoc();

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_user'])) {
    $updateUser = $user->updateUser($_POST);
}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Add User</h2>
               <div class="block copyblock"> 
                 <form action="" method="POST">
                    <?php if (isset($updateUser)) { echo $updateUser; } ?>
                    <table class="form">					
                        <tr>
                            <td>Name</td>
                            <td>
                                <input type="text" name="name" placeholder="Enter your name" value="<?= $viewProfile['name']; ?>" class="form-control" />
                                <?php if (isset($user->nameErr)) { echo $user->nameErr; } ?>
                            </td>
                        </tr>                   
                        <tr>
                            <td>Username</td>
                            <td>
                                <input type="text" name="username" placeholder="Select an username" value="<?= $viewProfile['username']; ?>" class="form-control" />
                                <?php if (isset($user->usernameErr)) { echo $user->usernameErr; } ?>
                            </td>
                        </tr>                   
                        <tr>
                            <td>Email</td>
                            <td>
                                <input type="email" name="email" placeholder="Enter your email" value="<?= $viewProfile['email']; ?>" class="form-control" />
                                <?php if (isset($user->emailErr)) { echo $user->emailErr; } ?>
                            </td>
                        </tr>                   
                        <tr>
                            <td>Details</td>
                            <td>
                                <input type="text" name="details" placeholder="Enter your details" value="<?= $viewProfile['details']; ?>" class="form-control" />
                                <?php if (isset($user->detailsErr)) { echo $user->detailsErr; } ?>
                            </td>
                        </tr>
						<tr>
                            <td></td>
                            <td>
                                <input type="submit" name="update_user" Value="Update user" />
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
        </div>
<?php include 'inc/footer.php'; ?>
