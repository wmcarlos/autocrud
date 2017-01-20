<?php 
	require_once(models() . "model_user.php");
	$moduser = new model_user();

	$moduser->username = $_POST["txtusername"];
	$moduser->password = $_POST["txtpassword"];

	$txtoperation = $_POST["txtoperation"];

	switch ($txtoperation) {
		case "login":
			$getr = $moduser->get("login");
			if(count($getr) > 0){
				$_SESSION["username"] = $getr[0]["username"];
				$_SESSION["password"] = $getr[0]["password"];
				$_SESSION["role_id"] = $getr[0]["role_id"];
				header("location: ?v=dashboard");
			}else{
				$get_error = 1;
			}
		break;

		case "logout":
			unset($_SESSION["username"]);
			unset($_SESSION["password"]);
			unset($_SESSION["role_id"]);
			session_destroy();
			header("location: ?v=login");
		break;
	}
?>