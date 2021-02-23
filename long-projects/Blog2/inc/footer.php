<?php  
$copyRight = $titleSlogan->copyRight();
$copy_right = $copyRight->fetch_assoc();
?>
<div class="footersection templete clear">
	  <div class="footermenu clear">
		<ul>
			<li><a href="#">Home</a></li>
			<li><a href="#">About</a></li>
			<li><a href="#">Contact</a></li>
			<li><a href="#">Privacy</a></li>
		</ul>
	  </div>
	  <p>&copy; <?= $copy_right['copy_right']; ?> <?php echo date("Y"); ?></p>
	</div>
	<div class="fixedicon clear">
		<a href="<?= $social['facebook']; ?>"><img src="images/fb.png" alt="Facebook"/></a>
		<a href="<?= $social['twitter']; ?>"><img src="images/tw.png" alt="Twitter"/></a>
		<a href="<?= $social['linkedin']; ?>"><img src="images/in.png" alt="LinkedIn"/></a>
		<a href="<?= $social['google']; ?>"><img src="images/gl.png" alt="GooglePlus"/></a>
	</div>
<script type="text/javascript" src="js/scrolltop.js"></script>
</body>
</html>