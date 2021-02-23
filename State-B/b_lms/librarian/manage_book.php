<?php include_once 'inc/header.php' ?>
<?php include_once 'inc/sidebar.php' ?>
<?php
if (isset($_GET['action']) && $_GET['action'] == 'delete_book') {
	$id = base64_decode($_GET['id']);
	$result = mysqli_query($conn, "DELETE FROM `books` WHERE `id` = '$id'");
	if ($result) {
		header("Location: manage_book.php");
	}
}

// for book update

if (isset($_POST['update_book'])) {
	$update_id = $_POST['update_id'];
	$old_file = $_POST['old_file'];

	$book_name = $_POST['book_name'];
	$book_author_name = $_POST['book_author_name'];
	$book_pub_name = $_POST['book_pub_name'];
	$book_pur_date = $_POST['book_pur_date'];
	$book_price = $_POST['book_price'];
	$book_qty = $_POST['book_qty'];

	$book_photo = $_FILES['book_image']['name'];
	$book_exp = explode('.', $book_photo);
	$book_ext = end($book_exp);
	$book_image = date('ymdhis') . '.' . $book_ext;



	if (!empty($book_photo)) {
		$sql = "UPDATE `books` SET `book_name`= '$book_name',`book_image`= '$book_image',`book_author_name`= '$book_author_name',`book_pub_name`= '$book_pub_name',`book_pur_date`= '$book_pur_date',`book_price`= '$book_price',`book_qty`= '$book_qty',`book_avail_qty`= '$book_qty' WHERE `id` = '$update_id'";
		$result = mysqli_query($conn, $sql);
		if ($result) {
			unlink('images/'. $old_file);
			move_uploaded_file($_FILES['book_image']['tmp_name'], 'images/' . $book_image);
			$success = "Book updated successfully.";
		} else {
			$error = "Book does not updated!";
		}
	} else {
		$sql = "UPDATE `books` SET `book_name`= '$book_name',`book_author_name`= '$book_author_name',`book_pub_name`= '$book_pub_name',`book_pur_date`= '$book_pur_date',`book_price`= '$book_price',`book_qty`= '$book_qty',`book_avail_qty`= '$book_qty' WHERE `id` = '$update_id'";
		$result = mysqli_query($conn, $sql);
		if ($result) {
			$success = "Book updated successfully.";
		} else {
			$error = "Book does not updated!";
		}
	}
}

?>
<!-- CONTENT -->
<!-- ========================================================= -->
<div class="content">
	<!-- content HEADER -->
	<!-- ========================================================= -->
	<div class="content-header">
		<!-- leftside content header -->
		<div class="leftside-content-header">
			<ul class="breadcrumbs">
				<li><i class="fa fa-home" aria-hidden="true"></i><a href="index.php">Dashboard</a></li>
				<li><a href="javascript:void(0)">Manage Book</a></li>
			</ul>
		</div>
	</div>
	<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
	<div class="row animated fadeInUp">
		<div class="col-sm-12">
			<h4 class="section-subtitle"><b>Manage Book</b></h4>
			<?php
				if (isset($success)) {
				?>
				<div class="alert alert-success fade in">
					<a href="#" class="close" data-dismiss="alert">×</a>
					<?= $success; ?>
				</div>
				<?php
				} elseif (isset($error)) {
				?>
				<div class="alert alert-warning fade in">
					<a href="#" class="close" data-dismiss="alert">×</a>
					<?= $error; ?>
				</div>
				<?php
				}
			?>
			<div class="panel">
				<div class="panel-content">
					<div class="table-responsive">
						<table id="basic-table" class="data-table table table-striped nowrap table-hover table-bordered" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>Name</th>
									<th>Image</th>
									<th>Author Name</th>
									<th>Publication Name</th>
									<th>Purchase Date</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Avail. Quan.</th>
									<th>Added By</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<?php
								$all_books = mysqli_query($conn, "SELECT * FROM `books` ORDER BY `id` DESC");
								while ($row = mysqli_fetch_assoc($all_books)) {
								?>
								<tr>
									<td><?= $row['book_name']; ?></td>
									<td>
										<img style="width: 100px; height: 50px;" src="images/<?= $row['book_image']; ?>" alt="">
									</td>
									<td><?= $row['book_author_name']; ?></td>
									<td><?= $row['book_pub_name']; ?></td>
									<td><?= date("d-M-Y", strtotime($row['book_pur_date'])); ?></td>
									<td><?= $row['book_price']; ?></td>
									<td><?= $row['book_qty']; ?></td>
									<td><?= $row['book_avail_qty']; ?></td>
									<td><?= $row['librarian_username']; ?></td>
									<td>
										<a href="javascript:void(0)" class="btn btn-info btn-sm" data-toggle="modal" data-target="#book-<?= $row['id']; ?>"><i class="fa fa-eye"></i></a>
										<a href="javascript:void(0)" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#book_update-<?= $row['id']; ?>"><i class="fa fa-edit"></i></a>
										<a href="manage_book.php?id=<?= base64_encode($row['id']); ?>&action=delete_book" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure to delete?')"><i class="fa fa-trash-o"></i></a>
									</td>
								</tr>
								<?php
								}
								?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- book info quick view -->
	<?php
	$all_books = mysqli_query($conn, "SELECT * FROM `books`");
	while ($row = mysqli_fetch_assoc($all_books)) {
	?>
	<div class="modal fade" id="book-<?= $row['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="modal-info-label" style="display: none;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header state modal-info">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					<h4 class="modal-title" id="modal-info-label"><i class="fa fa-book"></i>Book Information</h4>
				</div>
				<div class="modal-body">
					<table class="table table-bordered table-hover">
						<tr>
							<td>Book Name</td>
							<td><?= $row['book_name']; ?></td>
						</tr>
						<tr>
							<td>Book Image</td>
							<td>
								<img style="width: 300px; height: 120px;" src="images/<?= $row['book_image']; ?>" alt="">
							</td>
						</tr>
						<tr>
							<td>Author Name</td>
							<td><?= $row['book_author_name']; ?></td>
						</tr>
						<tr>
							<td>Publication Name</td>
							<td><?= $row['book_pub_name']; ?></td>
						</tr>
						<tr>
							<td>Purchase Date</td>
							<td><?= date("d-M-Y", strtotime($row['book_pur_date'])); ?></td>
						</tr>
						<tr>
							<td>Price</td>
							<td><?= $row['book_price']; ?></td>
						</tr>
						<tr>
							<td>Quantity</td>
							<td><?= $row['book_qty']; ?></td>
						</tr>
						<tr>
							<td>Avaliable Quan.</td>
							<td><?= $row['book_avail_qty']; ?></td>
						</tr>
						<tr>
							<td>Added By</td>
							<td><?= $row['librarian_username']; ?></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<?php
	}
	?>
	<!-- book info quick view -->
	<?php
	$update_book = mysqli_query($conn, "SELECT * FROM `books`");
	while ($update_row = mysqli_fetch_assoc($update_book)) {
	?>
	<div class="modal fade" id="book_update-<?= $update_row['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="modal-info-label" style="display: none;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header state modal-info">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					<h4 class="modal-title" id="modal-info-label"><i class="fa fa-book"></i>Book Information</h4>
				</div>
				<div class="modal-body">

					<div class="panel">
						<div class="panel-content">
							<div class="row">
								<div class="col-md-12">
									<form action="<?= $_SERVER['PHP_SELF']; ?>" method="POST" enctype="multipart/form-data" class="form-horizontal">
										<h2 class="text-center">Update Book</h2>
										<hr class="mb-lg">
										<div class="form-group">
											<label for="book_name" class="col-sm-3 control-label">Book Name</label>
											<div class="col-sm-9">
												<input type="hidden" name="update_id" value="<?= $update_row['id']; ?>">
												<input type="text" class="form-control" name="book_name" id="book_name" required="" value="<?= isset($update_row['book_name']) ? $update_row['book_name'] : ''; ?>" placeholder="Book Name">
											</div>
										</div>
										<div class="form-group">
											<label for="book_image" class="col-sm-3 control-label">Book Image</label>
											<div class="col-sm-9">
												<input type="file" class="form-control" name="book_image" id="book_image" placeholder="Book Image">
												<input type="hidden" name="old_file" value="<?= $update_row['book_image']; ?>">
												<img style="width: 300px; height: 100px;" src="images/<?= $update_row['book_image']; ?>" alt="">
											</div>
										</div>
										<div class="form-group">
											<label for="book_author_name" class="col-sm-3 control-label">Author Name</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" name="book_author_name" id="book_author_name" required="" value="<?= isset($update_row['book_author_name']) ? $update_row['book_author_name'] : ''; ?>" placeholder="Book Author Name">
											</div>
										</div>
										<div class="form-group">
											<label for="book_pub_name" class="col-sm-3 control-label">Pub. Name</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" name="book_pub_name" id="book_pub_name" required="" value="<?= isset($update_row['book_pub_name']) ? $update_row['book_pub_name'] : ''; ?>" placeholder="Book Publication Name">
											</div>
										</div>
										<div class="form-group">
											<label for="book_pur_date" class="col-sm-3 control-label">Purchase Date</label>
											<div class="col-sm-9">
												<input type="date" class="form-control" name="book_pur_date" id="book_pur_date" required="" value="<?= isset($update_row['book_pur_date']) ? $update_row['book_pur_date'] : ''; ?>" placeholder="Book Purchase Name">
											</div>
										</div>
										<div class="form-group">
											<label for="book_price" class="col-sm-3 control-label">Book Price</label>
											<div class="col-sm-9">
												<input type="number" class="form-control" name="book_price" id="book_price" required="" value="<?= isset($update_row['book_price']) ? $update_row['book_price'] : ''; ?>" placeholder="Book Price">
											</div>
										</div>
										<div class="form-group">
											<label for="book_qty" class="col-sm-3 control-label">Book Quantity</label>
											<div class="col-sm-9">
												<input type="number" class="form-control" name="book_qty" id="book_qty" required="" value="<?= isset($update_row['book_qty']) ? $update_row['book_qty'] : ''; ?>" placeholder="Book Quantity">
												<input type="hidden" value="<?php echo $_SESSION['librarian_username']; ?>" name="librarian_username">
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-3 col-sm-9">
												<button type="submit" name="update_book" class="btn btn-primary"><i class="fa fa-pencil"></i> Update Book</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<?php
	}
	?>
	<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
</div>
<?php include_once 'inc/footer.php' ?>