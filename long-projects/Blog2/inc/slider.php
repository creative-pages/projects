<div class="slidersection templete clear">
        <div id="slider">
        	<?php 
        	$viewSlider = $slider->viewSlider();
        	if ($viewSlider) {
        		while ($view_slider = $viewSlider->fetch_assoc()) {
        	?>
			<a href="#"><img style="height: 300px!important;" src="admin/uploads/slider/<?= $view_slider['image']; ?>" alt="nature 1" title="<?= $view_slider['title']; ?>" /></a>
        	<?php
        		}
        	}
        	?>
        </div>

</div>