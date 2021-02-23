<?php require_once 'header.php'; ?>

      <!-- Blog Entries Column -->
      <div class="col-md-8">

        <h1 class="my-4">
          Blog Post
        </h1>

        <!-- Blog Post -->
        <?php 
          if (isset($_GET['single_post'])) {
            $post_id = $_GET['single_post'];
            $post_by_id = $blog->singleBlog($post_id);
            $post_row = mysqli_fetch_assoc($post_by_id);
              ?>
              <div class="card mb-4">
                <img style="height: 250px;" class="card-img-top" src="uploads/<?= $post_row['image']; ?>" alt="Card image cap">
                <div class="card-body">
                  <h2 class="card-title"><?= $post_row['title']; ?></h2>
                  <p class="card-text"><?= $post_row['content']; ?></p>
                </div>
                <div class="card-footer text-muted">
                  Posted on <?= date("M d, Y", strtotime($post_row['created_at'])); ?> by
                  <?= $post_row['post_by']; ?>
                </div>
              </div>

              <?php
          } else {
            header("Location: index.php");
          }
        ?>

      </div>

      <?php require_once 'sidebar.php'; ?>

<?php require_once 'footer.php'; ?>