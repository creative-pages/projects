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
						{{ session('success') }}
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
								<th scope="col">Date</th>
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
								<td>{{ Carbon\Carbon::parse($bra->created_at)->diffForHumans() }}</td>
								<td>
									<a class="btn btn-warning btn-sm" href="{{ url('/edit-brand/' . $bra->id) }}">Edit</a>
									<a class="btn btn-danger btn-sm" href="{{ url('/delete-brand/' . $bra->id) }}" onclick="return confirm('Are You Sure To Delete?');">Delete</a>
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
			<form action="{{ route('store.brand') }}" method="POST" enctype="multipart/form-data" class="shadow-sm p-3">
				@csrf
				<h2 class="border-bottom pb-2">Add Brand</h2>
				<div class="form-group">
					<label for="brand_name">Brand Name</label>
					<input type="text" class="form-control @error('brand_name') is-invalid @enderror" name="brand_name" id="brand_name" placeholder="Enter brand name">
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
				<button type="submit" class="btn btn-primary float-right">Add</button>
				<div class="clearfix"></div>
			</form>
		</div>
	</div>
</div>
@endsection