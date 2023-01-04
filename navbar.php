<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="index.php?navigasi=home">HOTEL</a>  
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>  

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active navIcon">
                <a class="nav-link" href="index.php?navigasi=home"><i class="fa fa-home" aria-hidden="true"></i><span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="index.php?navigasi=AU">About US</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Menu
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="index.php?navigasi=A1">Hotel Recommendations</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item disabled" href="index.php?navigasi=A2">Under Maintenance</a>          
                    <a class="dropdown-item disabled" href="index.php?navigasi=A3">Under Maintenance</a>                    
                </div>                
            </li>            
        </ul>


        <div class="col d-flex justify-content-end">
            <div class="menu-media">
                <p class="mb-0 d-flex mrIconNav">                
                    <!-- Menargetkan modal yang ada pada file re_hotel.php -->
                    <a class="nav-link btn_modal1" data-toggle="modal" data-target="#formModalRecomendasi" href="#">
                        <!-- membuat icon search dengantooltip -->
                        <i class="fa fa-search" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" title="Klik disini ya, untuk mendapatkan rekomendasi hotel sesuai kebutuhan anda."></i></a>
                        <!-- ---------------------fungsi menampilkan tooltip saat di hover dg kursor----------------------------------- -->
                        <script>
                            $(function () {
                                $('[data-toggle="tooltip"]').tooltip();
                            });
                        </script>
                        <!-- -------------------------------------------------------- -->
                    <a href="#">
                        <img src="asset/image/UnknowUser.jpg" class="rounded-circle round_bt_Icon btn_user" alt="" loading="lazy"/>
                    </a>                
                </p>
            </div>
        </div>
        <!-- <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form> -->
    </div>
</nav>