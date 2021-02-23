<?php 
require_once 'header.php';
?>

<?php 

$category = new App\classes\Category();

if (isset($_POST['add_category'])) {
	$insertMsg = $category->addCategory($_POST);
}


?>
                <!-- content HEADER -->
                <!-- ========================================================= -->
                <div class="content-header">
                    <!-- leftside content header -->
                    <div class="leftside-content-header">
                        <ul class="breadcrumbs">
                            <li><i class="fa fa-home" aria-hidden="true"></i><a href="#">Dashboard</a></li>
                        </ul>
                    </div>
                </div>
                <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
                <div class="row animated fadeInUp">
                    <div class="col-sm-6 col-sm-offset-3">
                        <div class="panel">
                        <div class="panel-content">
                            <div class="row">
                                <div class="col-md-12">
                                    <form class="form-horizontal" action="" method="POST">
                                        <h2 class="mb-lg text-center">Add Category</h2>
                                        <?php if (isset($insertMsg)) { echo '<div class="alert alert-success">' . $insertMsg . '</div>'; } ?>
                                        <div class="form-group">
                                            <label for="category_name" class="col-sm-3 control-label">Category Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="category_name" class="form-control" id="category_name" placeholder="Category Name" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                        	<label for="status" class="col-sm-3 control-label">Category Status</label>
                                        	<div class="col-sm-9">
                                        		<div class="radio radio-custom radio-danger">
                                                    <input type="radio" id="active" name="status" value="1" required="">
                                                    <label for="active">Active</label>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="radio" id="inactive" name="status" value="0" required="">
                                                    <label for="inactive">Inactive</label>
                                                </div>
                                        	</div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-3 col-sm-9">
                                                <button type="submit" name="add_category" class="btn btn-primary">Add Category</button>
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
<?php 
require_once "footer.php";
?>