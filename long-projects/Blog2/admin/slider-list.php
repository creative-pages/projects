<?php include 'inc/header.php'; ?>
<?php include 'inc/sidebar.php'; ?>
<?php 
if (isset($_GET['deleteSlder'])) {
	$id = $_GET['deleteSlder'];
	$old_file = $_GET['old_file'];
	$slider->deleteSlder($id, $old_file);
}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Category List</h2>
                <div class="block">        
                    <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>Serial No.</th>
							<th>Title</th>
							<th>Image</th>
							<th>Date</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						$sl = 1;
						$viewSlider = $slider->viewSlider();
						while ($row = $viewSlider->fetch_assoc()) {
						?>
						<tr>
							<td><?= $sl; ?></td>
							<td><?= $row['title']; ?></td>
							<td>
								<img style="width: 200px;" src="uploads/slider/<?= $row['image']; ?>" alt="">
							</td>
							<td><?= $format->formatDate($row['date']); ?></td>
							<td>
								<a href="update-slider.php?sliderId=<?= $row['id']; ?>">Edit</a> || <a onclick="return confirm('Are you sure to delete?');" href="?deleteSlder=<?= $row['id']; ?>&old_file=<?= $row['image']; ?>">Delete</a>
							</td>
						</tr>
						<?php
						$sl++;
						}
						?>
					</tbody>
				</table>
               </div>
            </div>
        </div>
<?php include 'inc/footer.php'; ?>
