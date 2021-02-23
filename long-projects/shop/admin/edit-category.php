<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 

if (!isset($_GET['categoryId']) || $_GET['categoryId'] == NULL) {
    echo "<script>window.location = 'catlist.php';</script>";
} else {
    $id = $_GET['categoryId'];
    $selectRow = $category->selectRow($id);
    $row = $selectRow->fetch_assoc();
}

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $categoryName = $_POST['categoryName'];
    $categoryId = $_POST['categoryId'];
    $updateCategory = $category->updateCategory($categoryName, $categoryId);
}

    
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Update Category</h2>
               <div class="block copyblock"> 
                 <form action="" method="POST">
                    <table class="form">					
                        <tr>
                            <td>
                                <input type="text" name="categoryName" value="<?= $row['categoryName']; ?>" placeholder="Enter Category Name..." class="medium" />
                                <input type="hidden" name="categoryId" value="<?= $row['categoryId']; ?>">
                            </td>
                        </tr>
						<tr> 
                            <td>
                                <input type="submit" Value="Update" />
                            </td>
                        </tr>
                    </table>
                    <?php if (isset($updateCategory)) { echo $updateCategory; } ?>
                    </form>
                </div>
            </div>
        </div>
<?php include 'inc/footer.php';?>