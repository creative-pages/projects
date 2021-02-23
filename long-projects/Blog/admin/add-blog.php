<?php 
require_once 'header.php';
?>

<?php 

$category = new App\classes\Category();
$cat = $category->allactiveCategory();

$blog = new App\classes\Blog();

if (isset($_POST['add_blog'])) {
	$insertMsg = $blog->addBlog($_POST);
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
                    <div class="col-sm-8 col-sm-offset-2">
                        <div class="panel">
                        <div class="panel-content">
                            <div class="row">
                                <div class="col-md-12">
                                    <form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">
                                        <h2 class="mb-lg text-center">Add Blog</h2>
                                        <?php if (isset($insertMsg)) { echo '<div class="alert alert-success">' . $insertMsg . '</div>'; } ?>
                                        <div class="form-group">
                                            <label for="category_id" class="col-sm-3 control-label">Category</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="category_id" id="category_id">
                                                    <option value="">Select Category</option>
                                            <?php 
                                            while ($row = mysqli_fetch_assoc($cat)) {
                                            
                                            ?>
                                                    <option value="<?= $row['id']; ?>"><?= $row['category_name']; ?></option>
                                            <?php
                                            }
                                            ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="title" class="col-sm-3 control-label">Blog Title</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="title" class="form-control" id="title" placeholder="Blog Title" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="content" class="col-sm-3 control-label">Blog Content</label>
                                            <div class="col-sm-9">
                                                <textarea class="form-control" name="content" id="content" cols="50" rows="10" placeholder="Blog Content"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="photo" class="col-sm-3 control-label">Blog Photo</label>
                                            <div class="col-sm-9">
                                                <input type="file" name="photo" class="form-control" id="photo" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                        	<label for="status" class="col-sm-3 control-label">Blog Status</label>
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
                                                <button type="submit" name="add_blog" class="btn btn-primary">Add Blog</button>
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