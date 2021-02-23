<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 
if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $brandName = $_POST['brandName'];
    $insertBrand = $brand->insertBrand($brandName);
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
                                <input type="text" name="brandName" placeholder="Enter Brand Name..." class="medium" />
                            </td>
                        </tr>
						<tr> 
                            <td>
                                <input type="submit" Value="Save" />
                            </td>
                        </tr>
                    </table>
                    <?php if (isset($insertBrand)) { echo $insertBrand; } ?>
                    </form>
                </div>
            </div>
        </div>
<?php include 'inc/footer.php';?>