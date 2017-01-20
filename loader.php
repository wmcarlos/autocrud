<?php 
	error_reporting(E_ERROR | E_WARNING | E_PARSE);
	define(ADMIN, ABSPATH . "/admin/");

	require_once(ADMIN . "helpers/helper_blog.php");
	include(templates() . "index.php");
?>