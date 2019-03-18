<?php
   $host        = "host = localhost";
   $port        = "port = 5432";
   $dbname      = "dbname = kependudukan";
   $credentials = "user = postgres password = postgres";

   $db = pg_connect("$host $port $dbname $credentials");
   if(!$db) {
      echo "Error : Unable to open database\n";
   } else {
   #   echo "Opened database successfully\n";
   }

   $sql =<<<EOF
      SELECT * from propinsi;
EOF;

   $ret = pg_query($db, $sql);
   if(!$ret) {
      echo pg_last_error($db);
      exit;
   } 
   while($row = pg_fetch_row($ret)) {      
      $data[] = array(
         "id"=> $row[0],
	 "name"=> $row[1],
	 "create_date"=> $row[3]
      );
   }
   #echo "Operation done successfully\n";
   echo json_encode($data);
   pg_close($db);
?>
