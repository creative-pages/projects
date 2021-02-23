<?php 
require_once "header.php"; 

$blog = new App\classes\BLog();
if (isset($_POST['add_blog'])) {
	$blog->addBlog($_POST);
}
$allACat = $blog->allactiveCategory();

?>
                <!-- content HEADER -->
                <!-- ========================================================= -->
                <div class="content-header">
                    <!-- leftside content header -->
                    <div class="leftside-content-header">
                        <ul class="breadcrumbs">
                            <li><i class="fa fa-home" aria-hidden="true"></i><a href="javascript:avoid(0)">Add Blog</a></li>
                        </ul>
                    </div>
                </div>
                <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
                <div class="row animated fadeInUp">
                    <div class="col-sm-12 col-md-8 col-md-offset-2">
                    <div class="panel">
                        <div class="panel-content">
                            <div class="row">
                                <div class="col-md-12">
                                    <form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">
                                    	<h4 class="text-center">Add Blog</h4>
                                    	<hr>
                                        <div class="form-group">
                                            <label for="category_id" class="col-sm-3 control-label">Category Name</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="category_id" id="category_id">
                                                    <option value="">Select Category</option>
                                                    <?php 
                                                    while ($row = mysqli_fetch_assoc($allACat)) {
                                                    ?>
                                                    <option value="<?= $row['id']; ?>"><?= $row['category_name']; ?></option>
                                                    <?php
                                                    }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="title" class="col-sm-3 control-label">Title</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="title" name="title" placeholder="Title">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="content" class="col-sm-3 control-label">Content</label>
                                            <div class="col-sm-9">
                                                <textarea class="form-control" name="content" id="content" cols="30" rows="10" placeholder="Content"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="photo" class="col-sm-3 control-label">Photo</label>
                                            <div class="col-sm-9">
                                                <input type="file" class="form-control" id="photo" name="photo">
                                                <input type="hidden" name="post_by" value="<?= $_SESSION['name']; ?>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Status</label>
                                            <div class="col-sm-9">
                                                <div class="radio radio-custom radio-success">
                                                    <input type="radio" id="active" name="status" value="1">
                                                    <label for="active">Active</label>
													&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="radio" id="inactive" name="status" value="0">
                                                    <label for="inactive">Inactive</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-3 col-sm-9">
                                                <button type="submit" class="btn btn-primary" name="add_blog">Add Blog</button>
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