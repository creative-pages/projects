@extends('layouts.admin')
@section('content')
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-7">
			<div class="card">
				<div class="card-header">All Category
					<b class="float-right">Total Categories <span class="badge badge-info text-white">{{ count($category) }}</span></b>
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
								<th scope="col">Added By</th>
								<th scope="col">Created At</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							@php ($i = 1)
							@foreach ($category as $cat)
							<tr>
								<th scope="row">{{ $category->firstItem()+$loop->index }}</th>
								<td>{{ $cat->category_name }}</td>
								<td>{{ $cat->user->name }}</td>
								<td>{{ Carbon\Carbon::parse($cat->created_at)->diffForHumans() }}</td>
								<td>
									<a class="btn btn-warning" href="{{ url('edit-category/' . $cat->id) }}">Edit</a>
									<a class="btn btn-danger" href="{{ url('/softdelete-category/' . $cat->id) }}">Delete</a>
								</td>
							</tr>
							@endforeach
						</tbody>
					</table>
					{{ $category->links() }}
				</div>
			</div>
		</div>
		<div class="col-md-5">
			<div class="card">
				<div class="card-header">Add Category
				</div>
				<div class="card-body">
					<form action="{{ route('store.category') }}" method="POST">
						@csrf
						<div class="form-group">
							<label for="category">Name</label>
							<input type="text" name="category_name" id="category" class="form-control @error('category_name') is-invalid @enderror" placeholder="Enter Category Name">
							@error('category_name')
							<div class="alert alert-warning">{{ $message }}</div>
							@enderror
						</div>
						<button type="submit" class="btn btn-primary float-right">Add</button>
					</form>
				</div>
			</div>
		</div>

		<div class="col-md-7 mt-4">
			<div class="card">
				<div class="card-header">Trash List
					<b class="float-right">Total Trash Category <span class="badge badge-info text-white">{{ count($trashCat) }}</span></b>
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
								<th scope="col">Added By</th>
								<th scope="col">Created At</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							@php ($i = 1)
							@foreach ($trashCat as $cat)
							<tr>
								<th scope="row">{{ $trashCat->firstItem()+$loop->index }}</th>
								<td>{{ $cat->category_name }}</td>
								<td>{{ $cat->name }}</td>
								<td>{{ Carbon\Carbon::parse($cat->created_at)->diffForHumans() }}</td>
								<td>
									<a class="btn btn-warning" href="{{ url('/restore-category/' . $cat->id) }}">Restore</a>
									<a class="btn btn-danger" href="{{ url('/pDelete-category/' . $cat->id) }}">P Delete</a>
								</td>
							</tr>
							@endforeach
						</tbody>
					</table>
					{{ $trashCat->links() }}
				</div>
			</div>
		</div>
		<div class="col-md-5">
			
		</div>
	</div>
</div>
@endsection