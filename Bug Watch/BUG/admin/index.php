<?php
include('includes/header.php'); 
include('includes/navbar.php'); 
include ("../helpers/format.php");

?>
<?php include '../classes/bill.php'?>
<?php include '../classes/admin.php'?>


<div class="container-fluid">
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Thông Tin</h1>
    <a href="backup_data.php" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
        class="fas fa-download fa-sm text-white-50"></i> Sao Lưu Dữ Liệu </a>
  </div>
  <div class="row">

    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-primary shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Thành Viên</div>
              <div class="h5 mb-0 font-weight-bold text-gray-800">
              <?php 
                $admin=new admin();
                $quantityAdmin=$admin->get_quantity_admin();
                while($data=mysqli_fetch_array($quantityAdmin)){

               ?>
               <h4>Số Lượng Admin: <?php echo $data['admin_User'] ?> </h4>
              <?php } ?>
              </div>
            </div>
            <div class="col-auto">
              <i class="fas fa-calendar fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-success shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Doanh Thu</div>
              <?php 
                $fm = new Format();
                $bill = new bill();
                $gettotal = $bill->totalprice();
                if($gettotal){
                  while ($result = $gettotal->fetch_assoc()) {                 

                  ?>
                <div class="h5 mb-0 font-weight-bold text-gray-800"><?php echo $fm->format_currency($result['total']) ?> VNĐ</div>
              <?php 
                  }
                }

               ?>
              
            </div>
            <div class="col-auto">
              <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-info shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Số lượng bán ra</div>
              <div class="row no-gutters align-items-center">
                <div class="col-auto">
                  <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">40</div>
                </div>
                <div class="col">
                  <div class="progress progress-sm mr-2">
                    <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50"
                      aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-auto">
              <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-warning shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-warning text-uppercase mb-1"><a  style="color: #F6C23E" href="listbill.php">Số Lượng Đơn</a></div>
              <div class="h5 mb-0 font-weight-bold text-gray-800">
                <?php                
                $pending =$bill->getPending();
                if($pending){
                  while ($result = $pending->fetch_assoc()) {                  
                  ?>
                  <?php echo $result['status'] ?>
                  
                  <?php 

                  }
                }
                ?>

               </div>
            </div>
            <div class="col-auto">
              <i class="fas fa-comments fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <?php
include('includes/scripts.php');
include('includes/footer.php');
?>