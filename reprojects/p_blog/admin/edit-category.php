<?php 
require_once "header.php"; 

$category = new App\classes\Category();

$id = $_GET['id'];
$select_cat = $category->selectCategory($id);
$select_cat_row = mysqli_fetch_assoc($select_cat);

if (isset($_POST['update_category'])) {
    $category->updateCategory($_POST);
}


?>
                <!-- content HEADER -->
                <!-- ========================================================= -->
                <div class="content-header">
                    <!-- leftside content header -->
                    <div class="leftside-content-header">
                        <ul class="breadcrumbs">
                            <li><i class="fa fa-home" aria-hidden="true"></i><a href="javascript:avoid(0)">Update Category</a></li>
                        </ul>
                    </div>
                </div>
                <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
                <div class="row animated fadeInUp">
                    <div class="col-sm-12 col-md-6 col-md-offset-3">
                    <div class="panel">
                        <div class="panel-content">
                            <div class="row">
                                <div class="col-md-12">
                                    <form class="form-horizontal" action="" method="POST">
                                    	<h4 class="text-center">Update Category</h4>
                                    	<hr>
                                        <div class="form-group">
                                            <label for="category_name" class="col-sm-3 control-label">Category Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="category_name" name="category_name" value="<?= $select_cat_row['category_name']; ?>">
                                                <input type="hidden" name="id" value="<?= $select_cat_row['id']; ?>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Status</label>
                                            <div class="col-sm-9">
                                                <div class="radio radio-custom radio-success">
                                                    <input type="radio" id="active" name="status" value="1" <?= $select_cat_row['status'] == '1' ? 'checked' : '' ?>>
                                                    <label for="active">Active</label>
													&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="radio" id="inactive" name="status" value="0" <?= $select_cat_row['status'] == '0' ? 'checked' : '' ?>>
                                                    <label for="inactive">Inactive</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-3 col-sm-9">
                                                <button type="submit" class="btn btn-primary" name="update_category">Update Category</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<?php require_once "footer.php"; ?>