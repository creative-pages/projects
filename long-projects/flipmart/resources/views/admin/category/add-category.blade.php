@extends('layouts.app')
@section('content')
<div class="content">
	<!-- content HEADER -->
	<!-- ========================================================= -->
	<div class="content-header">
		<!-- leftside content header -->
		<div class="leftside-content-header">
			<ul class="breadcrumbs">
				<li><i class="fa fa-home" aria-hidden="true"></i><a href="{{ route('home') }}">Dashboard</a></li>
				<li><a href="javascript:avoid(0)">Category</a></li>
				<li><a href="javascript:avoid(0)">Add Category</a></li>
			</ul>
		</div>
	</div>
	<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
	<div class="row animated fadeInUp">
		<!--HORIZONTAL-->
		<div class="col-sm-12 col-md-6 col-md-offset-3">
			@include('includes.message')
			<div class="panel">
				<div class="panel-content">
					<div class="row">
						<div class="col-md-12">
							<form action="{{ route('store.category') }}" method="POST" class="form-horizontal">
								@csrf
								<h3 class="mb-lg text-center">Add Category</h3>
								<div class="form-group">
									<label for="category" class="col-sm-3 control-label">Category Name</label>
									<div class="col-sm-9">
										<input type="text" name="category_name" class="form-control" id="category" value="{{ old('category_name') }}" placeholder="Category Name">
										@error('category_name')
										<div class="alert alert-warning fade in mv-xs">
											{{ $message }}
										</div>
										@enderror
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-3 col-sm-9">
										<button type="submit" class="btn btn-primary">Add</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
</div>
@endsection