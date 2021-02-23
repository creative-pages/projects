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
				<li><a href="javascript:avoid(0)">Add Sub-Category</a></li>
			</ul>
		</div>
	</div>
	<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
	<div class="row animated fadeInUp">
		<!--HORIZONTAL-->
		<div class="col-sm-12 col-md-8 col-md-offset-2">
			@include('includes.message')
			<div class="panel">
				<div class="panel-content">
					<div class="row">
						<div class="col-md-12">
							<form action="{{ route('store.sub.category') }}" method="POST" class="form-horizontal">
								@csrf
								<h3 class="mb-lg text-center">Add Sub-Category</h3>
								<div class="form-group">
									<label for="cat_id" class="col-sm-3 control-label">Category Name</label>
									<div class="col-sm-9">
										<select class="form-control" name="cat_id" id="cat_id">
											<option value="">Select Category</option>
											@foreach ($all_category as $categories)
											<option value="{{ $categories->id }}" {{ old('cat_id') == $categories->id ? 'selected' : '' }}>{{ $categories->category_name }}</option>
											@endforeach
										</select>
										@error('cat_id')
										<div class="alert alert-warning fade in mv-xs">
											{{ $message }}
										</div>
										@enderror
									</div>
								</div>
								<div class="form-group">
									<label for="sub_category" class="col-sm-3 control-label">Sub-Category Name</label>
									<div class="col-sm-9">
										<input type="text" name="subcat_name" class="form-control" id="sub_category" value="{{ old('subcat_name') }}" placeholder="Sub-Category Name">
										@error('subcat_name')
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