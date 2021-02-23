<?php require_once "header.php"; ?>








<div class="container">
	<div class="row">
		<div class="col-sm-6 offset-sm-3">
			<table class="table table-bordered table-striped table-hover mt-2">
				<thead>
					<tr>
						<th>No.</th>
						<th>Name</th>
						<th>Department</th>
						<th>Age</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$sl = 1;
					foreach ($user as $value) {
					?>
					<tr>
						<td><?= $sl; ?></td>
						<td><?= $value['name']; ?></td>
						<td><?= $value['department']; ?></td>
						<td><?= $value['age']; ?></td>
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

<?php require_once "footer.php"; ?>