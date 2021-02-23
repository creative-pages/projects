
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>PHP || Dynamic Website</title>
	<link rel="stylesheet" href="<?= BASE_URL; ?>/css/bootstrap.css">
	<link rel="stylesheet" href="<?= BASE_URL; ?>/css/style.css">
	<style>
	.header,
	.footer {
		<?php 
			if (isset($change_color)) {
			foreach ($change_color as $value) {
			?>
			background-color: <?= $value['color']; ?>!important;
			<?php
			}
		}
		?>
	}
	</style>
</head>
<body>

	<div class="container-fluid px-0">
		<div class="py-4 px-3 bg-primary header">
			<h2 class="text-center text-white">
				<a class="text-decoration-none text-white" href="<?= BASE_URL; ?>">MVC || Admin Panel</a>
			</h2>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">