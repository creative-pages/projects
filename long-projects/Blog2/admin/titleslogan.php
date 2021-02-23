<?php include 'inc/header.php'; ?>
<?php include 'inc/sidebar.php'; ?>
<?php 
$viewTitleSlogan = $titleSlogan->viewTitleSlogan();
$title_slogan = $viewTitleSlogan->fetch_assoc();

if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['update']) {
    $updateTitleSlogan = $titleSlogan->updateTitleSlogan($_POST);
}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Update Site Title and Description</h2>
                <div class="block sloginblock">               
                 <form action="" method="POST" enctype="multipart/form-data">
                    <table class="form">					
                        <tr>
                            <td>
                                <label>Website Title</label>
                            </td>
                            <td>
                                <input type="text" value="<?= $title_slogan['title']; ?>"  name="title" class="medium" />
                                <?php if (isset($titleSlogan->title)) { echo $titleSlogan->title; } ?>
                            </td>
                        </tr>
						 <tr>
                            <td>
                                <label>Website Slogan</label>
                            </td>
                            <td>
                                <input type="text" value="<?= $title_slogan['slogan']; ?>" name="slogan" class="medium" />
                                <?php if (isset($titleSlogan->slogan)) { echo $titleSlogan->slogan; } ?>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <label>Website Logo</label>
                            </td>
                            <td>
                                <input type="file" name="logo" class="medium" />
                                <input type="hidden" name="old_logo" value="<?= $title_slogan['logo']; ?>" />
                                <?php if (isset($titleSlogan->logo)) { echo $titleSlogan->logo; } ?>
                            </td>
                        </tr>
						 <tr>
                            <td></td>                  
                            <td>
                                <img style="width: 100px;" src="../images/<?= $title_slogan['logo']; ?>" alt="">
                            </td>                  
                         </tr>
						
						 <tr>
                            <td>
                            </td>
                            <td>
                                <input type="submit" name="update" Value="Update" />
                            </td>
                        </tr>
                    </table>
                    <?php if (isset($updateTitleSlogan)) { echo $updateTitleSlogan; } ?>
                    </form>
                </div>
            </div>
        </div>
<?php include 'inc/footer.php'; ?>
