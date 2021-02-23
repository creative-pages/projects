<?php include 'inc/header.php' ?>


<h2>Category By Id</h2>
<hr>

<?php 
foreach ($catById as $value) {
	echo $value['name'] . "<br>";
}
?>



<?php include 'inc/footer.php' ?>