</div>
</div>
<div class="container-fluid  bg-primary">
<div class="container py-3">
<div class="row">
	<div class="col-sm-6">
		<h3 class="text-white text-uppercase border-bottom d-inline-block mb-3">Menu</h3>
		<ul class="nav d-block">
			<li class="nav-item">
				<a class="bg-primary d-block text-white px-3 py-1 mr-2 rounded text-decoration-none" href="<?= BASE_URL; ?>" class="nav-link">Home</a>
			</li>
		<?php 
			if ($menu) {
				foreach ($menu as $value) {
			?>
			<li class="nav-item">
				<a class="bg-primary d-block text-white px-3 py-1 mr-2 rounded text-decoration-none" href="<?= BASE_URL; ?>Website/page/<?= $value['id']; ?>" class="nav-link"><?= $value['name']; ?></a>
			</li>
			<?php
				}
			}
		?>
		</ul>
	</div>
	<?php
	if (isset($ti_su_lo)) {
		foreach ($ti_su_lo as $value) {
			$num_one = $value['num_one'];
			$num_two = $value['num_two'];
			$mail_one = $value['mail_one'];
			$mail_two = $value['mail_two'];
		}
	}
	?>
	<div class="col-sm-6">
		<h3 class="text-white text-uppercase border-bottom d-inline-block mb-3">Contact</h3>
		<div class="row">
			<div class="col-sm-6">
				<h6 class="text-white text-uppercase border-bottom d-inline-block mb-2">Mobile:</h6>
				<ul class="list-unstyled">
					<li class="text-white py-1"><?= isset($num_one) ? $num_one : ''; ?></li>
					<li class="text-white py-1"><?= isset($num_two) ? $num_two : ''; ?></li>
				</ul>
				
			</div>
			<div class="col-sm-6">
				<h6 class="text-white text-capitalize border-bottom d-inline-block mb-2">Mail:</h6>
				<ul class="list-unstyled">
					<li>
						<a class="text-white text-decoration-none" href="mailto:<?= isset($mail_one) ? $mail_one : ''; ?>"><?= isset($mail_one) ? $mail_one : ''; ?></a>
					</li>
					<li>
						<a class="text-white text-decoration-none" href="mailto:<?= isset($mail_two) ? $mail_two : ''; ?>"><?= isset($mail_two) ? $mail_two : ''; ?></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</body>
</html>