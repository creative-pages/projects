<?php 

require_once "header.php"; 

$blog = new App\classes\BLog();
if (isset($_POST['update_blog'])) {
	$blog->updateBlog($_POST);
}

if (isset($_GET['blog']) && $_GET['blog'] == 'edit') {
    $id = $_GET['id'];
    $selectBlog = $blog->selectBlog($id);
    $row_blog = mysqli_fetch_assoc($selectBlog);
}

$allACat = $blog->allactiveCategory();

?>
                <!-- content HEADER -->
                <!-- ========================================================= -->
                <div class="content-header">
                    <!-- leftside content header -->
                    <div class="leftside-content-header">
                        <ul class="breadcrumbs">
                            <li><i class="fa fa-home" aria-hidden="true"></i><a href="javascript:avoid(0)">Update Blog</a></li>
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
                                    	<h4 class="text-center">Update Blog</h4>
                                    	<hr>
                                        <div class="form-group">
                                            <label for="category_id" class="col-sm-3 control-label">Category Name</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="category_id" id="category_id">
                                                    <option value="">Select Category</option>
                                                    <?php 
                                                    while ($row = mysqli_fetch_assoc($allACat)) {
                                                    ?>
                                                    <option <?= $row['id'] == $row_blog['category_id'] ? 'selected' : '' ?> value="<?= $row['id']; ?>"><?= $row['category_name']; ?></option>
                                                    <?php
                                                    }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="title" class="col-sm-3 control-label">Title</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="title" name="title" placeholder="Category Title" value="<?= $row_blog['title']; ?>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="content" class="col-sm-3 control-label">Content</label>
                                            <div class="col-sm-9">
                                                <textarea class="form-control" name="content" id="content" cols="30" rows="10" placeholder="Category Content"><?= $row_blog['content']; ?></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="photo" class="col-sm-3 control-label">Photo</label>
                                            <div class="col-sm-9">
                                                <input type="file" class="form-control" id="photo" name="photo">
                                                <input type="hidden" name="post_by" value="<?= $_SESSION['name']; ?>">
                                                <input type="hidden" name="id" value="<?= $row_blog['id']; ?>">
                                                <img style="width: 250px;" src="../uploads/<?= $row_blog['photo']; ?>" alt="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Status</label>
                                            <div class="col-sm-9">
                                                <div class="radio radio-custom radio-success">
                                                    <input type="radio" id="active" name="status" <?= $row_blog['status'] == '1' ? 'checked' : '' ?> value="1">
                                                    <label for="active">Active</label>
													&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="radio" id="inactive" name="status"<?= $row_blog['status'] == '0' ? 'checked' : '' ?> value="0">
                                                    <label for="inactive">Inactive</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-3 col-sm-9">
                                                <button type="submit" class="btn btn-primary" name="update_blog">Update Blog</button>
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