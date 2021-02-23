<?php 
require_once "vendor/autoload.php";

$cat = new App\classes\Category();
$category = $cat->allactiveCategory();

$cat_id = $_GET['id'];
$catPost = $cat->catPost($cat_id);

?>

<?php require_once "header.php"; ?>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-8">

        <h1 class="my-4">
        </h1>

        <?php 
        while ($row = mysqli_fetch_assoc($catPost)) {
        
        ?>
        <div class="card mb-4">
          <img class="card-img-top" src="uploads/<?= $row['photo']; ?>" alt="Card image cap">
          <div class="card-body">
            <h2 class="card-title"><?= $row['title']; ?></h2>
            <p class="card-text"><?= substr($row['content'], 0, 200); ?></p>
            <a href="post.php?id=<?= $row['id']; ?>" class="btn btn-primary">Read More &rarr;</a>
          </div>
          <div class="card-footer text-muted">
            Posted on <?= date("d-M-y", strtotime($row['create_time'])); ?> by
            <a href="#"><?= $row['name']; ?></a>
          </div>
        </div>
        <?php
        }
        ?>

      </div>

<?php include "widget.php"; ?>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->



<?php require_once "footer.php";?>