<?php include_once 'inc/header.php' ?>
<?php include_once 'inc/sidebar.php' ?>

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
				<li><a href="javascript:void(0)">Add Book</a></li>
			</ul>
		</div>
	</div>
	<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
	<div class="row animated fadeInUp">
		<div class="col-sm-6 col-sm-offset-3">
			<?php 
				if (isset($_POST['add_book'])) {
					$book_name = $_POST['book_name'];
					$book_author_name = $_POST['book_author_name'];
					$book_pub_name = $_POST['book_pub_name'];
					$book_pur_date = $_POST['book_pur_date'];
					$book_price = $_POST['book_price'];
					$book_qty = $_POST['book_qty'];
					$librarian_username = $_POST['librarian_username'];

					$book_photo = $_FILES['book_image']['name'];
					$book_exp = explode('.', $book_photo);
					$book_ext = end($book_exp);
					$book_image = date('ymdhis') . '.' . $book_ext;

					$input_errors = array();

					if (empty($book_name)) {
						$input_errors['book_name'] = "Book name is required!";
					}
					if (empty($book_photo)) {
						$input_errors['book_image'] = "Book image is required!";
					}
					if (empty($book_author_name)) {
						$input_errors['book_author_name'] = "Book author name is required!";
					}
					if (empty($book_pub_name)) {
						$input_errors['book_pub_name'] = "Book publication name is required!";
					}
					if (empty($book_pur_date)) {
						$input_errors['book_pur_date'] = "Book purchase date is required!";
					}
					if (empty($book_price)) {
						$input_errors['book_price'] = "Book price is required!";
					}
					if (empty($book_qty)) {
						$input_errors['book_qty'] = "Book quantity is required!";
					}

					if (count($input_errors) == 0) {
						$sql = "INSERT INTO `books`(`book_name`, `book_image`, `book_author_name`, `book_pub_name`, `book_pur_date`, `book_price`, `book_qty`, `book_avail_qty`, `librarian_username`) VALUES ('$book_name', '$book_image', '$book_author_name', '$book_pub_name', '$book_pur_date', '$book_price', '$book_qty', '$book_qty', '$librarian_username')";
						$result = mysqli_query($conn, $sql);
						if ($result) {
							move_uploaded_file($_FILES['book_image']['tmp_name'], 'images/' . $book_image);
							$success = "Book added successfully.";
						} else {
							$error = "Book does not added!";
						}
					}
				}
			?>
			<div class="panel">
				<div class="panel-content">
					<div class="row">
						<div class="col-md-12">
							<form action="<?= $_SERVER['PHP_SELF']; ?>" method="POST" enctype="multipart/form-data" class="form-horizontal">
								<h2 class="text-center">Add Book</h2>
								<hr class="mb-lg">
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
								<div class="form-group">
									<label for="book_name" class="col-sm-3 control-label">Book Name</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="book_name" id="book_name" value="<?= isset($book_name) ? $book_name : ''; ?>" placeholder="Book Name">
										<?php if (isset($input_errors['book_name'])) { echo '<div class="alert alert-warning mb-none">' . $input_errors['book_name'] . '</div>'; } ?>
									</div>
								</div>
								<div class="form-group">
									<label for="book_image" class="col-sm-3 control-label">Book Image</label>
									<div class="col-sm-9">
										<input type="file" class="form-control" name="book_image" id="book_image" placeholder="Book Image">
										<?php if (isset($input_errors['book_image'])) { echo '<div class="alert alert-warning mb-none">' . $input_errors['book_image'] . '</div>'; } ?>
									</div>
								</div>
								<div class="form-group">
									<label for="book_author_name" class="col-sm-3 control-label">Author Name</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="book_author_name" id="book_author_name" value="<?= isset($book_author_name) ? $book_author_name : ''; ?>" placeholder="Book Author Name">
										<?php if (isset($input_errors['book_author_name'])) { echo '<div class="alert alert-warning mb-none">' . $input_errors['book_author_name'] . '</div>'; } ?>
									</div>
								</div>
								<div class="form-group">
									<label for="book_pub_name" class="col-sm-3 control-label">Pub. Name</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="book_pub_name" id="book_pub_name" value="<?= isset($book_pub_name) ? $book_pub_name : ''; ?>" placeholder="Book Publication Name">
										<?php if (isset($input_errors['book_pub_name'])) { echo '<div class="alert alert-warning mb-none">' . $input_errors['book_pub_name'] . '</div>'; } ?>
									</div>
								</div>
								<div class="form-group">
									<label for="book_pur_date" class="col-sm-3 control-label">Purchase Date</label>
									<div class="col-sm-9">
										<input type="date" class="form-control" name="book_pur_date" id="book_pur_date" value="<?= isset($book_pur_date) ? $book_pur_date : ''; ?>" placeholder="Book Purchase Name">
										<?php if (isset($input_errors['book_pur_date'])) { echo '<div class="alert alert-warning mb-none">' . $input_errors['book_pur_date'] . '</div>'; } ?>
									</div>
								</div>
								<div class="form-group">
									<label for="book_price" class="col-sm-3 control-label">Book Price</label>
									<div class="col-sm-9">
										<input type="number" class="form-control" name="book_price" id="book_price" value="<?= isset($book_price) ? $book_price : ''; ?>" placeholder="Book Price">
										<?php if (isset($input_errors['book_price'])) { echo '<div class="alert alert-warning mb-none">' . $input_errors['book_price'] . '</div>'; } ?>
									</div>
								</div>
								<div class="form-group">
									<label for="book_qty" class="col-sm-3 control-label">Book Quantity</label>
									<div class="col-sm-9">
										<input type="number" class="form-control" name="book_qty" id="book_qty" value="<?= isset($book_qty) ? $book_qty : ''; ?>" placeholder="Book Quantity">
										<?php if (isset($input_errors['book_qty'])) { echo '<div class="alert alert-warning mb-none">' . $input_errors['book_qty'] . '</div>'; } ?>

										<input type="hidden" value="<?php echo $_SESSION['librarian_username']; ?>" name="librarian_username">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-3 col-sm-9">
										<button type="submit" name="add_book" class="btn btn-primary"><i class="fa fa-save"></i> Add Book</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
</div>
<?php include_once 'inc/footer.php' ?>