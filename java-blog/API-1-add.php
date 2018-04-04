 
 <?php
 
     require('db.php');  
     @$title=$_GET["title"] ;
	 @$record=$_GET["record"] ;
 
	 
  $sql = "INSERT INTO wzskyline    VALUES (NULL,'$title', '$record' ,sysdate());  ";

    if (mysqli_query($conn, $sql))   echo 1;
	else                             echo 0;    
?>
