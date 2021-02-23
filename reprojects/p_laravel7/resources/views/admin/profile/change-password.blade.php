@extends('layouts.admin')
@section('content')
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<form action="{{ route('update.password') }}" method="POST" class="shadow-sm p-3">
				@csrf
				@if (session('success'))
				<div class="alert alert-success alert-dismissible fade show" role="alert">
					<strong>{{ session('success') }}</strong>
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				@endif
				<h2 class="border-bottom bg-danger text-white px-3 py-2 mb-3">Update Password</h2>
				<div class="form-group">
					<input type="password" class="form-control @error('old_pass') is-invalid @enderror" name="old_pass" id="old_pass" placeholder="Enter old password">
					@error('old_pass')
					<div class="alert alert-warning">{{ $message }}</div>
					@enderror

					@if (session('old_match'))
					<div class="alert alert-warning">{{ session('old_match') }}</div>
					@endif
				</div>
				<div class="form-group">
					<input type="password" class="form-control @error('new_pass') is-invalid @enderror" name="new_pass" id="new_pass" placeholder="Enter new password">
					@error('new_pass')
					<div class="alert alert-warning">{{ $message }}</div>
					@enderror
				</div>
				<div class="form-group">
					<input type="password" class="form-control @error('confirm_pass') is-invalid @enderror" name="confirm_pass" id="confirm_pass" placeholder="Enter confirm password">
					@error('confirm_pass')
					<div class="alert alert-warning">{{ $message }}</div>
					@enderror

					@if (session('new_matched'))
					<div class="alert alert-warning">{{ session('new_matched') }}</div>
					@endif
				</div>
				<button type="submit" class="btn btn-primary float-right">Change</button>
				<div class="clearfix"></div>
			</form>
		</div>
	</div>
</div>
@endsection