<?php 
require_once 'header.php';
?>

<?php 

$category = new App\classes\Category();
$cat = $category->allactiveCategory();

$blog = new App\classes\Blog();

$id = base64_decode($_GET['id']);
$result = $blog->selectRow($id);
$rowv = mysqli_fetch_assoc($result);



if (isset($_POST['update_blog'])) {
	$insertMsg = $blog->updateBlog($_POST);
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
                                        <h2 class="mb-lg text-center">Update Blog</h2>
                                        <?php if (isset($insertMsg)) { echo '<div class="alert alert-success">' . $insertMsg . '</div>'; } ?>
                                        <div class="form-group">
                                            <label for="category_id" class="col-sm-3 control-label">Category</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="category_id" id="category_id">
                                                    <option value="">Select Category</option>
                                            <?php 
                                            while ($row = mysqli_fetch_assoc($cat)) {
                                            
                                            ?>
                                                    <option value="<?= $row['id']; ?>" <?= $row['id'] == $rowv['category_id'] ? 'selected' : ''; ?>><?= $row['category_name']; ?></option>
                                            <?php
                                            }
                                            ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="title" class="col-sm-3 control-label">Blog Title</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="title" class="form-control" id="title" value="<?= $rowv['title']; ?>">
                                                <input type="hidden" name="id" id="title" value="<?= $rowv['id']; ?>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="content" class="col-sm-3 control-label">Blog Content</label>
                                            <div class="col-sm-9">
                                                <textarea class="form-control" name="content" id="content" cols="50" rows="10"><?= $rowv['content']; ?></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="photo" class="col-sm-3 control-label">Blog Photo</label>
                                            <div class="col-sm-9">
                                                <input type="file" name="photo" class="form-control" id="photo">
                                                <img style="width: 200px; height: 100px;" src="../uploads/<?= $rowv['photo']; ?>" alt="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                        	<label for="status" class="col-sm-3 control-label">Blog Status</label>
                                        	<div class="col-sm-9">
                                        		<div class="radio radio-custom radio-danger">
                                                    <input type="radio" id="active" name="status" value="1" <?= $rowv['status'] == '1' ? 'checked' : ''; ?> required="">
                                                    <label for="active">Active</label>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="radio" id="inactive" name="status" value="0" <?= $rowv['status'] == '0' ? 'checked' : ''; ?> required="">
                                                    <label for="inactive">Inactive</label>
                                                </div>
                                        	</div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-3 col-sm-9">
                                                <button type="submit" name="update_blog" class="btn btn-primary">Update Blog</button>
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