<?php include 'inc/header.php'; ?>
<?php include 'inc/sidebar.php'; ?>
<?php 
if (isset($_GET['deletePostId'])) {
	$id = $_GET['deletePostId'];
	$post->deletePost($id);
}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Post List</h2>
                <div class="block">
                    <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>S. N.</th>
							<th>Post Title</th>
							<th>Description</th>
							<th>Category</th>
							<th>Image</th>
							<th>Author</th>
							<th>Tags</th>
							<th>Date</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						$sl = 1;
						$allAdminPanelPost = $post->allAdminPanelPost();
						if ($allAdminPanelPost) {
							while ($allpost = $allAdminPanelPost->fetch_assoc()) {
						?>
						<tr>
							<td style="width: 50px;"><?= $sl; ?></td>
							<td style="width: 150px;"><?= $allpost['title']; ?></td>
							<td style="width: 250px;"><?= $format->textShorten($allpost['content'], 69); ?></td>
							<td><?= $allpost['category_name']; ?></td>
							<td style="width: 100px;">
								<img style="width: 100px;" src="uploads/<?= $allpost['image']; ?>" alt="">
							</td>
							<td style="width: 60px;"><?= $allpost['author']; ?></td>
							<td style="width: 150px;"><?= $allpost['tags']; ?></td>
							<td style="width: 150px;"><?= date("F, j, Y", strtotime($allpost['date'])); ?></td>
							<td>
								<?php 
								if (Session::get('userId') == $allpost['user_id'] || Session::get('userRole') == '1') {
								?>
								<a href="update-post.php?postId=<?= $allpost['id']; ?>">Edit</a> || <a href="?deletePostId=<?= $allpost['id']; ?>" onclick="return confirm('Are you sure to delete?');">Delete</a>
								<?php
								}
								?>
							</td>
						</tr>
						<?php
						$sl++;
							}
						}
						?>
					</tbody>
				</table>
	
               </div>
            </div>
        </div>
<?php include 'inc/footer.php'; ?>
