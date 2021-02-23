<?php include 'inc/header.php'; ?>
<?php 
if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['contact']) {
	$sendMsg = $forcontact->sendMessage($_POST);
}
?>
	<div class="contentsection contemplete clear">
		<div class="maincontent clear">
			<div class="about">
				<h2>Contact us</h2>
			<form action="" method="POST">
				<?php if (isset($sendMsg)) { echo $sendMsg; } ?>
				<table>
				<tr>
					<td>Your First Name:</td>
					<td>
					<input type="text" name="fname" placeholder="Enter first name" />
					<?php if (isset($forcontact->fname)) { echo $forcontact->fname; } ?>
					</td>
				</tr>
				<tr>
					<td>Your Last Name:</td>
					<td>
					<input type="text" name="lname" placeholder="Enter Last name" />
					<?php if (isset($forcontact->lname)) { echo $forcontact->lname; } ?>
					</td>
				</tr>
				
				<tr>
					<td>Your Email Address:</td>
					<td>
					<input type="text" name="email" placeholder="Enter Email Address" />
					<?php if (isset($forcontact->email)) { echo $forcontact->email; } ?>
					</td>
				</tr>
				<tr>
					<td>Your Message:</td>
					<td>
					<textarea name="message" placeholder="Enter Your Message"></textarea>
					<?php if (isset($forcontact->message)) { echo $forcontact->message; } ?>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
					<input type="submit" name="contact" value="Send"/>
					</td>
				</tr>
		</table>
	<form>				
 </div>

		</div>
		<?php include 'inc/sidebar.php'; ?>
	</div>
<?php include 'inc/footer.php'; ?>