<?php 
require_once "vendor/autoload.php";

$cat = new App\classes\Category();
$category = $cat->allactiveCategory();
$post = $cat->allactivePost();

?>

<?php require_once "header.php"; ?>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-8 mt-4">

        <!-- Blog Post -->
        <?php 
        if (isset($_GET['search'])) {
          $search = $_GET['search'];
          $sear = $cat->searchPost($search);
          if (mysqli_num_rows($sear) > 0) {
          while ($rows = mysqli_fetch_assoc($sear)) {
        ?>
        <div class="card mb-4">
          <img class="card-img-top" src="uploads/<?= $rows['photo']; ?>" alt="Card image cap">
          <div class="card-body">
            <h2 class="card-title"><?= $rows['title']; ?></h2>
            <p class="card-text"><?= substr($rows['content'], 0, 200); ?></p>
            <a href="post.php?id=<?= $rows['id']; ?>" class="btn btn-primary">Read More &rarr;</a>
          </div>
          <div class="card-footer text-muted">
            Posted on <?= date("d-M-y", strtotime($rows['create_time'])); ?> by
            <a href="#"><?= $rows['name']; ?></a>
          </div>
        </div>
        <?php
      }
          } else {
            echo '<h1 class="text-center">Search not found.</h1>';
          }
        } else {
        ?>

        <?php 
        while ($row = mysqli_fetch_assoc($post)) {
        
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