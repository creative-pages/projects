<?php require_once 'header.php'; ?>
<?php 

$blog = new App\classes\Blog();
$category = new App\classes\Category();
$catActiveCat = $blog->allactiveCategory();
$activeBlog = $blog->activeBlog();

?>      
        <?php 
        if (isset($_GET['search'])) {
          $search = $_GET['search'];
          $search = $category->searchPost($search);
          if (mysqli_num_rows($search) > 0) {
            while ($searchPost = mysqli_fetch_assoc($search)) {
          ?>
            <!-- Blog Post -->
            <div class="card mb-4">
              <img class="card-img-top" src="uploads/<?= $searchPost['photo']; ?>" alt="Card image cap">
              <div class="card-body">
                <h3 class="card-title"><?= $searchPost['title']; ?></h3>
                <p class="card-text"><?= substr($searchPost['content'], 1, 200); ?>...</p>
                <a href="post.php?id=<?= $searchPost['id']; ?>" class="btn btn-primary">Read More &rarr;</a>
              </div>
              <div class="card-footer text-muted">
                Posted on <?= date("d-M-y", strtotime($searchPost['date_time'])); ?> by
                <a href="javascript:avoid(0)"><?= $searchPost['post_by']; ?></a>
              </div>
            </div>
          <?php
          }
          } else {
            echo '<br><br><br><br><br><br><h2 class="text-center">No search results found!</h2>';
          }
          
        } else {
        while ($active_Blog = mysqli_fetch_assoc($activeBlog)) {
        ?>
        <!-- Blog Post -->
        <div class="card mb-4">
          <img class="card-img-top" src="uploads/<?= $active_Blog['photo']; ?>" alt="Card image cap">
          <div class="card-body">
            <h3 class="card-title"><?= $active_Blog['title']; ?></h3>
            <p class="card-text"><?= substr($active_Blog['content'], 1, 200); ?>...</p>
            <a href="post.php?id=<?= $active_Blog['id']; ?>" class="btn btn-primary">Read More &rarr;</a>
          </div>
          <div class="card-footer text-muted">
            Posted on <?= date("d-M-y", strtotime($active_Blog['date_time'])); ?> by
            <a href="javascript:avoid(0)"><?= $active_Blog['post_by']; ?></a>
          </div>
        </div>
        <?php
        }
        }
        
        ?>

      </div>

      

<?php 
require_once "widget.php";
require_once "footer.php";
?>