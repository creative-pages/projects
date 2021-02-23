<div class="container-fluid">
	<div class="row">
		<div class="col-sm-2 px-0">
			<ul class="nav border border-primary flex-column rounded my-1">
				<li class="nav-item bg-primary text-white p-3">Site Option</li>
				<li class="nav-item">
					<a href="<?= BASE_URL; ?>/Admin" class="nav-link ml-3">Home</a>
				</li>
				<li class="nav-item">
					<a href="<?= BASE_URL; ?>/Admin/uiOption" class="nav-link ml-3">UI Option</a>
				</li>
				<li class="nav-item">
					<a href="<?= BASE_URL; ?>/Login/logout" class="nav-link ml-3">Logout</a>
				</li>

				<?php 
				if (Session::get('userLevel') == 1) {
				?>
				<li class="nav-item bg-primary text-white p-3">Manage User</li>
				<li class="nav-item">
					<a href="<?= BASE_URL; ?>/User/addUser" class="nav-link ml-3">Add User</a>
				</li><li class="nav-item">
					<a href="<?= BASE_URL; ?>/User/userList" class="nav-link ml-3">User List</a>
				</li>
				<?php
				}
				?>

				<li class="nav-item bg-primary text-white p-3">Category Option</li>
				<li class="nav-item">
					<a href="<?= BASE_URL; ?>/Admin/insertCategory" class="nav-link ml-3">Add Category</a>
				</li><li class="nav-item">
					<a href="<?= BASE_URL; ?>/Admin/categoryList" class="nav-link ml-3">Category List</a>
				</li>

				<li class="nav-item bg-primary text-white p-3">Post Option</li>
				<li class="nav-item">
					<a href="<?= BASE_URL; ?>/Admin/addPost" class="nav-link ml-3">Add Post</a>
				</li><li class="nav-item">
					<a href="<?= BASE_URL; ?>/Admin/postList" class="nav-link ml-3">Post List</a>
				</li>
			</ul>
		</div>
		<div class="col-sm-10 px-0 border rounded border-primary my-1">
