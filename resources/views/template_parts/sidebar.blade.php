<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
  <!-- Brand Logo -->
  <a href="{{ url('/') }}" class="brand-link">
    <img src="{{ asset('img/AdminLTELogo.png') }}" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
    <span class="brand-text font-weight-light"> {{ config('app.name', 'Laravel') }}</span>
  </a>
  <!-- Sidebar -->
  <div class="sidebar">
    <!-- Sidebar user panel (optional) -->
    <info-profile :asset="'{{ asset('') }}'"></info-profile>

    <!-- SidebarSearch Form -->
    <div class="form-inline">
      <div class="input-group" data-widget="sidebar-search">
        <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-sidebar">
            <i class="fas fa-search fa-fw"></i>
          </button>
        </div>
      </div>
    </div>

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <!-- Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->
       
        <li class="nav-item">
          <router-link  to="/home"  class="nav-link">
            <i class="nav-icon fas fa-th"></i>
            <p>
              Inicio
            </p>
          </router-link>
        </li>
        <li class="nav-item">
          <router-link  to="/almacen"  class="nav-link">
            <i class="nav-icon fas fa-store"></i>
            <p>
              Almacen

            </p>
          </router-link>
        </li>
        <li class="nav-item">
          <router-link  to="/productos"  class="nav-link">
            <i class="nav-icon fas fa-shopping-basket"></i>
            <p>
              Productos

            </p>
          </router-link>
        </li>
        <li class="nav-item">
          <router-link  to="/rutas"  class="nav-link">
            <i class="nav-icon fas fa-route"></i>
            <p>
              Rutas

            </p>
          </router-link>
        </li>
        <li class="nav-item">
          <router-link  to="/vehiculos"  class="nav-link">
            <i class="nav-icon fas fa-car"></i>
            <p>
              Vehiculos
            </p>
          </router-link>
        </li>
         <li class="nav-item">
          <router-link  to="/clientes"  class="nav-link">
            <i class="nav-icon fas fa-user-tie"></i>
            <p>
              Clientes
            </p>
          </router-link>
        </li>
        <li class="nav-item">
          <router-link  to="/ventas_clientes"  class="nav-link">
            <i class="nav-icon fas fa-shopping-cart"></i>
            <p>
              Ventas Clientes
            </p>
          </router-link>
        </li>
        <li class="nav-item ">
          <a href="#" class="nav-link ">
            <i class="nav-icon fas fa-briefcase"></i>
            <p>
              Reportes
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <router-link  to="/reportes/vehiculos"  class="nav-link">
                <i class="nav-icon fas fa-shopping-cart"></i>
                <p>
                  Reportes vehiculos
                </p>
              </router-link>
            </li>
          </ul>
        </li>
      </ul>
    </nav>
    <!-- /.sidebar-menu -->
  </div>
  <!-- /.sidebar -->
</aside>