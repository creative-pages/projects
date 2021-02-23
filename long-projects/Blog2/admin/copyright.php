<?php include 'inc/header.php'; ?>
<?php include 'inc/sidebar.php'; ?>
<?php 
$copyRight = $titleSlogan->copyRight();
$copy_right = $copyRight->fetch_assoc();

if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['update']) {
    $updateCopyRight = $titleSlogan->updateCopyRight($_POST);
}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Update Copyright Text</h2>
                <div class="block copyblock"> 
                 <form action="" method="POST">
                    <table class="form">					
                        <tr>
                            <td>
                                <input type="text" value="<?= $copy_right['copy_right']; ?>" placeholder="Enter Copyright Text..." name="copy_right" class="large" />
                                <?php if (isset($titleSlogan->copy_right)) { echo $titleSlogan->copy_right; } ?>
                            </td>
                        </tr>
						
						 <tr> 
                            <td>
                                <input type="submit" name="update" Value="Update" />
                            </td>
                        </tr>
                    </table>
                    <?php if (isset($updateCopyRight)) { echo $updateCopyRight; } ?>
                    </form>
                </div>
            </div>
        </div>
<?php include 'inc/footer.php'; ?>