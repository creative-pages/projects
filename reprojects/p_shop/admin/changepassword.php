<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 
$id = Session::get('userId');
$userProfile = $adminLogin->userProfile($id);
$user_profile = $userProfile->fetch_assoc();
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['change_password'])) {
    $updateMsg = $adminLogin->changePassword($_POST);
}
?>
<div class="grid_10">
    <div class="box round first grid">
        <h2>Change Password</h2>
        <div class="block">               
         <form action="" method="POST">
            <?php if (isset($updateMsg)) { echo $updateMsg; } ?>
            <table class="form">					
                <tr>
                    <td>
                        <label>Old Password</label>
                    </td>
                    <td>
                        <input type="hidden" name="password_match" value="<?= $user_profile['password']; ?>">
                        <input type="hidden" name="id" value="<?= $user_profile['id']; ?>">
                        <input type="password" placeholder="Enter Old Password..."  name="old_password" class="medium" />
                        <?php if (isset($adminLogin->old_password)) { echo $adminLogin->old_password; } ?>
                    </td>
                </tr>
				 <tr>
                    <td>
                        <label>New Password</label>
                    </td>
                    <td>
                        <input type="password" placeholder="Enter New Password..." name="new_password" class="medium" />
                        <?php if (isset($adminLogin->password)) { echo $adminLogin->password; } ?>
                    </td>
                </tr>
				 
				
				 <tr>
                    <td>
                    </td>
                    <td>
                        <input type="submit" name="change_password" Value="Update" />
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </div>
</div>
<?php include 'inc/footer.php';?>