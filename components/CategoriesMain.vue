<template>
  <div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-dark navbar-dark shadow">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Online Store<span class="badge bg-primary"></span></a>
        <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-content">
          <div class="hamburger-toggle">
            <div class="hamburger">
              <span></span>
              <span></span>
              <span></span>
            </div>
          </div>
        </button>
        <div class="collapse navbar-collapse" id="navbar-content">
          <ul class="navbar-nav mr-auto mb-2 mb-lg-0">

            <li class="nav-item dropdown dropdown-mega position-static">
              <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" data-bs-auto-close="outside">Megamenu</a>
              <div class="dropdown-menu shadow">
                <div class="mega-content px-4">
                  <div class="container-fluid">
                    <div class="row">
                      <div class="col-12 col-sm-4 col-md-3">
                        <h5>Категории</h5>
                        <div style="min-width:300px;" class="list-group">
                          <a style="border:none;" class="list-group-item" href="#">категория</a>
                        </div>
                      </div>

                    </div>
                  </div>
                </div>
              </div>
            </li>

          </ul>
        </div>
      </div>
    </nav>
  </div>
</template>
