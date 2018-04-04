
 
 <?php
 //化抽象为本质，java object 类
 require('db.php');  
   	$list=array();
    $index=0;    
        @$kind=$_GET["key"];
		 
	@$page=($_GET["page"]-1)*5;
	@$page=0;
	@$page=(int)$page;
	switch ($kind)
{
  case 1:
   $sql1="    SELECT * FROM blog    limit $page,5 ; ";
   $sql2= "    SELECT COUNT(*) cc FROM blog   " ;
   
  break;  
  case 2:   
     $sql1="    SELECT * FROM ship    limit $page,5 ; ";
   $sql2= "    SELECT COUNT(*) cc FROM ship   " ;
   
  break;
  case 3:
    $sql1="    SELECT * FROM msg    limit $page,5 ; ";
   $sql2= "    SELECT COUNT(*) cc FROM msg   " ;
  break; 
  case 4:
     $sql1="    SELECT * FROM collect    limit $page,5 ; ";
   $sql2= "    SELECT COUNT(*) cc FROM collect   " ;    
   
  break; 
default:
  $sql1="    SELECT * FROM comments    limit $page,5 ; ";
   $sql2= "    SELECT COUNT(*) cc FROM comments   " ;  
}

$result = mysqli_query($conn, $sql1 );
       
if( $result==false){  ECHO 0;} else{
     while($row = mysqli_fetch_assoc($result)) { 	
	 $list[$index]=$row;  $index=$index+1;  
  
     }
	   
  } 

  $result2 = mysqli_query($conn, $sql2); 
  $cc=0;  
if( $result2==false){  ECHO 0;} else{
     while($row2 = mysqli_fetch_assoc($result2)) { 	
       $cc=$row2["cc"];
     }
	 
	 
	 $data=array("allpage"=> floor(($cc-1)/3)+1,"list"=>$list);
     echo json_encode((object)$data); 
  }

?>