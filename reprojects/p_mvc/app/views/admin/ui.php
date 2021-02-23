<h3 class="mb-0 px-3">UI Option</h3>
<hr class="my-2">
<div class="container">
	<div class="row">
		<div class="col-sm-6 offset-sm-3">
			<form action="<?= BASE_URL; ?>/Admin/uiOption" method="POST">
				<?php 
				if (isset($change_ui)) {
					echo $change_ui;
				}
				?>
				<table class="table table-borderless">
					<tr>
						<td class="pt-4">Change Background</td>
						<td>
							<input class="form-control" type="color" name="color">
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input class="btn btn-primary" type="submit" name="change_ui" value="Change">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
