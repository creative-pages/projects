<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 
$topBrand = $brand->topBrand();
$top_brand = $topBrand->fetch_assoc();

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['top_brand'])) {
	$updateMsg = $brand->updateTopBrand($_POST);
}
?>
<div class="grid_10">
    <div class="box round first grid">
        <h2> Dashbord</h2>
        <div class="block">               
          <div class="container">
          	<div class="row">
          		<div class="col-sm-8 offset-sm-2">
          			<form action="" method="POST">
          				<?php if (isset($updateMsg)) { echo $updateMsg; } ?>
          				<table class="table table-borderless">
          					<tr>
          						<td class="pt-4">Select First Brand</td>
          						<td>
          							<select class="form-control" name="first_brand">
          								<option value="">Select First Brand</option>
          								<?php 
			                            $allBrand = $brand->allBrand();
			                            if ($allBrand) {
			                                while ($result = $allBrand->fetch_assoc()) {
			                            ?>
			                            <option <?= $top_brand['first_brand'] == $result['id'] ? 'selected' : ''; ?> value="<?= $result['id']; ?>"><?= $result['name']; ?></option>
			                            <?php
			                                }
			                            }
			                            ?>
          							</select>
          							<?php if (isset($brand->first_brand)) { echo $brand->first_brand; } ?>
          						</td>
          					</tr>
          					<tr>
          						<td class="pt-4">Select Second Brand</td>
          						<td>
          							<select class="form-control" name="second_brand">
          								<option value="">Select Second Brand</option>
          								<?php 
			                            $allBrand = $brand->allBrand();
			                            if ($allBrand) {
			                                while ($result = $allBrand->fetch_assoc()) {
			                            ?>
			                            <option <?= $top_brand['second_brand'] == $result['id'] ? 'selected' : ''; ?> value="<?= $result['id']; ?>"><?= $result['name']; ?></option>
			                            <?php
			                                }
			                            }
			                            ?>
          							</select>
          							<?php if (isset($brand->second_brand)) { echo $brand->second_brand; } ?>
          						</td>
          					</tr>
          					<tr>
          						<td class="pt-4">Select Third Brand</td>
          						<td>
          							<select class="form-control" name="third_brand">
          								<option value="">Select Third Brand</option>
          								<?php 
			                            $allBrand = $brand->allBrand();
			                            if ($allBrand) {
			                                while ($result = $allBrand->fetch_assoc()) {
			                            ?>
			                            <option <?= $top_brand['third_brand'] == $result['id'] ? 'selected' : ''; ?> value="<?= $result['id']; ?>"><?= $result['name']; ?></option>
			                            <?php
			                                }
			                            }
			                            ?>
          							</select>
          							<?php if (isset($brand->third_brand)) { echo $brand->third_brand; } ?>
          						</td>
          					</tr>
          					<tr>
          						<td class="pt-4">Select Fourth Brand</td>
          						<td>
          							<select class="form-control" name="fourth_brand">
          								<option value="">Select Fourth Brand</option>
          								<?php 
			                            $allBrand = $brand->allBrand();
			                            if ($allBrand) {
			                                while ($result = $allBrand->fetch_assoc()) {
			                            ?>
			                            <option <?= $top_brand['fourth_brand'] == $result['id'] ? 'selected' : ''; ?> value="<?= $result['id']; ?>"><?= $result['name']; ?></option>
			                            <?php
			                                }
			                            }
			                            ?>
          							</select>
          							<?php if (isset($brand->fourth_brand)) { echo $brand->fourth_brand; } ?>
          						</td>
          					</tr>
          					<tr>
          						<td></td>
          						<td>
          							<input type="submit" name="top_brand" value="Update">
          						</td>
          					</tr>
          				</table>
          			</form>
          		</div>
          	</div>
          </div>
        </div>
    </div>
</div>
<?php include 'inc/footer.php';?>