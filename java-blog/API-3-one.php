 
 <?php	
 
 require('db.php'); 
  
 @$id=$_GET["id"] ;
   
 
$result = mysqli_query($conn, "    SELECT * FROM wzskyline where id ='$id'; " );
       
if( $result==false){  ECHO 0;} else{
     while($row = mysqli_fetch_assoc($result)) { 	
	   echo json_encode((object)$row); 
     }
	   
  } 

 ?>