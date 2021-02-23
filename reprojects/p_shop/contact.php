<?php include 'inc/header.php'; ?>
<?php 
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['contact'])) {
	$name = $_POST['name'];
	$email = $_POST['email'];
	$phone = $_POST['phone'];
	$subject = $_POST['subject'];
	$message = $_POST['message'];
	$insertMessage = $contact->insertMessage($_POST);
}
?>
 <div class="main">
    <div class="content">
    	<div class="support">
  			<div class="support_desc">
  				<h3>Live Support</h3>
  				<p><span>24 hours | 7 days a week | 365 days a year &nbsp;&nbsp; Live Technical Support</span></p>
  				<p> It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.</p>
  			</div>
  				<img src="web/images/contact.png" alt="" />
  			<div class="clear"></div>
  		</div>
    	<div class="section group">
				<div class="col span_2_of_3">
				  <div class="contact-form">
				  	<h2>Contact Us</h2>
					    <form action="" method="POST">
					    	<div>
						    	<span><label>NAME</label></span>
						    	<span><input type="text" name="name" value="<?= isset($name) ? $name : ''; ?>" placeholder="Enter Your Name"></span>
						    	<?php if (isset($contact->name)) { echo $contact->name; } ?>
						    </div>
						    <div>
						    	<span><label>E-MAIL</label></span>
						    	<span><input class="form-control" type="email" name="email" value="<?= isset($email) ? $email : ''; ?>" placeholder="Enter Your Email"></span>
						    	<?php if (isset($contact->email)) { echo $contact->email; } ?>
						    </div>
						    <div>
						     	<span><label>MOBILE.NO</label></span>
						    	<span><input type="text" name="phone" value="<?= isset($phone) ? $phone : ''; ?>" pattern="01[3|4|5|6|7|8|9][0-9]{8}" placeholder="Enter Your Phone"></span>
						    	<?php if (isset($contact->phone)) { echo $contact->phone; } ?>
						    </div>
						    <div>
						     	<span><label>SUBJECT</label></span>
						    	<span><input type="text" name="subject" value="<?= isset($subject) ? $subject : ''; ?>" placeholder="Enter Subject"></span>
						    	<?php if (isset($contact->subject)) { echo $contact->subject; } ?>
						    </div>
						    <div>
						    	<span><label>MESSAGE</label></span>
						    	<span><textarea name="message" placeholder="Enter Your Message"><?= isset($message) ? $message : ''; ?></textarea></span>
						    	<?php if (isset($contact->message)) { echo $contact->message; } ?>
						    </div>
						   <div>
						   		<span><input type="submit" name="contact" value="SUBMIT"></span>
						  </div>
					    </form>
					    <?php if (isset($insertMessage)) { echo $insertMessage; } ?>
				  </div>
  				</div>
				<div class="col span_1_of_3">
      			<div class="company_address">
				     	<h2>Company Information :</h2>
						<p>
						<?php 
						$viewAddress = $footerarea->showAddress();
						$view_address = $viewAddress->fetch_assoc();
						echo $view_address['company_address'];
						?>
						</p>
						<?php 
							$viewCopyContact = $footerarea->viewCopyContact();
							$viewCopy_contact = $viewCopyContact->fetch_assoc();
						?>
				   		<p>Phone: +88-<?= $viewCopy_contact['number_one']; ?></p>
				   		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +88-<?= $viewCopy_contact['number_two']; ?></p>

  						<?php 
				   		  	$viewSocial = $footerarea->viewSocial();
							$view_social = $viewSocial->fetch_assoc();
			   		  	?>
				 	 	<p>Email: <a href="mailto:<?= $view_social['mail']; ?>"><?= $view_social['mail']; ?></a></p>
				   		<p>Follow on: <span><a href="<?= $view_social['facebook']; ?>" target="_blank">Facebook</a></span>, <span><a href="<?= $view_social['twitter']; ?>" target="_blank">Twitter</a></span></p>
				   </div>
				 </div>
			  </div>    	
    </div>
 </div><?php include 'inc/footer.php'; ?>