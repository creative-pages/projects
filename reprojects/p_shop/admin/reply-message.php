<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php
if (!isset($_GET['replyMessage']) || $_GET['replyMessage'] == NULL) {
	header("Location: inbox.php");
} else {
	$id = $_GET['replyMessage'];
	$viewMessage = $contact->viewMessage($id);
	$view_message = $viewMessage->fetch_assoc();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['reply'])) {
	$mail_to = $_POST['mail_to'];
	$name = $_POST['name'];
	$subject = $_POST['subject'];
	$message = $_POST['message'];
	$replyMessage = $contact->replyMessage($_POST);
}
?>
<div class="grid_10">
	<div class="box round first grid">
		<h2>Reply Message</h2>
		<div class="block">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 offset-sm-3">
						<form action="" method="POST">
							<?php if (isset($replyMessage)) { echo $replyMessage; } ?>
							<table class="table table-borderless">
								<tr>
									<td class="pt-3">From</td>
									<td>
										<?= $view_message['email']; ?>
										<input type="hidden" name="mail_from" value="<?= $view_message['email']; ?>">
									</td>
								</tr>
								<tr>
									<td class="pt-3">To</td>
									<td>
										<input class="form-control" type="email" name="mail_to" value="<?= isset($mail_to) ? $mail_to : ''; ?>" placeholder="Enter Your Email">
										<?php if (isset($contact->mail_to)) { echo $contact->mail_to; } ?>
									</td>
								</tr>
								<tr>
									<td class="pt-3">Name</td>
									<td>
										<?= $view_message['name']; ?>
										<input type="hidden" name="name" value="<?= $view_message['name']; ?>">
									</td>
								</tr>
								<tr>
									<td class="pt-3">Subject</td>
									<td>
										<input class="form-control" type="text" name="subject" value="<?= isset($subject) ? $subject : ''; ?>" placeholder="Enter Your Subject">
										<?php if (isset($contact->subject)) { echo $contact->subject; } ?>
									</td>
								</tr>
								<tr>
									<td>Message</td>
									<td>
										<textarea name="message" class="form-control" rows="10" placeholder="Write Your message"><?= isset($message) ? $message : ''; ?></textarea>
										<?php if (isset($contact->message)) { echo $contact->message; } ?>
									</td>
								</tr>
								<tr>
									<td></td>
									<td>
										<input class="btn btn-primary" type="submit" name="reply" value="Reply">
										<a class="btn btn-success float-right" href="inbox.php">Back To Inbox</a>
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