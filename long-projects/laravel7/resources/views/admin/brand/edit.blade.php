@extends('layouts.admin')
@section('content')
<div class="container">
	<div class="row justify-content-center">
<div class="col-md-6">
	<div class="card">
		<div class="card-header">Edit Brand
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
			<form action="{{ url('/update-brand/' . $singleBrand->id) }}" method="POST" enctype="multipart/form-data">
				@csrf
				<input type="hidden" value="{{ $singleBrand->brand_image }}" name="old_img">
				<div class="form-group">
					<label for="category">Name</label>
					<input type="text" name="brand_name" id="category" class="form-control @error('brand_name') is-invalid @enderror" value="{{ $singleBrand->brand_name }}" placeholder="Enter Brand Name">
					@error('brand_name')
					<div class="alert alert-warning">{{ $message }}</div>
					@enderror
				</div>

				<div class="form-group">
					<label for="image">Image</label>
					<input type="file" name="brand_image" id="image" class="form-control @error('brand_image') is-invalid @enderror" placeholder="Enter Category Name">
					@error('brand_image')
					<div class="alert alert-warning">{{ $message }}</div>
					@enderror
				</div>
				<div class="form-group">
					<label for=""></label>
					<img style="width: 300px; height: 150px;" src="{{ asset($singleBrand->brand_image) }}" alt="">
				</div>
				<button type="submit" class="btn btn-primary float-right">Update</button>
			</form>
		</div>
	</div>
</div>
</div>
</div>
@endsection