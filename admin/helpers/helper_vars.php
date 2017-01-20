<?php 
	global $url;
	function models(){
		global $url;
		$url = ADMPATH . "/models/";
		return $url;
	}

	function controllers(){
		global $url;
		$url = ADMPATH . "/controllers/";
		return $url;
	}

	function views(){
		global $url;
		$url = ADMPATH . "/views/";
		return $url;
	}

	function helpers(){
		global $url;
		$url = ADMPATH . "/helpers/";
		return $url;
	}

	function config(){
		global $url;
		$url = ADMPATH . "/config/";
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
		$url = ADMPATH . "/conectors/";
		return $url;
	}

	function db(){
		global $url;
		$url = ADMPATH . "/db/";
		return $url;
	}
?>