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
                <li><a href="javascript:avoid(0)">Manage Category</a></li>
            </ul>
        </div>
    </div>
    <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
    <div class="row animated fadeInUp">
        <h2 class="text-center pb-sm pull-left">Category List</h2>
        <a class="btn btn-primary pull-right" href="{{ route('add.category') }}">Add Category</a>
        <div class="clearfix"></div>
        <table id="basic-table" class="data-table table table-bordered table-hover table-striped">
            <thead>
                <tr>
                    <th>Serial No.</th>
                    <th>Category Name</th>
                    <th>Status</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @php ($i = 1)
                @foreach ($category_list as $all_category)
                <tr>
                    <td>{{ $i++ }}</td>
                    <td>{{ $all_category->category_name }}</td>
                    <td>
						<input type="checkbox" data-toggle="toggle" data-on="Active" data-off="Inactive" id="categoryStatus" data-id="{{ $all_category->id }}" {{ $all_category->status == 1 ? 'checked' : '' }}>
                    </td>
                    <td>{{ Carbon\carbon::parse($all_category->created_at)->diffForHumans() }}</td>
                    <td>
                        <a href="{{ route('edit.category', $all_category->id) }}" class="btn btn-warning">Edit</a>
                        <a href="{{ route('delete.category', $all_category->id) }}" class="btn btn-danger" onclick="return confirm('Are you sure to delete?');">Delete</a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
</div>
@endsection