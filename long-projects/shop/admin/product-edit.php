<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 

$allCategory = $category->showCategory();
$allBrand = $brand->showBrand();
if (!isset($_GET['productEditId']) || $_GET['productEditId'] == NULL) {
    echo '<script>window.location = "productlist.php";</script>';
} else {
    $id = $_GET['productEditId'];
    $singleProduct = $product->singleProduct($id);
    $singleRow = $singleProduct->fetch_assoc();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_product'])) {
    $updateMsg = $product->updateProduct($_POST, $_FILES);
}

?>
<div class="grid_10">
    <div class="box round first grid">
        <h2>Update Product</h2>
        <div class="block">               
         <form action="" method="post" enctype="multipart/form-data">
            <table class="form">
               <?php if (isset($updateMsg)) { echo $updateMsg; } ?>
                <tr>
                    <td>
                        <label>Name</label>
                    </td>
                    <td>
                        <input type="text" name="name" value="<?= $singleRow['name']; ?>" placeholder="Enter Product Name..." class="medium" />
                        <input type="hidden" name="id" value="<?= $singleRow['id']; ?>">
                        <input type="hidden" name="old_file" value="<?= $singleRow['image']; ?>">
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
                            <option <?= isset($singleRow['category_id']) ? 'selected' : ''; ?> value="<?= $row['categoryId']; ?>"><?= $row['categoryName']; ?></option>
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
                            <option <?= isset($singleRow['brand_id']) ? 'selected' : ''; ?> value="<?= $row['brandId']; ?>"><?= $row['brandName']; ?></option>
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
                        <textarea name="description" class="tinymce"><?= $singleRow['description']; ?></textarea>
                        <?php if (isset($product->description)) { echo '<div class="alert alert-warning mt-1 w-50">' . $product->description . '</div>'; } ?>
                    </td>
                </tr>
				<tr>
                    <td>
                        <label>Price</label>
                    </td>
                    <td>
                        <input type="number" name="price" value="<?= $singleRow['price']; ?>" placeholder="Enter Price..." class="medium" />
                        <?php if (isset($product->price)) { echo '<div class="alert alert-warning mt-1 w-50">' . $product->price . '</div>'; } ?>
                    </td>
                </tr>
            
                <tr>
                    <td>
                        <label>Upload Image</label>
                    </td>
                    <td>
                        <input type="file" name="image" />
                        <img style="width: 200px;" src="upload/<?= $singleRow['image']; ?>" alt="">
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
                            <option <?= $singleRow['type'] == '1' ? 'selected' : ''; ?> value="1">Featured</option>
                            <option <?= $singleRow['type'] == '2' ? 'selected' : ''; ?> value="2">Non-Featured</option>
                        </select>
                        <?php if (isset($product->type)) { echo '<div class="alert alert-warning mt-1 w-50">' . $product->type . '</div>'; } ?>
                    </td>
                </tr>

				<tr>
                    <td></td>
                    <td>
                        <input type="submit" name="update_product" Value="Update" />
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


