<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php
if (!isset($_GET['editId']) || $_GET['editId'] == NULL) {
    header("Location: index.php");
} else {
    $editId = $_GET['editId'];
    $singleBrand = $brand->singleBrand($editId);
    $single_brand = $singleBrand->fetch_assoc();
}
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_brand'])) {
    $updateMsg = $brand->updateBrand($_POST);
}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Update Brand</h2>
               <div class="block copyblock"> 
                 <form action="" method="POST">
                    <?php if (isset($updateMsg)) { echo $updateMsg; } ?>
                    <table class="form">					
                        <tr>
                            <td>
                                <input type="hidden" name="brand_id" value="<?= $single_brand['id']; ?>">
                                <input type="text" name="name" value="<?= $single_brand['name']; ?>" placeholder="Enter Brand Name..." class="medium" />
                                <?php if (isset($brand->name)) { echo $brand->name; } ?>
                            </td>
                        </tr>
						<tr> 
                            <td>
                                <input type="submit" name="update_brand" Value="Update" />
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
        </div>
<?php include 'inc/footer.php';?>