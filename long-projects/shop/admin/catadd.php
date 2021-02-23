<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $categoryName = $_POST['categoryName'];
    $insertCategory = $category->insertCategory($categoryName);
}


?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Add New Category</h2>
               <div class="block copyblock"> 
                 <form action="" method="POST">
                    <table class="form">					
                        <tr>
                            <td>
                                <input type="text" name="categoryName" placeholder="Enter Category Name..." class="medium" />
                            </td>
                        </tr>
						<tr> 
                            <td>
                                <input type="submit" Value="Save" />
                            </td>
                        </tr>
                    </table>
                    <?php if (isset($insertCategory)) { echo $insertCategory; } ?>
                    </form>
                </div>
            </div>
        </div>
<?php include 'inc/footer.php';?>