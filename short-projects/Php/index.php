<?php include "header.php"; ?>
<h1 class="text-primary text-uppercase text-center">Ajax Crud Operation</h1>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#add_user">
Insert Data
</button>
<div class="clearfix"></div>
<h2 class="text-info">All Records</h2>
<div id="all_records"></div>
<!-- Modal -->
<div class="modal fade" id="add_user" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">Add Data</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="" method="POST">
					<div class="form-group row">
						<label for="name" class="col-sm-3 col-form-label">Enter Name</label>
						<div class="col-sm-9">
							<input type="text" class="form-control mb-2" name="" id="name" placeholder="Enter your name">
						</div>
					</div>
					
					<div class="form-group row">
						<label for="department" class="col-sm-3 col-form-label">Enter Department</label>
						<div class="col-sm-9">
							<input type="text" class="form-control mb-2" name="" id="department" placeholder="Enter your department">
						</div>
					</div>
					
					<div class="form-group row">
						<label for="age" class="col-sm-3 col-form-label">Enter Age</label>
						<div class="col-sm-9">
							<input type="number" class="form-control mb-2" name="" id="age" placeholder="Enter your age">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" onclick="addRecord()" class="btn btn-primary" data-dismiss="modal">Add</button>
			</div>
		</div>
	</div>
</div>




<!-- update modal -->
<div class="modal fade" id="update_user" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">Update Data</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="" method="POST">
					<div class="form-group row">
						<label for="uname" class="col-sm-3 col-form-label">Enter Name</label>
						<div class="col-sm-9">
							<input type="text" class="form-control mb-2" name="" id="uname" placeholder="Enter your name">
						</div>
					</div>
					
					<div class="form-group row">
						<label for="udepartment" class="col-sm-3 col-form-label">Enter Department</label>
						<div class="col-sm-9">
							<input type="text" class="form-control mb-2" name="" id="udepartment" placeholder="Enter your department">
						</div>
					</div>
					
					<div class="form-group row">
						<label for="uage" class="col-sm-3 col-form-label">Enter Age</label>
						<div class="col-sm-9">
							<input type="number" class="form-control mb-2" name="" id="uage" placeholder="Enter your age">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" onclick="updateRecord()" class="btn btn-primary" data-dismiss="modal">Update</button>
				<input type="hidden" name="" id="user_id">
			</div>
		</div>
	</div>
</div>

<?php include "footer.php"; ?>