<?php 

spl_autoload_register(function($class_name){
	include_once 'system/lib/' . $class_name . ".php";
});
include_once "app/config/config.php";

$main = new Main();

?>