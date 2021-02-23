<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php
if (!isset($_GET['editId']) || $_GET['editId'] == NULL) {
    header("Location: catlist.php");
} else {
    $editId = $_GET['editId'];
    $singleCategory = $category->singleCategory($editId);
    $single_category = $singleCategory->fetch_assoc();
}
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_category'])) {
    $updateMsg = $category->updateCategory($_POST);
}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Update Category</h2>
               <div class="block copyblock"> 
                 <form action="" method="POST">
                    <?php if (isset($updateMsg)) { echo $updateMsg; } ?>
                    <table class="form">					
                        <tr>
                            <td>
                                <input type="hidden" name="category_id" value="<?= $single_category['id']; ?>">
                                <input type="text" name="name" value="<?= $single_category['name']; ?>" placeholder="Enter Category Name..." class="medium" />
                                <?php if (isset($category->name)) { echo $category->name; } ?>
                            </td>
                        </tr>
						<tr> 
                            <td>
                                <input type="submit" name="update_category" Value="Update" />
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
        </div>
<?php include 'inc/footer.php';?>