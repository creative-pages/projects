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
								<th scope="col">Added By</th>
								<th scope="col">Date</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							@foreach ($category as $cat)
							<tr>
								<th scope="row">{{ $category->firstItem()+$loop->index }}</th>
								<td>{{ $cat->category_name }}</td>
								<td>{{ $cat->user->name }}</td>
								<td>{{ Carbon\Carbon::parse($cat->created_at)->diffForHumans() }}</td>
								<td>
									<a class="btn btn-warning btn-sm" href="{{ url('/edit-category/' . $cat->id) }}">Edit</a>
									<a class="btn btn-danger btn-sm" href="{{ url('/softdelete-category/' . $cat->id) }}">Delete</a>
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
			<form action="{{ route('store.category') }}" method="POST" class="shadow-sm p-3">
				@csrf
				<h2 class="border-bottom pb-2">Add Category</h2>
				<div class="form-group">
					<label for="category_name">Category Name</label>
					<input type="text" class="form-control @error('category_name') is-invalid @enderror" name="category_name" id="category_name" placeholder="Enter category name">
					@error('category_name')
					<div class="alert alert-warning">{{ $message }}</div>
					@enderror
				</div>
				<button type="submit" class="btn btn-primary float-right">Add</button>
				<div class="clearfix"></div>
			</form>
		</div>
		<div class="col-md-7 mt-3">
			<div class="card">
				<div class="card-header">All Category
					<b class="float-right">Total Categories <span class="badge badge-info text-white">{{ count($trashCat) }}</span></b>
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
								<th scope="col">Added By</th>
								<th scope="col">Date</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							@foreach ($trashCat as $trash)
							<tr>
								<th scope="row">{{ $trashCat->firstItem()+$loop->index }}</th>
								<td>{{ $trash->category_name }}</td>
								<td>{{ $trash->user->name }}</td>
								<td>{{ Carbon\Carbon::parse($trash->created_at)->diffForHumans() }}</td>
								<td>
									<a class="btn btn-warning btn-sm" href="{{ url('/restore-category/' . $trash->id) }}">Restore</a>
									<a class="btn btn-danger btn-sm" href="{{ url('/parmanent-category/' . $trash->id) }}">P Delete</a>
								</td>
							</tr>
							@endforeach
						</tbody>
					</table>
					{{ $trashCat->links() }}
				</div>
			</div>
		</div>
		<div class="col-md-5"></div>
	</div>
</div>
@endsection