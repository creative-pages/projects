<?php require_once 'header.php'; ?>
<?php 

$blog = new App\classes\Blog();
$category = new App\classes\Category();
$catActiveCat = $blog->allactiveCategory();

$catid = $_GET['id'];
$catPost = $category->catPost($catid);


?>

        <?php 
        while ($cat_Post = mysqli_fetch_assoc($catPost)) {
        ?>
        <!-- Blog Post -->
        <div class="card mb-4">
          <img class="card-img-top" src="uploads/<?= $cat_Post['photo']; ?>" alt="Card image cap">
          <div class="card-body">
            <h3 class="card-title"><?= $cat_Post['title']; ?></h3>
            <p class="card-text"><?= substr($cat_Post['content'], 1, 200); ?>...</p>
            <a href="post.php?id=<?= $cat_Post['id']; ?>" class="btn btn-primary">Read More &rarr;</a>
          </div>
          <div class="card-footer text-muted">
            Posted on <?= date("d-M-y", strtotime($cat_Post['date_time'])); ?> by
            <a href="javascript:avoid(0)"><?= $cat_Post['post_by']; ?></a>
          </div>
        </div>
        <?php
        }
        ?>

        <!-- Pagination -->
        <ul class="pagination justify-content-center mb-4">
          <li class="page-item">
            <a class="page-link" href="#">&larr; Older</a>
          </li>
          <li class="page-item disabled">
            <a class="page-link" href="#">Newer &rarr;</a>
          </li>
        </ul>

      </div>

      

<?php 
require_once "widget.php";
require_once "footer.php";
?>