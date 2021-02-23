@extends('layouts.admin')
@section('content')
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<div class="card">
				<div class="card-header">Edit Category
				</div>
				<div class="card-body">
					<form action="{{ url('/Update-category/' . $category->id ) }}" method="POST">
						@csrf
						<div class="form-group">
							<label for="category">Name</label>
							<input type="text" name="category_name" id="category" class="form-control @error('category_name') is-invalid @enderror" value="{{ $category->category_name }}" placeholder="Enter Category Name">

							@error('category_name')
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