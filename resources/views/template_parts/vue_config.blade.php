<div class="wrapper">
  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
      <img class="animation__shake" src="{{ asset('img/AdminLTELogo.png') }}"  height="60" width="60">
  </div>
  <div id="app">
      @include('template_parts.nav')
    
      @include('template_parts.sidebar')
      <div class="content-wrapper">
          <div id="app">
            <!-- /.content-header -->

            <modal-profile :asset="'{{ asset('') }}'"></modal-profile>

            @yield('content')
          </div>
      </div>
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <strong>Copyright &copy; 2021-2022 INCARED</strong>
    All rights reserved.
 
  </footer>
</div>