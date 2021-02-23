@extends('layouts.admin')
@section('content')
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-7">
			<h3>User Info</h3>
			<table class="table table-bordered table-striped table-hover">
				<tr>
					<td>Name</td>
					<td>{{ Auth::user()->name }}</td>
				</tr>
				<tr>
					<td>Email</td>
					<td>{{ Auth::user()->email }}</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<a class="text-decoration-none d-block" href="{{ route('change.password') }}">Change Password</a>
					</td>
				</tr>
			</table>
		</div>
		<div class="col-md-5">
			@if (session('success'))
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<strong>{{ session('success') }}</strong>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
			</div>
			@endif
			<form action="{{ route('update.user') }}" method="POST" class="shadow-sm p-3">
				@csrf
				<h2 class="border-bottom pb-2">Update Profile</h2>
				<div class="form-group">
					<label for="name">Name</label>
					<input type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ Auth::user()->name }}" placeholder="Enter name" id="name">
					@error('name')
					<div class="alert alert-warning">{{ $message }}</div>
					@enderror
				</div>
				<div class="form-group">
					<label for="email">Email</label>
					<input type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ Auth::user()->email }}" placeholder="Enter email" id="email">
					@error('email')
					<div class="alert alert-warning">{{ $message }}</div>
					@enderror
				</div>
				<button type="submit" class="btn btn-primary float-right">Update</button>
				<div class="clearfix"></div>
			</form>
		</div>
	</div>
</div>
@endsection