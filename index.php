<?php
    include('header.php');    
?>
<header>           
    <?php
        include('navbar.php');
    ?>         
</header>
<section class="container-fluid">
    <!-- Page content-->
    <div class="row">                
        <?php
            if(isset($_GET['navigasi']))				
            {
                $show=($_GET['navigasi']);                
            }else{
                $show="home"; /*kondisi pertama halaman web diload*/
            }
            switch($show)
            {	
                case 'home':
                require ("WelcomeView.php");
                break;
                case 'AU':
                require ("aboutUs.php");
                break;	
                case 'A1':
                require ("re_hotel.php");
                break;
                case 'lr':
                require ("loginReg.php");
                break;                                                                                    
            }	
        ?>                
    </div>
</section>
<footer>
    <?php
        include('footerView.php');
    ?>
</footer>