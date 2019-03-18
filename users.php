<?php
   include 'connect.php';

   $sql =<<<EOF
      SELECT * from auth_user;
EOF;

   $ret = pg_query($db, $sql);
   if(!$ret) {
      echo pg_last_error($db);
      exit;
   } 
   while($row = pg_fetch_row($ret)) {      
      $data[] = array(
         "id"=> $row[0],
	 "username"=> $row[4],
	 "password"=> $row[1],
	 "first_name"=> $row[5],
	 "email"=> $row[7],
	 "create_date"=> $row[10]
      );
   }
   
   echo json_encode($data);
   pg_close($db);
?>
