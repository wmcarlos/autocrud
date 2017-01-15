<?php 
	global $url;
	function templates(){
		global $url;
		include(PUBASE . "/admin/config/server.php");
		$url = PUBASE . "/templates/".$server["template"]."/";
		return $url;
	}

	function template_assets(){
		include(PUBASE . "/admin/config/server.php");
		global $url;
		$url = "http://". $server["host"] ."/". $server["folder"] . "/templates/".$server["template"]."/";
		return $url;
	}

	function getheader(){
		include(templates() . "header.php");
	}

	function getbody(){
		include(templates() . "body.php");
	}

	function getfooter(){
		include(templates() . "footer.php");
	}

	function getwidget(){
		include(templates() . "widget.php");
	}
?>