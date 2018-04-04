
 
 <?php
 
 require('db.php');  
   	$list=array();
    $index=0;    
	 @$title=$_GET["title"];
    @$page=($_GET["page"]-1)*5;
	@$page=(int)$page;
$result = mysqli_query($conn, "    SELECT id,title, left(record,30) record ,recordtime FROM wzskyline where  title  ='$title'  limit $page,5 ; " );
       
if( $result==false){  ECHO 10;} else{
     while($row = mysqli_fetch_assoc($result)) { 	
	 $list[$index]=$row;  $index=$index+1;  
 
     }
	   
  } 

  $result2 = mysqli_query($conn, "    SELECT COUNT(*) cc FROM wzskyline where     title  ='$title'  ; " ); 
  $cc=0;  
if( $result2==false){  ECHO 20;} else{
     while($row2 = mysqli_fetch_assoc($result2)) { 	
       $cc=$row2["cc"];
     }
	 
	 
	 $data=array("allpage"=> floor(($cc-1)/3)+1,"list"=>$list);
     echo json_encode((object)$data); 
  }

?>