<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 

if (!isset($_GET['brandId']) || $_GET['brandId'] == NULL) {
    echo '<script>window.location = "brandlist.php";</script>';
} else {
    $id = $_GET['brandId'];
    $selectRow = $brand->selectRow($id);
    $row = $selectRow->fetch_assoc();
}

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $brandName = $_POST['brandName'];
    $brandId = $_POST['brandId'];
    $updateBrand = $brand->updateBrand($brandName, $brandId);
}


?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Add New Brand</h2>
               <div class="block copyblock"> 
                 <form action="" method="POST">
                    <table class="form">					
                        <tr>
                            <td>
                                <input type="text" name="brandName" placeholder="Enter Brand Name..." value="<?= $row['brandName']; ?>" class="medium" />
                                <input type="hidden" name="brandId" value="<?= $row['brandId']; ?>">
                            </td>
                        </tr>
						<tr> 
                            <td>
                                <input type="submit" Value="Save" />
                            </td>
                        </tr>
                    </table>
                    <?php if (isset($updateBrand)) { echo $updateBrand; } ?>
                    </form>
                </div>
            </div>
        </div>
<?php include 'inc/footer.php';?>