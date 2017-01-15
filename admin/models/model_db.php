<?php 
	require_once(config() . "db.php");
	switch($db["conector"]){
		case "mysql":
			include(conectors() . "mysql.php");
		break;

		case "postgres":
			include(conectors() . "postgres.php");
		break;
	}
?>