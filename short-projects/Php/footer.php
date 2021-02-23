		</div>
	</div>

	<div class="container">
		<div class="py-4 px-3 bg-primary">
			<h2 class="text-center text-white">Md. Arif Hoosain</h2>
		</div>
	</div>

	<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    <script type="text/javascript">
		$(document).ready(function(){
			readRecords();
		});

		// show all data
    	function readRecords() {
    		var readrecord = 'readrecord';
    		$.ajax({
    			url: 'crud.php',
    			type: 'POST',
    			data: {readrecord:readrecord},
    			success:function(data, status) {
    				$('#all_records').html(data);
    			}
    		});
    	}

    	// insert data
    	function addRecord() {
    		var name = $('#name').val();
    		var department = $('#department').val();
    		var age = $('#age').val();

    		$.ajax({
    			url: 'crud.php',
    			type: 'POST',
    			data: {
    				name:name,
    				department:department,
    				age:age
    			},
    			success:function(data, status) {
    				readRecords();
    			}
    		});
    	}

    	// delete data
    	function deleteUser(deleteId) {
    		var con = confirm('Are you sure to delete?');
    		if (con == true) {
    			$.ajax({
    				url: 'crud.php',
    				type: 'POST',
    				data: {deleteId:deleteId},
    				success:function(data, status) {
    					readRecords();
    				}
    			});
    		}
    	}

    	// select data
    	function getUserData(id) {
    		$('#user_id').val(id);

    		$.post('crud.php', {
					id:id
				}, function(data, status) {
					var user = JSON.parse(data);
					$('#uname').val(user.name);
					$('#udepartment').val(user.department);
					$('#uage').val(user.age);
				}
    		);
    		$('#update_user').modal('show');
    	}

    	// update data
    	function updateRecord() {
    		var name = $('#uname').val();
    		var department = $('#udepartment').val();
    		var age = $('#uage').val();
    		var user_id = $('#user_id').val();

    		$.post('crud.php', {
    				update_user_id:user_id,
    				updatename:name,
    				updatedepartment:department,
    				updateage:age
    			},
    			function(data, status) {
    				$('#update_user').modal('hide');
    				readRecords();
    			}
    		);
    	}

    </script>
</body>
</html>