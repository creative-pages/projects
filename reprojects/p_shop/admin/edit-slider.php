<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 
if (!isset($_GET['editId']) || $_GET['editId'] == NULL) {
    header("Location: sliderlist.php");
} else {
    $id = $_GET['editId'];
    $selectSlider = $slider->selectSlider($id);
    $select_slider = $selectSlider->fetch_assoc();
}
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_slider'])) {
    $updateSlider = $slider->updateSlider($_POST);
}
?>
<div class="grid_10">
    <div class="box round first grid">
        <h2>Update Slider</h2>
    <div class="block">               
         <form action="" method="post" enctype="multipart/form-data">
            <?php if (isset($updateSlider)) { echo $updateSlider; } ?>
            <table class="form">     
                <tr>
                    <td>
                        <label>Title</label>
                    </td>
                    <td>
                        <input type="hidden" name="id" value="<?= $select_slider['id']; ?>">
                        <input type="hidden" name="old_file" value="<?= $select_slider['image']; ?>">
                        <input type="text" name="title" value="<?= $select_slider['title']; ?>" placeholder="Enter Slider Title..." class="medium" />
                        <?php if (isset($slider->title)) { echo $slider->title; } ?>
                    </td>
                </tr>           
    
                <tr>
                    <td>
                        <label>Upload Image</label>
                    </td>
                    <td>
                        <input type="file" name="image"/>
                        <?php if (isset($slider->image)) { echo $slider->image; } ?>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <img style="width: 300px;" src="uploads/slider/<?= $select_slider['image']; ?>" alt="">
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
<?php include 'inc/footer.php';?>