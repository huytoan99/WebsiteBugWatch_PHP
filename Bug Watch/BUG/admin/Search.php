<?php
include('includes/header.php'); 
include('includes/navbar.php'); 

?>
<?php include '../classes/brand.php'?>
<?php include '../classes/category.php'?>
<?php include '../classes/product.php'?>

<style type="text/css">
  .scroll{
  height: 700px;
  overflow: scroll;
}
</style>
<?php 
  $fm 	 = new format();
  $brand = new brand();
  $cat 	 = new category();
  $prod  = new product();
  
          if(isset($_POST["delete_id"])){
          $id = $_POST["delete_id"];
        $delbrand = $prod->delete_productName($id);
          }
   
 ?>
<div class="card-body">

    <div class="table-responsive">

     <form action="" method="POST">
      <div class="scroll">

      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th> ID </th>
            <th> Tên Sản Phẩm </th>
            <th> Ảnh </th>
            <th> Thương Hiệu </th>
            <th> Giá Tiền (VNĐ) </th>           
            <th> Chi Tiết </th>
            <th> Thao tác </th>
          </tr>
        </thead>
        <tbody>
          <?php
           
            $prodList = $prod->Show_ProductAdmin();
            if($prodList){
              $i = 0;
              while ($result = $prodList->fetch_assoc()) {
                $i++;
            
          ?>
          <tr>
            <td> <?php echo $i; ?> </td>
            <td> <?php echo $result['productName']; ?></td>
            <td><img src="uploads/<?php echo $result['image']?>" width="80px" height="90px"></td> 
            <td> <?php echo $result['brandName']; ?></td>        
            <td><?php echo $fm->format_currency($result['price']) ?></td>
             
           

            <td>
                <form action="" method="post ">
                   
                    <a href="productdetails.php?name=<?php echo $result['productName']?>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">Chi Tiết </a>
                    
                </form>
            </td>
            <td>
                <form action="" method="post">
                  <input type="hidden" name="delete_id" value="<?php echo $result['productName']?>">
                  <button  type="submit" name="delete_btn" class="btn btn-danger">Xóa</button>
                </form>
            </td>
          </tr>
        <?php
          }
            }
            ?>  
        </tbody>
      </table>
      </div>
       </form>

    </div>
  </div>
</div>

</div>

<script>
    $(document).ready(function(){
        $('#category').change(function(){
            var catName = $('#category option:selected').text();
            data = {
                category:1,
                catName:catName
            };
            $.ajax({
                url:"size.php",
                type:"POST",
                data:data
            }).done(function(result){
                $('#size').html(result);
                
            })
        })

    });
</script>

<?php
include('includes/scripts.php');
?>

