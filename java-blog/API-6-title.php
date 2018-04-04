 
 <?php
 
     require('db.php');   
	$list=array();
    $index=0;    
$result = mysqli_query($conn, "      SELECT  title FROM `wzskyline`  group by title ; " );
       
if( $result==false){  ECHO 10;} else{
     while($row = mysqli_fetch_assoc($result)) { 	
	 $list[$index]=$row;  $index=$index+1;  
 
     } 
  } 
echo json_encode((object)$list); 
?>