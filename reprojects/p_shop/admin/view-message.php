<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php
if (!isset($_GET['viewMessage']) || $_GET['viewMessage'] == NULL) {
	header("Location: inbox.php");
} else {
	$id = $_GET['viewMessage'];
	$viewMessage = $contact->viewMessage($id);
	$view_message = $viewMessage->fetch_assoc();
}
?>
<div class="grid_10">
	<div class="box round first grid">
		<h2>Customer Message</h2>
		<div class="block">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 offset-sm-3">
						<table class="table table-striped table-hover">
							<tr>
								<td>Date</td>
								<td><?= $format->dateFormat($view_message['date']); ?></td>
							</tr>
							<tr>
								<td>From</td>
								<td><?= $view_message['email']; ?></td>
							</tr>
							<tr>
								<td>Name</td>
								<td><?= $view_message['name']; ?></td>
							</tr>
							<tr>
								<td>Subject</td>
								<td><?= $view_message['subject']; ?></td>
							</tr>
							<tr>
								<td>Message</td>
								<td><?= $view_message['message']; ?></td>
							</tr>
							<tr>
								<td></td>
								<td>
									<a class="btn btn-success" href="inbox.php">Back To Inbox</a>
									<a class="btn btn-primary" href="reply-message.php?replyMessage=<?= $view_message['id']; ?>">Reply</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php include 'inc/footer.php';?>