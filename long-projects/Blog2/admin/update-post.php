<?php include 'inc/header.php'; ?>
<?php include 'inc/sidebar.php'; ?>
<?php 
if (!isset($_GET['postId']) || $_GET['postId'] == NULL) {
    header("Location: postlist.php");
} else {
    $id = $_GET['postId'];
    $singlePost = $post->singlePost($id);
    $singlepost = $singlePost->fetch_assoc();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_post'])) {
    $updateMsg = $post->updatePost($_POST);
}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Update Post</h2>
                <div class="block">               
                 <form action="" method="POST" enctype="multipart/form-data">
                    <?php  if (isset($updateMsg)) { echo $updateMsg; } ?>
                    <table class="form">
                        <tr>
                            <td>
                                <label>Title</label>
                            </td>
                            <td>
                                <input type="text" name="title" value="<?= $singlepost['title']; ?>" placeholder="Enter Post Title..." class="medium" />
                                <input type="hidden" name="postId" value="<?= $singlepost['id']; ?>" />
                                <?php if (isset($post->title)) { echo $post->title; } ?>
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
                                    $allCategory = $category->allCategory();
                                    if ($allCategory) {
                                        while ($row = $allCategory->fetch_assoc()) {
                                    ?>
                                    <option <?= $singlepost['category_id'] == $row['id'] ? 'selected' : ''; ?> value="<?= $row['id']; ?>"><?= $row['category_name']; ?></option>
                                    <?php
                                        }
                                    }
                                    ?>
                                </select>
                                <?php if (isset($post->category_id)) { echo $post->category_id; } ?>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top; padding-top: 9px;">
                                <label>Content</label>
                            </td>
                            <td>
                                <textarea name="content" class="tinymce"><?= $singlepost['content']; ?></textarea>
                                <?php if (isset($post->content)) { echo $post->content; } ?>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Upload Image</label>
                            </td>
                            <td>
                                <input type="hidden" name="old_file" value="<?= $singlepost['image']; ?>">
                                <input type="file" name="image" />
                                <?php if (isset($post->image)) { echo $post->image; } ?>
                                <img style="width: 200px;" src="uploads/<?= $singlepost['image']; ?>" alt="">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Tags</label>
                            </td>
                            <td>
                                <input type="hidden" name="author" value="<?= Session::get('username'); ?>" />
                                <input type="text" value="<?= $singlepost['tags']; ?>" placeholder="Enter Post Tags..." class="medium" name="tags" />
                                <?php if (isset($post->tags)) { echo $post->tags; } ?>
                            </td>
                        </tr>
						<tr>
                            <td></td>
                            <td>
                                <input type="submit" name="update_post" Value="Update" />
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
<?php include 'inc/footer.php'; ?>
