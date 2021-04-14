<?php 
ob_start();
    include 'inc/header.php';
?>
<?php 
    if(!isset($_GET['proname']) || $_GET['proname']==NULL){
        echo "<script>window.location = '404.php'</script>";
        
    }else{
        $name = $_GET['proname'];
    }
    if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])){

      $size = "XL"; 
       $quantity = $_POST['quantity'];
       $addCart = $ct->AddToCart($name,$quantity,$size);
   }
 ?>
  
    <section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>Thương Hiệu</span>
                    </div>
                    <ul>
                             <?php
                        $show = $brand->show_brand();
                        if($show){
                           
                            while($result = $show->fetch_assoc()){
                         ?>      
                        <li><a href="product.php?brandid=<?php echo $result['brandId'] ?>,&brandName=<?php echo $result['brandName'] ?>"><?php echo $result['brandName'] ?></a></li>
                        <?php 
                            }
                        }
                         ?>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="product.php" method="GET">
                                <input type="text" name="namepro" placeholder="Bạn đang tìm gì ?">
                                <button type="" class="site-btn">Tìm Kiếm</button>

                            </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>0378.605.703</h5>
                            <span>Hỗ trợ 24/7 </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
    <section class="breadcrumb-section set-bg" data-setbg="img/1.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Chi Tiết Sản Phẩm</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Trang Chủ</a>
                            <a href="./index.html">Sản Phẩm</a>
                            <span>Chi Tiết Sản Phẩm</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <form action="" method="post">  
     <?php
                    
                    $prodList = $pro->get_1Product($name);
                    if($prodList){
                    
                        while ($result_1pro = $prodList->fetch_assoc()) {
                            
                        
                 ?>

    <section class="product-details spad">
        <div class="container">

            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="admin/uploads/<?php echo $result_1pro['image']?>" alt="">
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3><?php echo $result_1pro['productName'] ?></h3>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 reviews)</span>
                        </div>
                        <div class="product__details__price"><?php echo  $fm->format_currency($result_1pro['price']) ?> VNĐ</div>
                        <p><?php echo $result_1pro['description']?></p>
                         
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input name="quantity" type="text" value="1" min="1">
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="site-btn" name="submit">Thêm vào giỏ hàng</button>
                        
                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                        <ul>
                            <li><b>Tình Trạng</b> <span>Còn Hàng</span></li>
                            <li><b>Vận chuyển</b> <span>2 - 3 ngày vận chuyển. <samp>Free ship cho bạn</samp></span></li>
                            <li><b>Cân nặng</b> <span>0.5 kg</span></li>
                            <li><b>Chia sẻ</b>
                                <div class="share">
                                    <a href="http://facebook.com/HuyToanProx"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">Mô tả</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">Thông tin chi tiết</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">Reviews <span>(1)</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Thông tin sản phẩm</h6>
                                    <p><?php echo $result_1pro['description']?></p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Thông tin sản phẩm</h6>
                                    <p><?php echo $result_1pro['description']?></p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Thông tin sản phẩm</h6>
                                    <p><?php echo $result_1pro['description']?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
      <?php  
                                    }
                                }
                                ?>
                                </form> 
<?php
    
    include 'inc/footer.php';
    
ob_end_flush();
?>