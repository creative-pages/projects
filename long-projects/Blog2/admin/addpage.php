<?php include 'inc/header.php'; ?>
<?php include 'inc/sidebar.php'; ?>
<?php 
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add_page'])) {
    $insertMsg = $forpage->addPage($_POST);
}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Add New Page</h2>
                <div class="block">               
                 <form action="" method="POST">
                    <?php  if (isset($insertMsg)) { echo $insertMsg; } ?>
                    <table class="form">
                        <tr>
                            <td>
                                <label>Title</label>
                            </td>
                            <td>
                                <input type="text" name="name" placeholder="Enter Page Name..." class="medium" />
                                <?php if (isset($forpage->name)) { echo $forpage->name; } ?>
                            </td>
                        </tr>
                     
                        <tr>
                            <td style="vertical-align: top; padding-top: 9px;">
                                <label>Content</label>
                            </td>
                            <td>
                                <textarea name="content" class="tinymce"></textarea>
                                <?php if (isset($forpage->content)) { echo $forpage->content; } ?>
                            </td>
                        </tr>
						<tr>
                            <td></td>
                            <td>
                                <input type="submit" name="add_page" Value="Save" />
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
