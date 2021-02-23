<?php include 'inc/header.php'; ?>
<?php include 'inc/sidebar.php'; ?>
<?php 
if (Session::get('userRole') !== '1') {
    header("Location: index.php");
}
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add_user'])) {
    $addUser = $user->addUser($_POST);
}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Add User</h2>
               <div class="block copyblock"> 
                 <form action="" method="POST">
                    <?php if (isset($addUser)) { echo $addUser; } ?>
                    <table class="form">					
                        <tr>
                            <td>Username</td>
                            <td>
                                <input type="text" name="username" placeholder="Enter Username..." class="form-control" />
                                <?php if (isset($user->usernameErr)) { echo $user->usernameErr; } ?>
                            </td>
                        </tr>                   
                        <tr>
                            <td>Email</td>
                            <td>
                                <input type="email" name="email" placeholder="Enter Email..." class="form-control" />
                                <?php if (isset($user->emailErr)) { echo $user->emailErr; } ?>
                            </td>
                        </tr>                   
                        <tr>
                            <td>Password</td>
                            <td>
                                <input type="password" name="password" placeholder="Enter Password..." class="form-control" />
                                <?php if (isset($user->passwordErr)) { echo $user->passwordErr; } ?>
                            </td>
                        </tr>     
                        <tr>
                            <td>Role</td>
                            <td>
                                <select name="role" class="form-control">
                                    <option value="">Select role</option>
                                    <option value="1">Admin</option>
                                    <option value="2">Author</option>
                                    <option value="3">Editor</option>
                                </select>
                                <?php if (isset($user->roleErr)) { echo $user->roleErr; } ?>
                            </td>
                        </tr>
						<tr>
                            <td></td>
                            <td>
                                <input type="submit" name="add_user" Value="Add user" />
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
        </div>
<?php include 'inc/footer.php'; ?>
