<?php include 'inc/header.php'; ?>
<?php include 'inc/sidebar.php'; ?>
<?php 
if (isset($_GET['deleteUserId'])) {
	$id = $_GET['deleteUserId'];
	$user->deleteUser($id);
}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>User List</h2>
                <div class="block">        
                    <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>Serial No.</th>
							<th>Name</th>
							<th>Username</th>
							<th>Email</th>
							<th>Details</th>
							<th>Role</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						$sl = 1;
						$allUser = $user->allUser();
						while ($row = $allUser->fetch_assoc()) {
						?>
						<tr>
							<td><?= $sl; ?></td>
							<td><?= $row['name']; ?></td>
							<td><?= $row['username']; ?></td>
							<td><?= $row['email']; ?></td>
							<td><?= $row['details']; ?></td>
							<td>
							<?php 
							if ($row['role'] == '1') {
								echo "Admin";
							} elseif ($row['role'] == '2') {
								echo "Author";
							} else {
								echo "Editor";
							}
							?>
							</td>
							<td>
								<a href="view-user.php?userId=<?= $row['id']; ?>">View</a>
								<?php 
								if (Session::get('userRole') == '1') {
								?>
								 || <a onclick="return confirm('Are you sure to delete?');" href="?deleteUserId=<?= $row['id']; ?>">Delete</a>
								<?php
								}
								?>
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
