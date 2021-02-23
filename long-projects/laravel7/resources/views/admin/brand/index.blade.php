@extends('layouts.admin')
@section('content')
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-8">
			<div class="card">
				<div class="card-header">All Brand
					<b class="float-right">Total Brands <span class="badge badge-info text-white">{{ count($brand) }}</span></b>
				</div>
				

				<div class="card-body">
					@if(session('success'))
					<div class="alert alert-success alert-dismissible fade show" role="alert">
						<strong>{{ session('success') }}</strong>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
						</button>
					</div>
					@endif
					<table class="table table-bordered">
						<thead>
							<tr>
								<th scope="col">S. N.</th>
								<th scope="col">Name</th>
								<th scope="col">Image</th>
								<th scope="col">Added By</th>
								<th scope="col">Created At</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							@foreach ($brand as $bra)
							<tr>
								<th scope="row">{{ $brand->firstItem()+$loop->index }}</th>
								<td>{{ $bra->brand_name }}</td>
								<td>
									<img src="{{ asset($bra->brand_image) }}" alt="">
								</td>
								<td>{{ $bra->user->name }}</td>
								<td>{{ Carbon\Carbon::parse($bra->created_at)->diffForHumans() }}</td>
								<td>
									<a class="btn btn-warning btn-sm" href="{{ url('/edit-brand/' . $bra->id) }}">Edit</a>
									<a class="btn btn-danger btn-sm" href="{{ url('/delete-brand/' . $bra->id) }}">Delete</a>
								</td>
							</tr>
							@endforeach
						</tbody>
					</table>
					{{ $brand->links() }}
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card">
				<div class="card-header">Add Brand
				</div>
				<div class="card-body">
					<form action="{{ route('store.brand') }}" method="POST" enctype="multipart/form-data">
						@csrf
						<div class="form-group">
							<label for="category">Name</label>
							<input type="text" name="brand_name" id="category" class="form-control @error('brand_name') is-invalid @enderror" placeholder="Enter Brand Name">
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
						<button type="submit" class="btn btn-primary float-right">Add</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection