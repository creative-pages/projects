<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<div class="grid_10">
    <div class="box round first grid">
        <h2>Slider List</h2>
        <div class="block">  
            <table class="data display datatable" id="example">
			<thead>
				<tr>
					<th>Ser. No.</th>
					<th>Slider Title</th>
					<th>Slider Image</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<?php
				$viewSlider = $slider->viewSlider(); 
				if ($viewSlider) {
					$sl = 1;
					while ($row = $viewSlider->fetch_assoc()) {
				?>
				<tr>
					<td><?= $sl; ?></td>
					<td><?= $row['title']; ?></td>
					<td>
						<img src="uploads/slider/<?= $row['image']; ?>" height="40px" width="60px"/>
					</td>				
					<td>
						<a href="edit-slider.php?editId=<?= $row['id']; ?>">Edit</a> || 
						<a href="?deleteId=<?= $row['id']; ?>" onclick="return confirm('Are you sure to Delete!');" >Delete</a> 
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

<script type="text/javascript">
    $(document).ready(function () {
        setupLeftMenu();
        $('.datatable').dataTable();
		setSidebarHeight();
    });
</script>
<?php include 'inc/footer.php';?>
