<?php 
	function geturl(){
		$v = $_GET["v"];
		if(isset($v) and !empty($v)){
			$view = views() . "view_".$v.".php";
			$controller = controllers() . "controller_".$v.".php";
			if(is_file($controller) and is_file($view)){
				include($controller);
				include($view);
			}else{
				include(views() . "view_404.php");
			}
		}else{
			include(views() . "view_home.php");
		}
	}
?>