@extends('layouts.admin')
@section('content')
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-8">
			<div class="row">
				@foreach ($multi_img as $images)
				<div class="col-sm-4 mb-3">
					<div class="card">
						<img src="{{ asset($images->images) }}" class="card-img-top" alt="...">
						<div class="card-body">
							<p class="card-text"><small class="text-muted">Last updated {{ $images->created_at->diffForHumans() }}</small></p>
						</div>
					</div>
				</div>
				@endforeach
			</div>
			
		</div>
		<div class="col-md-4">
			<div class="card">
				<div class="card-header">Add Multiple Image
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
					<form action="{{ route('store.image') }}" method="POST" enctype="multipart/form-data">
						@csrf
						<div class="form-group">
							<label for="image">Multiple Image</label>
							<input type="file" name="images[]" id="image" class="form-control @error('images') is-invalid @enderror" placeholder="Enter Category Name" multiple="">
						</div>
						<button type="submit" class="btn btn-primary float-right">Upload</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection