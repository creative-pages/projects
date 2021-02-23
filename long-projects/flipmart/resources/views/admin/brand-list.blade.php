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
                <li><a href="javascript:avoid(0)">Brand</a></li>
                <li><a href="javascript:avoid(0)">Manage Brand</a></li>
            </ul>
        </div>
    </div>
    <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
    <div class="row animated fadeInUp">
        <h2 class="text-center pb-sm">Brand List</h2>
        <table id="basic-table" class="data-table table table-bordered table-hover table-striped">
            <thead>
                <tr>
                    <th>Serial No.</th>
                    <th>Brand Name</th>
                    <th>Status</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @php ($i = 1)
                @foreach ($brand_list as $all_brand)
                <tr>
                    <td>{{ $i++ }}</td>
                    <td>{{ $all_brand->brand_name }}</td>
                    <td>
                        <input type="checkbox" data-toggle="toggle" data-on="Active" data-off="Inactive" id="brandstatus" data-id="{{ $all_brand->id }}" {{ $all_brand->status == 1 ? 'checked' : '' }}>
                    </td>
                    <td>{{ Carbon\carbon::parse($all_brand->created_at)->diffForHumans() }}</td>
                    <td>
                        <a href="{{ url('/brand/edit-brand/' . $all_brand->id) }}" class="btn btn-warning">Edit</a>
                        <a href="{{ route('delete.brand', $all_brand->id) }}" class="btn btn-danger" onclick="return confirm('Are you sure to delete?');">Delete</a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
</div>
@endsection