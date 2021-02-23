<?php include 'inc/header.php'; ?>
<?php include 'inc/sidebar.php'; ?>
<?php 
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add_slider'])) {
    $insertMsg = $slider->addSlider($_POST);
}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Add New Slider</h2>
               <div class="block copyblock"> 
                 <form action="" method="POST" enctype="multipart/form-data">
                    <?php if (isset($insertMsg)) { echo $insertMsg; } ?>
                    <table class="form">
                        <tr>
                            <td>Add Title</td>
                            <td>
                                <input type="text" name="title" placeholder="Enter Title..." class="medium" />
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
                            <td>
                                <input type="submit" name="add_slider" Value="Add" />
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
        </div>
<?php include 'inc/footer.php'; ?>
