<?php  ob_start();
include 'inc/header.php';
?>
<?php 
$check = Session::get('customer_login');
    if($check== true){
        header('Location:index.php');
    }
 ?>
<?php

if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['register'])){
    $insert_Customer=$user->insert_Customer($_POST);
}
?>
 <script src="https://code.jquery.com/jquery-3.5.1.js" type="text/javascript" charset="utf-8" async defer></script>
<script src="js/tiny-mce/jquery.tinymce.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<section class="breadcrumb-section set-bg" data-setbg="img/1.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Đăng ký</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.php">Trang chủ</a>
                      
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="checkout spad">
    <div class="container">
        
        <div class="checkout__form">
            <h4>Đăng ký tài khoản</h4>
            <center><h3><?php if (isset($insert_Customer)) {
            echo $insert_Customer;

      } ?></h3></center>
            <form action="register.php" method="post">
                <div class="row">
                    <div class="modal-body">
                        <div class="checkout__input">
                            <p>Tài khoản<span>*</span></p>
                            <input type="text" name="username" placeholder="Nhập tên tài khoản">
                        </div>
                        <div class="checkout__input">
                            <p>Họ và tên<span>*</span></p>
                            <input type="text" name="name" placeholder="Nhập họ và tên">
                        </div>
                        <div class="checkout__input">
                            <p> Mật khẩu<span>*</span></p>
                            <input type="password" name="password" placeholder="Nhập mật khẩu">
                        </div>
                        <div class="checkout__input">
                            <p>Nhập lại mật khẩu<span>*</span></p>
                            <input type="password" name="repeatpassword" placeholder="Nhập lại mật khẩu">
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Số điện thoại<span>*</span></p>
                                    <input type="text" name="phone" placeholder="Nhập số điện thoại">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Email<span>*</span></p>
                                    <input type="text" name="email" placeholder="Nhập Email">
                                </div>
                            </div>
                            
                        </div>

                                <div class="checkout__input">
                                    <p>Địa chỉ<span>*</span></p>
                                    <input type="text" name="address" placeholder="Nhập địa chỉ">
                                </div>
                           
                        <td>
                        	
                        <center><button style="width: 100%;" type="submit" class="site-btn" name="register">Đăng ký</button></center>
                        </td>
                    </div>  	
                    
                </form>
            </div>
        </div>
        
    </section>
    

    <?php
    include 'inc/footer.php';
    
    ob_end_flush();?>