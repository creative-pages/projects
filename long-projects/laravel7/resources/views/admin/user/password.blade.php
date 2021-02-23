@extends('layouts.admin')
@section('content')
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<div class="card">
				<div class="card-header bg-danger text-white">Change Password
				</div>
				<div class="card-body">
					@if (session('success'))
					<div class="alert alert-success alert-dismissible fade show" role="alert">
						<strong>{{ session('success') }}</strong>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
						</button>
					</div>
					@endif
					<form action="{{ route('update.password') }}" method="POST" enctype="multipart/form-data">
						@csrf
						<div class="form-group">
							<label for="old_password">Old Password</label>
							<input type="password" name="old_password" id="old_password" class="form-control @error('old_password') is-invalid @enderror" placeholder="Enter Old Password">
							@if (session('error'))
							<div class="alert alert-warning">{{ session('error') }}</div>
							@endif
							@error('old_password')
							<div class="alert alert-warning">{{ $message }}</div>
							@enderror
						</div>
						<div class="form-group">
							<label for="new_password">New Password</label>
							<input type="password" name="new_password" id="new_password" class="form-control @error('new_password') is-invalid @enderror" placeholder="Enter New Password">
							@error('new_password')
							<div class="alert alert-warning">{{ $message }}</div>
							@enderror
						</div>
						<div class="form-group">
							<label for="confirm_password">Confirm Password</label>
							<input type="password" name="confirm_password" id="confirm_password" class="form-control @error('confirm_password') is-invalid @enderror" placeholder="Enter Confirm Password">
							@if (session('notMatch'))
							<div class="alert alert-warning">{{ session('notMatch') }}</div>
							@endif
							@error('confirm_password')
							<div class="alert alert-warning">{{ $message }}</div>
							@enderror
						</div>
						<button type="submit" class="btn btn-danger float-right">Change</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection