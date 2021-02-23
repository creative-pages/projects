<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 
$viewCopyContact = $footerarea->viewCopyContact();
$viewCopy_contact = $viewCopyContact->fetch_assoc();
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_logo'])) {
    $updateLogo = $footerarea->updateLogo($_POST);
}
?>
<div class="grid_10">
    <div class="box round first grid">
        <h2>Update Website Logo</h2>
        <div class="block sloginblock">               
         <form action="" method="POST" enctype="multipart/form-data">
            <?php if (isset($updateLogo)) { echo $updateLogo; } ?>
            <table class="form">
                <tr>
                    <td>
                        <label>Website Logo</label>
                    </td>
                    <td>
                        <input type="hidden" name="old_file" value="<?= $viewCopy_contact['logo']; ?>">
                        <input type="file"  name="logo" class="medium" />
                        <?php if (isset($footerarea->image)) { echo $footerarea->image; } ?>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <img style="width: 300px;" src="uploads/logo/<?= $viewCopy_contact['logo']; ?>" alt="">
                    </td>
                </tr>
				 <tr>
                    <td>
                    </td>
                    <td>
                        <input type="submit" name="update_logo" Value="Update" />
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </div>
</div>
<?php include 'inc/footer.php';?>