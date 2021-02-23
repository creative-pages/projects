<?php include 'inc/header.php'; ?>
<?php include 'inc/sidebar.php'; ?>
<?php 
$viewAdminSocial = $titleSlogan->viewAdminSocial();
$social = $viewAdminSocial->fetch_assoc();

if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['update']) {
    $updateSocial = $titleSlogan->updateSocial($_POST);
}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Update Social Media</h2>
                <div class="block">               
                 <form action="" method="POST">
                    <table class="form">					
                        <tr>
                            <td>
                                <label>Facebook</label>
                            </td>
                            <td>
                                <input type="text" name="facebook" value="<?= $social['facebook']; ?>" placeholder="Facebook link.." class="medium" />
                                <?php if (isset($titleSlogan->facebook)) { echo $titleSlogan->facebook; } ?>
                            </td>
                        </tr>
						 <tr>
                            <td>
                                <label>Twitter</label>
                            </td>
                            <td>
                                <input type="text" name="twitter" value="<?= $social['twitter']; ?>" placeholder="Twitter link.." class="medium" />
                                <?php if (isset($titleSlogan->twitter)) { echo $titleSlogan->twitter; } ?>
                            </td>
                        </tr>
						
						 <tr>
                            <td>
                                <label>LinkedIn</label>
                            </td>
                            <td>
                                <input type="text" name="linkedin" value="<?= $social['linkedin']; ?>" placeholder="LinkedIn link.." class="medium" />
                                <?php if (isset($titleSlogan->linkedin)) { echo $titleSlogan->linkedin; } ?>
                            </td>
                        </tr>
						
						 <tr>
                            <td>
                                <label>Google Plus</label>
                            </td>
                            <td>
                                <input type="text" name="google" value="<?= $social['google']; ?>" placeholder="Google link.." class="medium" />
                                <?php if (isset($titleSlogan->google)) { echo $titleSlogan->google; } ?>
                            </td>
                        </tr>
						
						 <tr>
                            <td></td>
                            <td>
                                <input type="submit" name="update" Value="Update" />
                            </td>
                        </tr>
                    </table>
                    <?php if (isset($updateSocial)) { echo $updateSocial; } ?>
                    </form>
                </div>
            </div>
        </div>
<?php include 'inc/footer.php'; ?>