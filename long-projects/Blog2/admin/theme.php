<?php include 'inc/header.php'; ?>
<?php include 'inc/sidebar.php'; ?>
<?php 
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_theme'])) {
    $updateTheme = $theme->updateTheme($_POST);
}
$selectTheme = $theme->selectTheme();
$select_theme = $selectTheme->fetch_assoc();
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Update Theme</h2>
               <div class="block copyblock"> 
                 <form action="" method="POST">
                    <?php if (isset($updateTheme)) { echo $updateTheme; } ?>
                    <table class="form">					
                        <tr>
                            <td>Select Theme</td>
                            <td>
                                <input type="radio" <?= $select_theme['theme'] == 'default' ? 'checked' : ''; ?> name="theme" value="default">Default<br>
                                <input type="radio" <?= $select_theme['theme'] == 'green' ? 'checked' : ''; ?> name="theme" value="green">Green<br>
                                <input type="radio" <?= $select_theme['theme'] == 'red' ? 'checked' : ''; ?> name="theme" value="red">Red
                            </td>
                        </tr>
						<tr>
                            <td></td>
                            <td>
                                <input type="submit" name="update_theme" Value="Update" />
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
        </div>
<?php include 'inc/footer.php'; ?>
