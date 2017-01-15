<?php 
	error_reporting(E_ERROR | E_WARNING | E_PARSE); 
	define(BASE, dirname(__FILE__));
	require_once(BASE . "/loader.php");
	include(BASE . "/header.php");
	include(BASE . "/body.php");
	include(BASE . "/footer.php");
?>