<?php 
if (isset($ti_su_lo)) {
	foreach ($ti_su_lo as $value) {
		$title = $value['title'];
		$subtitle = $value['subtitle'];
		$logo = $value['logo'];
	}
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>PHP || Dynamic Website</title>
		<link rel="stylesheet" href="<?= BASE_URL; ?>css/bootstrap.css">
	</head>
	<body>
		<div class="container-fluid  bg-primary">
			<div class="container py-2">
				<div class="row">
					<div class="col-sm-2">
						<a href="<?= BASE_URL; ?>">
							<img style="width: 100px; height: 100px;" src="<?= BASE_URL; ?>images/logo/<?= isset($logo) ? $logo : ''; ?>" alt="">
						</a>
					</div>
					<div class="col-sm-10 text-right text-white">
						<h1 class="text-uppercase"><?= isset($title) ? $title : ''; ?></h1>
						<h3><?= isset($subtitle) ? $subtitle : ''; ?></h3>
					</div>
				</div>
			</div>
		</div>