<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 
$viewCopyContact = $footerarea->viewCopyContact();
$viewCopy_contact = $viewCopyContact->fetch_assoc();
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['copyright_contact'])) {
    $updateCopyContact = $footerarea->updateCopyContact($_POST);
}
?>
<div class="grid_10">
    <div class="box round first grid">
        <h2>Update Copyright Text</h2>
        <div class="block copyblock"> 
         <form action="" method="POST">
            <?php if (isset($updateCopyContact)) { echo $updateCopyContact; } ?>
            <table class="form">					
                <tr>
                    <td>
                        <input type="hidden" name="id" value="<?= $viewCopy_contact['id'] ?>">
                        <input type="text" name="number_one" value="<?= $viewCopy_contact['number_one'] ?>" pattern="01[3|4|5|6|7|8|9][0-9]{8}" placeholder="Enter first number" class="large" />
                        <?php if (isset($footerarea->number_one)) { echo $footerarea->number_one; } ?>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="number_two" value="<?= $viewCopy_contact['number_two'] ?>" pattern="01[3|4|5|6|7|8|9][0-9]{8}" placeholder="Enter second number" class="large" />
                        <?php if (isset($footerarea->number_two)) { echo $footerarea->number_two; } ?>
                    </td>
                </tr>     
                <tr>
                    <td>
                        <textarea name="copy_right" class="form-control" placeholder="Enter Copyright Text" rows="5"><?= $viewCopy_contact['copy_right'] ?></textarea>
                        <?php if (isset($footerarea->copy_right)) { echo $footerarea->copy_right; } ?>
                    </td>
                </tr>
				
				 <tr> 
                    <td>
                        <input type="submit" name="copyright_contact" Value="Update" />
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </div>
</div>
<?php include 'inc/footer.php';?>