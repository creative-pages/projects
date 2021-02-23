@extends('layouts.admin')
@section('content')
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<div class="card">
				<h2 class="cart-title px-3 py-2 mb-0">Your Profile</h2>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">{{ Auth::user()->name }}</li>
					<li class="list-group-item">{{ Auth::user()->email }}</li>
				</ul>
				<div class="card-body">
					<a href="{{ route('change.password') }}" class="card-link">Change Password</a>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="card">
				<div class="card-header">Update Profile
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
					<form action="{{ route('update.profile') }}" method="POST" enctype="multipart/form-data">
						@csrf
						<div class="form-group">
							<label for="name">Name</label>
							<input type="text" name="name" id="name" class="form-control @error('name') is-invalid @enderror" placeholder="Enter Name" multiple="">
							@error('name')
							<div class="alert alert-warning">{{ $message }}</div>
							@enderror
						</div>
						<div class="form-group">
							<label for="email">Email</label>
							<input type="email" name="email" id="email" class="form-control @error('email') is-invalid @enderror" placeholder="Enter Email" multiple="">
							@error('email')
							<div class="alert alert-warning">{{ $message }}</div>
							@enderror
						</div>
						<button type="submit" class="btn btn-primary float-right">Update</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection