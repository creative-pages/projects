<?php require_once 'header.php'; ?>
<?php 

$blog = new App\classes\Blog();
$catActiveCat = $blog->allactiveCategory();

$id = $_GET['id'];
$single_blog = $blog->blogPost($id);
$single_blog_post = mysqli_fetch_assoc($single_blog);

?>

        <!-- Blog Post -->
        <div class="card mb-4">
          <img class="card-img-top" src="uploads/<?= $single_blog_post['photo']; ?>" alt="Card image cap">
          <div class="card-body">
            <h3 class="card-title"><?= $single_blog_post['title']; ?></h3>
            <p class="card-text"><?= $single_blog_post['content']; ?></p>
          </div>
          <div class="card-footer text-muted">
            Posted on <?= date("d-M-y", strtotime($single_blog_post['date_time'])); ?> by
            <a href="javascript:avoid(0)"><?= $single_blog_post['post_by']; ?></a>
          </div>
        </div>

      </div>

      

<?php 
require_once "widget.php";
require_once "footer.php";
?>