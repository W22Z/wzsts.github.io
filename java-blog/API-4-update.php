 
 <?php
 
   require('db.php'); 
 
  
     @$id=$_GET["id"] ;
   
	 @$title=$_GET["title"] ;
	 @$record=$_GET["record"] ;
	 
 
  $sql = "  UPDATE      wzskyline  SET title ='$title',record ='$record'    WHERE id= '$id';  ";

    if (mysqli_query($conn, $sql))   echo 1;
	else                             echo 0;    
?>
