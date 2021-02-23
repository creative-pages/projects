@extends('layouts.admin')
@section('content')
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-8">
			<div class="row">
				@foreach($images as $multiimg)
				<div class="col-md-4 mb-3">
					<img class="w-100" src="{{ asset($multiimg->images) }}" alt="">
					<div class="bg-light border py-2 px-3">{{ $multiimg->created_at->diffForHumans() }}</div>
				</div>
				@endforeach
			</div>
		</div>
		<div class="col-md-4">
			@if (session('success'))
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<strong>{{ session('success') }}</strong>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
			</div>
			@endif
			<form action="{{ route('store.image') }}" method="POST" enctype="multipart/form-data" class="shadow-sm p-3">
				@csrf
				<h2 class="border-bottom pb-2">Add Multiple Image</h2>
				<div class="form-group">
					<label for="images">Select Images</label>
					<input type="file" class="form-control @error('images') is-invalid @enderror" name="images[]" id="images" multiple="">
					@error('images')
					<div class="alert alert-warning">{{ $message }}</div>
					@enderror
				</div>
				<button type="submit" class="btn btn-primary float-right">Upload</button>
				<div class="clearfix"></div>
			</form>
		</div>
	</div>
</div>
@endsection