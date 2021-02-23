<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?
<?php 

$allCategory = $category->showCategory();
$allBrand = $brand->showBrand();

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add_product'])) {
    $isertMsg = $product->insertProduct($_POST, $_FILES);
}

?>
<div class="grid_10">
    <div class="box round first grid">
        <h2>Add New Product</h2>
        <div class="block">               
         <form action="" method="post" enctype="multipart/form-data">
            <table class="form">
               <?php if (isset($isertMsg)) { echo $isertMsg; } ?>
                <tr>
                    <td>
                        <label>Name</label>
                    </td>
                    <td>
                        <input type="text" name="name" placeholder="Enter Product Name..." class="medium" />
                        <?php if (isset($product->name)) { echo '<div class="alert alert-warning mt-1 w-50">' . $product->name . '</div>'; } ?>
                    </td>
                </tr>
				<tr>
                    <td>
                        <label>Category</label>
                    </td>
                    <td>
                        <select id="select" name="category_id">
                            <option value="">Select Category</option>
                            <?php 
                            while ($row = $allCategory->fetch_assoc()) {
                            ?>
                            <option value="<?= $row['categoryId']; ?>"><?= $row['categoryName']; ?></option>
                            <?php
                            }
                            ?>
                        </select>
                        <?php if (isset($product->category_id)) { echo '<div class="alert alert-warning mt-1 w-50">' . $product->category_id . '</div>'; } ?>
                    </td>
                </tr>
				<tr>
                    <td>
                        <label for="brand">Brand</label>
                    </td>
                    <td>
                        <select id="brand" name="brand_id">
                            <option value="">Select Category</option>
                            <?php 
                            while ($row = $allBrand->fetch_assoc()) {
                            ?>
                            <option value="<?= $row['brandId']; ?>"><?= $row['brandName']; ?></option>
                            <?php
                            }
                            ?>
                        </select>
                        <?php if (isset($product->brand_id)) { echo '<div class="alert alert-warning mt-1 w-50">' . $product->brand_id . '</div>'; } ?>
                    </td>
                </tr>
				
				 <tr>
                    <td style="vertical-align: top; padding-top: 9px;">
                        <label>Description</label>
                    </td>
                    <td>
                        <textarea name="description" class="tinymce"></textarea>
                        <?php if (isset($product->description)) { echo '<div class="alert alert-warning mt-1 w-50">' . $product->description . '</div>'; } ?>
                    </td>
                </tr>
				<tr>
                    <td>
                        <label>Price</label>
                    </td>
                    <td>
                        <input type="number" name="price" placeholder="Enter Price..." class="medium" />
                        <?php if (isset($product->price)) { echo '<div class="alert alert-warning mt-1 w-50">' . $product->price . '</div>'; } ?>
                    </td>
                </tr>
            
                <tr>
                    <td>
                        <label>Upload Image</label>
                    </td>
                    <td>
                        <input type="file" name="image" />
                        <?php if (isset($product->image)) { echo '<div class="alert alert-warning mt-1 w-50">' . $product->image . '</div>'; } ?>
                    </td>
                </tr>
                
				<tr>
                    <td>
                        <label>Product Type</label>
                    </td>
                    <td>
                        <select id="select" name="type">
                            <option value="">Select Type</option>
                            <option value="1">Featured</option>
                            <option value="2">Non-Featured</option>
                        </select>
                        <?php if (isset($product->type)) { echo '<div class="alert alert-warning mt-1 w-50">' . $product->type . '</div>'; } ?>
                    </td>
                </tr>

				<tr>
                    <td></td>
                    <td>
                        <input type="submit" name="add_product" Value="Save" />
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
<!-- Load TinyMCE -->
<?php include 'inc/footer.php';?>


