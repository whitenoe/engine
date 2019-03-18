<?php
   include 'connect.php';

   $sql =<<<EOF
      SELECT a.id, a.code, a.name, a.parent_id,a.create_date, b.name, c.price 
      from product a left join unit b on (a.id = b.product_id) left join price c 
      on (b.id = c.unit_id);
EOF;

   $ret = pg_query($db, $sql);
   if(!$ret) {
      echo pg_last_error($db);
      exit;
   } 
   while($row = pg_fetch_row($ret)) {      
      $data[] = array(
         "id"=> $row[0],
	 "code"=> $row[1],
	 "name"=> $row[2],
	 "parent_id"=> $row[3],
	 "unit"=> $row[5],
	 "price"=> $row[6],
	 "create_date"=> $row[4]

      );
   }
   pg_close($db);
   header('Content-type:application/json;charset=utf-8');
   echo json_encode($data);
  
?>
