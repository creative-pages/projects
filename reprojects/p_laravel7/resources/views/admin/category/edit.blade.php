@extends('layouts.admin')
@section('content')
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<form action="{{ route('update.category') }}" method="POST" class="shadow-sm p-3">
				@csrf
				<h2 class="border-bottom pb-2">Update Category</h2>
				<div class="form-group">
					<input type="hidden" name="cat_id" value="{{ $singleCat->id }}">
					<label for="category_name">Category Name</label>
					<input type="text" class="form-control @error('category_name') is-invalid @enderror" name="category_name" id="category_name" value="{{ $singleCat->category_name }}" placeholder="Enter category name">
					@error('category_name')
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