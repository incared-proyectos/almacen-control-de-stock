<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>
    
    <script>let base_path_vue_router = '' ;</script>
    @if(!empty(Config::get('vueconfig.path')))
        <script>
            base_path_vue_router = "{{ Config::get('vueconfig.path') }}";
        </script>
    @endif
    @routes
    <!-- Scripts -->

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">

    <!-- Styles ICONS FONTAWESOME -->
    <link href="{{ asset('plugins/fontawesome/css/all.min.css') }}" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
    @auth
        @include('template_parts.vue_config')
    @else
        @include('template_parts.php_config')
    @endauth
    <script src="{{ asset('js/app.js') }}" defer></script>

</body>
</html>
