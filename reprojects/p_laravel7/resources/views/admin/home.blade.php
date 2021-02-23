@extends('layouts.admin')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Welcome: {{ Auth::user()->name }} <span class="badge badge-success">Active User</span>
                <b class="float-right">Total users <span class="badge badge-info text-white">{{ count($users) }}</span></b>
                </div>
                <div class="card-body">
                    <!-- @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif -->
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">S. N.</th>
                                <th scope="col">Name</th>
                                <th scope="col">Email</th>
                                <th scope="col">Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php ($i = 1)
                            @foreach ($users as $user)
                            <tr>
                                <th scope="row">{{ $i++ }}</th>
                                <td>{{ $user->name }}</td>
                                <td>{{ $user->email }}</td>
                                <td>{{ Carbon\Carbon::parse($user->created_at)->diffForHumans() }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection