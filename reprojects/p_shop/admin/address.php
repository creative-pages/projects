<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 
$showAddress = $footerarea->showAddress();
$show_address = $showAddress->fetch_assoc();
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['copyright_contact'])) {
    $update_address = $footerarea->updateAddress($_POST);
}
?>
<div class="grid_10">
    <div class="box round first grid">
        <h2>Update Copyright Text</h2>
        <div class="block copyblock"> 
         <form action="" method="POST">
            <?php if (isset($update_address)) { echo $update_address; } ?>
            <table class="form">
                <tr>
                    <td>
                        <textarea name="company_address" class="form-control" placeholder="Enter Copyright Text" rows="5"><?= $show_address['company_address'] ?></textarea>
                        <?php if (isset($footerarea->company_address)) { echo $footerarea->company_address; } ?>
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