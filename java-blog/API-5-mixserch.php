 
 <?php
 
     require('db.php');  
     @$serch="%".$_GET["serch"]."%"; 
	$list=array();
    $index=0;    
$result = mysqli_query($conn, "    SELECT  id,title, left(record, 30) record,recordtime FROM wzskyline where record like '$serch' ; " );
       
if( $result==false){  ECHO 10;} else{
     while($row = mysqli_fetch_assoc($result)) { 	
	 $list[$index]=$row;  $index=$index+1;  
 
     } 
  } 
echo json_encode((object)$list); 
?>