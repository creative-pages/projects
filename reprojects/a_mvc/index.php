<?php 

spl_autoload_register(function($class_name) {
	include_once "system/libs/" . $class_name . ".php";
});
include_once 'config/config.php';

new Main();


?>