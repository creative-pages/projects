<?php include "inc/header.php"; ?>

<h1>Category List</h1>
<hr>

<?php 
foreach ($cat as $key => $value) {
	echo $value['name'] . "<br>";
}
?>

<?php include "inc/footer.php"; ?>