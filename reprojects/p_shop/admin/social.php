<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 
$viewSocial = $footerarea->viewSocial();
$view_social = $viewSocial->fetch_assoc();
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_social'])) {
    $updateSocial = $footerarea->updateSocial($_POST);
}
?>
<div class="grid_10">
    <div class="box round first grid">
        <h2>Update Social Media</h2>
        <div class="block">               
         <form action="" method="POST">
            <?php if (isset($updateSocial)) { echo $updateSocial; } ?>
            <table class="form">					
                <tr>
                    <td>
                        <label>Facebook</label>
                    </td>
                    <td>
                        <input type="hidden" name="id" value="<?= $view_social['id']; ?>">
                        <input type="text" name="facebook" value="<?= $view_social['facebook']; ?>" placeholder="Facebook link.." class="medium" />
                        <?php if (isset($footerarea->facebook)) { echo $footerarea->facebook; } ?>
                    </td>
                </tr>
				 <tr>
                    <td>
                        <label>Twitter</label>
                    </td>
                    <td>
                        <input type="text" name="twitter" value="<?= $view_social['twitter']; ?>" placeholder="Twitter link.." class="medium" />
                        <?php if (isset($footerarea->twitter)) { echo $footerarea->twitter; } ?>
                    </td>
                </tr>
				
				 <tr>
                    <td>
                        <label>LinkedIn</label>
                    </td>
                    <td>
                        <input type="text" name="google" value="<?= $view_social['google']; ?>" placeholder="Google Plus link.." class="medium" />
                        <?php if (isset($footerarea->google)) { echo $footerarea->google; } ?>
                    </td>
                </tr>
				
				 <tr>
                    <td>
                        <label>Google Plus</label>
                    </td>
                    <td>
                        <input type="text" name="mail" value="<?= $view_social['mail']; ?>" placeholder="Mail link" class="medium" />
                        <?php if (isset($footerarea->mail)) { echo $footerarea->mail; } ?>
                    </td>
                </tr>
				
				 <tr>
                    <td></td>
                    <td>
                        <input type="submit" name="update_social" Value="Update" />
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </div>
</div>
<?php include 'inc/footer.php';?>