<div class="col-sm-2 px-0 border border-light border-right-0">
			<ul class="nav flex-column bg-primary">
				<li class="p-2 text-white">Site Option</li>
				<li class="nav-item">
					<a href="<?= BASE_URL; ?>/Admin" class="nav-link bg-white text-primary border-bottom">Home</a>
				</li>
				<li class="nav-item">
					<a href="<?= BASE_URL; ?>/Admin/uiOption" class="nav-link bg-white text-primary border-bottom">UI Option</a>
				</li>
				<li class="nav-item">
					<a href="<?= BASE_URL; ?>/Login/logout" class="nav-link bg-white text-primary border-bottom">Logout</a>
				</li>

				<?php 
				if (Session::get('userLevel') == 1) {
				?>
				<li class="p-2 text-white">Manage User</li>
				<li class="nav-item">
					<a href="<?= BASE_URL; ?>/User/adduser" class="nav-link bg-white text-primary border-bottom">Add User</a>
				</li>
				<li class="nav-item">
					<a href="<?= BASE_URL; ?>/User/userList" class="nav-link bg-white text-primary border-bottom">User List</a>
				</li>
				<?php
				}
				?>
				<?php 
				if (Session::get('userLevel') == 1 || Session::get('userLevel') == 2) {
				?>
				<li class="p-2 text-white">Category Option</li>
				<li class="nav-item">
					<a href="<?= BASE_URL; ?>/Admin/addCategory" class="nav-link bg-white text-primary border-bottom">Add Category</a>
				</li>
				<li class="nav-item">
					<a href="<?= BASE_URL; ?>/Admin/categoryList" class="nav-link bg-white text-primary border-bottom">Category List</a>
				</li>
				<?php
				}
				?>
				<li class="p-2 text-white">Post Option</li>
				<li class="nav-item">
					<a href="<?= BASE_URL; ?>/Admin/addPost" class="nav-link bg-white text-primary border-bottom">Add Post</a>
				</li>
				<li class="nav-item">
					<a href="<?= BASE_URL; ?>/Admin/postList" class="nav-link bg-white text-primary border-bottom">Post List</a>
				</li>
				
			</ul>
		</div>
		<div class="col-sm-10 admin_content">