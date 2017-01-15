<?php 
	global $url;
	function models(){
		global $url;
		$url = BASE . "/models/";
		return $url;
	}

	function controllers(){
		global $url;
		$url = BASE . "/controllers/";
		return $url;
	}

	function views(){
		global $url;
		$url = BASE . "/views/";
		return $url;
	}

	function helpers(){
		global $url;
		$url = BASE . "/helpers/";
		return $url;
	}

	function config(){
		global $url;
		$url = BASE . "/config/";
		return $url;
	}

	function assets(){
		include(config() . "server.php");
		global $url;
		$url = "http://". $server["host"] ."/". $server["folder"] . "/admin/views/";
		return $url;
	}

	function conectors(){
		global $url;
		$url = BASE . "/conectors/";
		return $url;
	}

	function db(){
		global $url;
		$url = BASE . "/db/";
		return $url;
	}
?>