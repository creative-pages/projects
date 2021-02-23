<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add_category'])) {
    $insertMsg = $category->addCategory($_POST);
}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Add New Category</h2>
               <div class="block copyblock"> 
                 <form action="" method="POST">
                    <?php if (isset($insertMsg)) { echo $insertMsg; } ?>
                    <table class="form">					
                        <tr>
                            <td>
                                <input type="text" name="name" placeholder="Enter Category Name..." class="medium" />
                                <?php if (isset($category->name)) { echo $category->name; } ?>
                            </td>
                        </tr>
						<tr> 
                            <td>
                                <input type="submit" name="add_category" Value="Save" />
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
        </div>
<?php include 'inc/footer.php';?>