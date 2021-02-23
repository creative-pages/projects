<?php include "inc/header.php"; ?>

<h1>Category By Id</h1>
<hr>

<?php 
foreach ($catById as $key => $value) {
	echo $value['name'] . "<br>";
}
?>

<?php include "inc/footer.php"; ?>