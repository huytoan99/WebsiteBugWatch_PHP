<?php 
session_start();
error_reporting(0);
$conn=mysqli_connect("localhost","root","","db_sport");
mysqli_query($conn,'SET NAMES "utf8"'); // hiển thị tiếng việt
$sql="select * from tbl_order";
$kq=mysqli_query($conn,$sql);

$output='';

$output.='<span style="width:150px;color:red;text-align: center;">
                     Cửa Hàng Đồng Hồ BUG Watch ♥ </span>
           <br><span style="width:150px;color:red;text-align: center;">Hotline: 0378.605.703</span>

     <br><span style="width:150px;color:red;text-align: center;">Địa chỉ:TP. Hải Dương, Tỉnh Hải Dương</span>';
     
    if (mysqli_num_rows($kq)) {
        $output.='<table class="table" bordered="1">
            <tr>
                <th>Số TT</th>
                <th>Mã Đơn Hàng </th>
                <th>Ngày Đặt Hàng</th>
                <th>Khách Hàng</th>
                <th>Tổng Tiền</th>
            </tr>';
            $i=1;
        while($hang=mysqli_fetch_object($kq))
        {
            $output.='
            <tr><td>'.$i.'</td>
                <td>'.$hang->order_Id.'</td>
                <td>'.$hang->date.'</td>
               <td>'.$hang->receiver.'</td>
                <td>'.$hang->totalprice.'</td>
            </tr>
            ';
            $i++;
        }
        $output.='</table>';
        header("Content-Type:application/xls");
        header("Content-Disposition: attachment; filename=download.xls");
        echo $output;
    }
//}
 ?>

 
