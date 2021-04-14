<?php 
    include 'inc/header.php';
?>
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>Thương Hiệu</span>
                        </div>
                         <?php 
                                    include 'config.php';
                                    $item_per_page = 8;
                                    $current_page = (!empty($_GET['page'])) ? $_GET['page'] : 1;
                                    $offset = ($current_page - 1) * $item_per_page;
                                  
                                    $totalRecords = mysqli_query($conn, "SELECT * FROM `tbl_product`  Where type = 1");
                                    
                                    $totalRecords = $totalRecords->num_rows;
                                    $totalPages = ceil($totalRecords / $item_per_page);
                                    if(!empty($where)){
                                        $products = mysqli_query($conn, "SELECT * FROM `tbl_product` where (".$where.") ORDER BY `productId` DESC LIMIT " . $item_per_page . " OFFSET " . $offset);
                                    }else{
                                        $products = mysqli_query($conn, "SELECT * FROM `tbl_product` Where type = 1 ORDER BY `productId` DESC LIMIT " . $item_per_page . " OFFSET " . $offset);
                                    }                                   
                                  
                     ?>
                         <?php
                             $show = $brand->show_brand();
                        if($show){
                           
                            while($result = $show->fetch_assoc()){                            
                        
                    ?>
                        <ul>

                            <li><a href="product.php?brandid=<?php echo $result['brandId'] ?>,&brandName=<?php echo $result['brandName'] ?>"><?php echo $result['brandName']; ?></a></li>
                            
                        </ul>
                        <?php
                    }
                        }
                        ?> 
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                           
                            <form action="product.php" method="GET">
                                <input type="text" name="namepro" placeholder="Bạn đang tìm gì ?">
                                <button type="" class="site-btn">Tìm kiếm</button>

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
                    <div class="hero__item set-bg" data-setbg="img/banner/banner.jpg">
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Sản Phẩm Nổi Bật</h2>
                    </div>
                    
                </div>
            </div>
            <div class="row featured__filter">
                <?php 
                if($products){
                    while($result =$products->fetch_assoc()){
               
             ?>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="admin/uploads/<?php echo $result['image']?>">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="details.php?proname=<?php echo $result['productName'] ?>"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><?php echo $result['productName'] ?></a></h6>
                            <h5><?php echo number_format($result['price'],0,",",".") ." VNĐ"?></h5>
                        </div>
                    </div>
                </div>
                <?php  
                }
            }
                ?>
                
            </div>
            
<style type="text/css" media="screen">
    #pagination123{
    text-align: right;
    margin-top: 15px;
}
.page-item123{
    border: 1px solid #ccc;
    padding: 5px 13px;
    color: #000;
}
.current-page123{
    background: #ccc;
    color: black;
}
            </style>

            <div id="pagination123">
    <?php
    if ($current_page > 3) {
        $first_page = 1;
        ?>
        <a class="page-item123" href="?per_page=<?= $item_per_page ?>&page=<?= $first_page ?>">Sau</a>
    <?php
    }
    if ($current_page > 1) {
        $prev_page = $current_page - 1;
        ?>
        <a class="page-item123" href="?per_page=<?= $item_per_page ?>&page=<?= $prev_page ?>">Trước</a>
    <?php }
    for ($num = 1; $num <= $totalPages; $num++) {
        ?>
        <?php if ($num != $current_page) { ?>
            <?php if ($num > $current_page - 3 && $num < $current_page + 3) { ?>
                <a class="page-item123" href="?per_page=<?= $item_per_page ?>&page=<?= $num ?>"><?= $num ?></a>
            <?php } ?>
        <?php } else { ?>
            <strong class="current-page123 page-item123"><?= $num ?></strong>
        <?php } ?>
    <?php
    }
    if ($current_page < $totalPages - 1) {
        $next_page = $current_page + 1;
        ?>
        <a class="page-item123" href="?per_page=<?= $item_per_page ?>&page=<?= $next_page ?>">Sau</a>
    <?php
    }
    if ($current_page < $totalPages - 3) {
        $end_page = $totalPages;
        ?>
        <a class="page-item123" href="?per_page=<?= $item_per_page ?>&page=<?= $end_page ?>">Last</a>
    <?php
}
?>
</div>

        </div>

    </section>
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Sản phẩm mới</h2>
                    </div>
                    
                </div>
            </div>
            <div class="row featured__filter">
                <?php 
                $get_ProductbyType = $pro->get_ProductNew();
                if($get_ProductbyType){
                    while($result =$get_ProductbyType->fetch_assoc()){
                
             ?>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="admin/uploads/<?php echo $result['image']?>">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="details.php?proname=<?php echo $result['productName'] ?>"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><?php echo $result['productName'] ?></a></h6>
                            <h5><?php echo number_format($result['price'],0,",",".") ." VNĐ"?></h5>
                        </div>
                    </div>
                </div>
                <?php  
                }
            }
                ?>
                
            </div>

        </div>

    </section>  
<?php   
    include 'inc/footer.php';
?>
