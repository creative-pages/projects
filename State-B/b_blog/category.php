<?php require_once 'header.php'; ?>

      <!-- Blog Entries Column -->
      <div class="col-md-8">

        <h1 class="my-4">
          Blog Post
        </h1>

        <!-- Blog Post -->
        <?php 
          if (isset($_GET['id'])) {
            $category_id = $_GET['id'];
            $post_by_cat = $blog->postByCat($category_id);

            if (mysqli_num_rows($post_by_cat) > 0) {
              while ($row = mysqli_fetch_assoc($post_by_cat)) {
              ?>
              <div class="card mb-4">
                <img style="height: 250px;" class="card-img-top" src="uploads/<?= $row['image']; ?>" alt="Card image cap">
                <div class="card-body">
                  <h2 class="card-title"><?= $row['title']; ?></h2>
                  <p class="card-text"><?= substr($row['content'], 0, 250); ?>...</p>
                  <a href="post.php?single_post=<?= $row['id']; ?>" class="btn btn-primary">Read More &rarr;</a>
                </div>
                <div class="card-footer text-muted">
                  Posted on <?= date("M d, Y", strtotime($row['created_at'])); ?> by
                  <?= $row['post_by']; ?>
                </div>
              </div>

              <?php
              }
              if (mysqli_num_rows($post_by_cat) > 1) {
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
                <?php
                }
            } else {
              echo '<br><br><br><br><br><br><h2 class="text-center text-danger">No posts available in this category!</h2>';
            }
          } else {
            header("Location: index.php");
          }
        ?>

      </div>

      <?php require_once 'sidebar.php'; ?>

<?php require_once 'footer.php'; ?>