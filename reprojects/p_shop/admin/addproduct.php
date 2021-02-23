<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add_product'])) {
    $name = $_POST['name'];
    $brand_id = $_POST['brand_id'];
    $category_id = $_POST['category_id'];
    $description = $_POST['description'];
    $price = $_POST['price'];
    $image = $_FILES['image']['name'];
    $type = $_POST['type'];

    $insertMsg = $product->addProduct($_POST);
}
?>
<div class="grid_10">
    <div class="box round first grid">
        <h2>Add New Product</h2>
        <div class="block">               
         <form action="" method="post" enctype="multipart/form-data">
            <?php if (isset($insertMsg)) { echo $insertMsg; } ?>
            <table class="form">
                <tr>
                    <td>
                        <label>Name</label>
                    </td>
                    <td>
                        <input class="form-control w-50" type="text" name="name" placeholder="Enter Product Name..." value="<?= isset($name) ? $name : ''; ?>" />
                        <?php if (isset($product->name)) { echo $product->name; } ?>
                    </td>
                </tr>
				<tr>
                    <td>
                        <label>Brand</label>
                    </td>
                    <td>
                        <select class="form-control w-50" name="brand_id">
                            <option value="">Select Brand</option>
                            <?php 
                            $allBrand = $brand->allBrand();
                            if ($allBrand) {
                                while ($result = $allBrand->fetch_assoc()) {
                            ?>
                            <option <?= isset($brand_id) && $brand_id == $result['id'] ? 'selected' : ''; ?> value="<?= $result['id']; ?>"><?= $result['name']; ?></option>
                            <?php
                                }
                            }
                            ?>
                        </select>
                        <?php if (isset($product->brand_id)) { echo $product->brand_id; } ?>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Category</label>
                    </td>
                    <td>
                        <select class="form-control w-50" name="category_id">
                            <option value="">Select Category</option>
                            <?php 
                            $allCategory = $category->allCategory();
                            if ($allCategory) {
                                while ($result = $allCategory->fetch_assoc()) {
                            ?>
                            <option <?php if (isset($category_id) && $category_id == $result['id']) { echo "selected"; } ?> value="<?= $result['id']; ?>"><?= $result['name']; ?></option>
                            <?php
                                }
                            }
                            ?>
                        </select>
                        <?php if (isset($product->category_id)) { echo $product->category_id; } ?>
                    </td>
                </tr>
				 <tr>
                    <td style="vertical-align: top; padding-top: 9px;">
                        <label>Description</label>
                    </td>
                    <td>
                        <textarea name="description" class="tinymce"><?= isset($description) ? $description : ''; ?></textarea>
                        <?php if (isset($product->description)) { echo $product->description; } ?>
                    </td>
                </tr>
				<tr>
                    <td>
                        <label>Price</label>
                    </td>
                    <td>
                        <input class="form-control w-50" type="number" name="price" placeholder="Enter Price..." value="<?= isset($price) ? $price : ''; ?>" />
                        <?php if (isset($product->price)) { echo $product->price; } ?>
                    </td>
                </tr>
            
                <tr>
                    <td>
                        <label>Upload Image</label>
                    </td>
                    <td>
                        <input class="form-control w-50" type="file" name="image" />
                        <?php if (isset($product->image)) { echo $product->image; } ?>
                    </td>
                </tr>
				
				<tr>
                    <td>
                        <label>Product Type</label>
                    </td>
                    <td>
                        <select class="form-control w-50" name="type">
                            <option value="">Select Type</option>
                            <option <?= isset($type) && $type == '1' ? 'selected' : ''; ?> value="1">Featured</option>
                            <option <?= isset($type) && $type == '2' ? 'selected' : ''; ?> value="2">Non-Featured</option>
                        </select>
                        <?php if (isset($product->type)) { echo $product->type; } ?>
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


