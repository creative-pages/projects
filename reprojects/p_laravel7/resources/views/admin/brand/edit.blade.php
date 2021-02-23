@extends('layouts.admin')
@section('content')
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<form action="{{ url('/update-brand/' . $singleBrand->id) }}" method="POST" enctype="multipart/form-data" class="shadow-sm p-3">
				@csrf
				<h2 class="border-bottom pb-2">Update Brand</h2>
				<div class="form-group">
					<label for="brand_name">Brand Name</label>
					<input type="text" class="form-control @error('brand_name') is-invalid @enderror" name="brand_name" id="brand_name" value="{{ $singleBrand->brand_name }}" placeholder="Enter brand name">
					@error('brand_name')
					<div class="alert alert-warning">{{ $message }}</div>
					@enderror
				</div>
				<div class="form-group">
					<label for="brand_image">Brand Image</label>
					<input type="file" class="form-control @error('brand_image') is-invalid @enderror" name="brand_image" id="brand_image" placeholder="Enter brand name">
					@error('brand_image')
					<div class="alert alert-warning">{{ $message }}</div>
					@enderror
				</div>
				<div class="form-group">
					<label for=""></label>
					<input type="hidden" name="old_img" value="{{ $singleBrand->brand_image }}">
					<img style="width: 300px; height: 150px;" src="{{ asset($singleBrand->brand_image) }}" alt="">
				</div>
				<button type="submit" class="btn btn-primary float-right">Update</button>
				<div class="clearfix"></div>
			</form>
		</div>
	</div>
</div>
@endsection