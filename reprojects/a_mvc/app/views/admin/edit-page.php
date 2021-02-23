<!-- editor php start -->
<?php 
// textarea
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['textarea'])) {
	$textarea = $_POST['text'];
}
?>
<!-- editor php start -->


<!-- all modal start -->
<!-- textarea -->
<div class="modal fade" id="textarea" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Add Text</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="" method="POST">
	      <div class="modal-body">
	        <textarea name="text" class="form-control" rows="5"></textarea>
	      </div>
	      <div class="modal-footer">
	        <button type="submit" name="textarea" class="btn btn-primary">Save</button>
	      </div>
      </form>
    </div>
  </div>
</div>
<!-- all modal end -->



<?php 
if ($content) {
	foreach ($content as $value) {
		$id = $value['id'];
		$contents = $value['body'];
	}
}
?>
<h2 class="mt-2">Edit Page</h2>
<hr class="my-2">
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="elements">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#textarea">Textare</button>
			</div>
			<form action="<?= BASE_URL; ?>Page/editPage" method="POST">
				<table class="table table-borderless">
					<?php 
					if (isset($edit_content)) {
						echo $edit_content;
					}
					?>
					<tr>
						<td>
							<?= isset($contents) ? $contents : ''; ?>
							<input type="hidden" name="id" value="<?= isset($id) ? $id : ''; ?>">
							<textarea name="body" class="form-control" rows="15"><?= isset($contents) ? $contents : ''; ?><?= isset($textarea) ? $textarea : ''; ?>
							</textarea>
						</td>
					</tr>
					<tr>
						<td>
							<input class="btn btn-primary" type="submit" name="edit_content" value="Update">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>