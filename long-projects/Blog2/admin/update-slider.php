<?php include 'inc/header.php'; ?>
<?php include 'inc/sidebar.php'; ?>
<?php 
if (!isset($_GET['sliderId']) || $_GET['sliderId'] == NULL) {
    header("Location: slider-list.php");
} else {
    $id = $_GET['sliderId'];
    $singleSlider = $slider->singleSlider($id);
    $single_slider = $singleSlider->fetch_assoc();
}
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_slider'])) {
    $updateMsg = $slider->updateSlider($_POST);
}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Add New Slider</h2>
               <div class="block copyblock"> 
                 <form action="" method="POST" enctype="multipart/form-data">
                    <?php if (isset($updateMsg)) { echo $updateMsg; } ?>
                    <table class="form">
                        <tr>
                            <td>Add Title</td>
                            <td>
                                <input type="hidden" name="id" value="<?= $single_slider['id']; ?>">
                                <input type="hidden" name="old_file" value="<?= $single_slider['image']; ?>">
                                <input type="text" name="title" value="<?= $single_slider['title']; ?>" placeholder="Enter Title..." class="medium" />
                                <?php if (isset($slider->title)) { echo $slider->title; } ?>
                            </td>
                        </tr>                   
                        <tr>
                            <td>Select Image</td>
                            <td>
                                <input type="file" name="image" class="medium" />
                                <?php if (isset($slider->image)) { echo $slider->image; } ?>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <img style="width: 200px;" src="uploads/slider/<?= $single_slider['image']; ?>" alt="">
                            </td>
                        </tr>
						<tr>
                            <td></td>
                            <td>
                                <input type="submit" name="update_slider" Value="Update" />
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
        </div>
<?php include 'inc/footer.php'; ?>
