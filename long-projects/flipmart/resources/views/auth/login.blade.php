<!doctype html>
<html lang="en" class="fixed accounts sign-in">


<!-- Mirrored from myiideveloper.com/helsinki/last-version/helsinki_green-dark/src/pages_sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 05 Mar 2019 13:05:33 GMT -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>Admin Login</title>
    <link rel="apple-touch-icon" sizes="120x120" href="{{ asset('assets/admin/favicon/apple-icon-120x120.png') }}">
    <link rel="icon" type="image/png" sizes="192x192" href="{{ asset('assets/admin/favicon/android-icon-192x192.png') }}">
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('assets/admin/favicon/favicon-32x32.png') }}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('assets/admin/favicon/favicon-16x16.png') }}">
    <!--BASIC css-->
    <!-- ========================================================= -->
    <link rel="stylesheet" href="{{ asset('assets/admin/vendor/bootstrap/css/bootstrap.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/admin/vendor/font-awesome/css/font-awesome.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/admin/vendor/animate.css') }}/animate.css') }}">
    <!--SECTION css-->
    <!-- ========================================================= -->
    <!--TEMPLATE css-->
    <!-- ========================================================= -->
    <link rel="stylesheet" href="{{ asset('assets/admin/stylesheets/css/style.css') }}">
</head>

<body>
<div class="wrap">
    <!-- page BODY -->
    <!-- ========================================================= -->
    <div class="page-body animated slideInDown">
        <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
        <!--LOGO-->
        <div class="logo">
            <h2 class="text-center mb-none">Admin Login</h2>
        </div>
        <div class="box">
            <!--SIGN IN FORM-->
            <div class="panel mb-none">
                <div class="panel-content bg-scale-0">
                    <form action="{{ route('login') }}" method="POST">
                        @csrf
                        <div class="form-group mt-md">
                            <span class="input-with-icon">
                                <input type="email" name="email" class="form-control" id="email" value="{{ old('email') }}" placeholder="Email">
                                <i class="fa fa-envelope"></i>
                            </span>
                            @error('email')
                            <div class="alert alert-warning">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="form-group">
                            <span class="input-with-icon">
                                <input type="password" name="password" class="form-control" id="password" placeholder="Password">
                                <i class="fa fa-key"></i>
                            </span>
                            @error('password')
                            <div class="alert alert-warning">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="form-group">
                            <div class="checkbox-custom checkbox-primary">
                                <input type="checkbox" name="remember" id="remember-me" {{ old('remember') ? 'checked' : '' }}>
                                <label class="check" for="remember-me">{{ __('Remember me') }}</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-primary btn-block" value="Login">
                        </div>
                        <div class="form-group text-center">
                            <a href="pages_forgot-password.html">{{ __('Forgot password?') }}</a>
                            <hr/>
                             <span>{{ __("Don't have an account?") }}</span>
                            <a href="{{ route('register') }}" class="btn btn-block mt-sm">{{ __('Register') }}</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
    </div>
</div>
<!--BASIC scripts-->
<!-- ========================================================= -->
<script src="{{ asset('assets/admin/vendor/jquery/jquery-1.12.3.min.js') }}"></script>
<script src="{{ asset('assets/admin/vendor/bootstrap/js/bootstrap.min.js') }}"></script>
<script src="{{ asset('assets/admin/vendor/nano-scroller/nano-scroller.js') }}"></script>
<!--TEMPLATE scripts-->
<!-- ========================================================= -->
<script src="{{ asset('assets/admin/javascripts/template-script.min.js') }}"></script>
<script src="{{ asset('assets/admin/javascripts/template-init.min.js') }}"></script>
<!-- SECTION script and examples-->
<!-- ========================================================= -->
</body>


<!-- Mirrored from myiideveloper.com/helsinki/last-version/helsinki_green-dark/src/pages_sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 05 Mar 2019 13:05:37 GMT -->
</html>
