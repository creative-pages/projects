<?php include 'inc/header.php'; ?>
<?php include 'inc/sidebar.php'; ?>
<?php 

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_page'])) {
    $updateMsg = $forpage->updatePage($_POST);
}

if (!isset($_GET['pageId']) || $_GET['pageId'] == NULL) {
    header("Location: index.php");
} else {
    $id = $_GET['pageId'];
    $selectSinglePage = $forpage->selectSinglePage($id);
    $single_page = $selectSinglePage->fetch_assoc();
}
if (isset($_GET['deletePage'])) {
    $id = $_GET['deletePage'];
    $forpage->deletePage($id);
}

?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Update Page</h2>
                <div class="block">               
                 <form action="" method="POST">
                    <?php  if (isset($updateMsg)) { echo $updateMsg; } ?>
                    <table class="form">
                        <tr>
                            <td>
                                <label>Title</label>
                            </td>
                            <td>
                                <input type="hidden" name="pageId" value="<?= $single_page['id']; ?>" />
                                <input type="text" name="name" value="<?= $single_page['name']; ?>" placeholder="Enter Page Name..." class="medium" />
                                <?php if (isset($forpage->name)) { echo $forpage->name; } ?>
                            </td>
                        </tr>
                     
                        <tr>
                            <td style="vertical-align: top; padding-top: 9px;">
                                <label>Content</label>
                            </td>
                            <td>
                                <textarea name="content" class="tinymce"><?= $single_page['content']; ?></textarea>
                                <?php if (isset($forpage->content)) { echo $forpage->content; } ?>
                            </td>
                        </tr>
						<tr>
                            <td></td>
                            <td>
                                <input type="submit" name="update_page" Value="Save" />
                                <span>
                                    <a href="?deletePage=<?= $single_page['id']; ?>" class="alert alert-warning" onclick="return confirm('Are you sure to delete?');">Dlete</a>
                                </span>
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
        </div>
        <!-- Load TinyMCE -->
        <script src="js/tiny-mce/jquery.tinymce.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                setupTinyMCE();
                setDatePicker('date-picker');
                $('input[type="checkbox"]').fancybutton();
                $('input[type="radio"]').fancybutton();
            });
        </script>
<?php include 'inc/footer.php'; ?>
