<?php include 'inc/header.php'; ?>
<?php include 'inc/sidebar.php'; ?>
<?php 
if (!isset($_GET['categoryId']) || $_GET['categoryId'] == NULL) {
    header("Location: catlist.php");
} else {
    $id = $_GET['categoryId'];
    $selectCategory = $category->selectCategory($id);
    $select_category = $selectCategory->fetch_assoc();
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
                                <input type="hidden" name="categoryId" value="<?= $select_category['id']; ?>">
                                <input type="text" name="category_name" value="<?= $select_category['category_name']; ?>" placeholder="Enter Category Name..." class="medium" />
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
<?php include 'inc/footer.php'; ?>
