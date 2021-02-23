<?php include 'inc/header.php'; ?>
<?php include 'inc/sidebar.php'; ?>
<?php 
if (isset($_GET['msgdeleteId'])) {
    $id = $_GET['msgdeleteId'];
    $forcontact->deleteMessage($id);
}
if (isset($_GET['msgsennId'])) {
    $id = $_GET['msgsennId'];
    $forcontact->seenMessage($id);
}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Inbox</h2>
                <div class="block">        
                    <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>Serial No.</th>
							<th>Name</th>
							<th>Email</th>
							<th>Message</th>
							<th>Date</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						$sl = 1;
						$viewUnseenMessage = $forcontact->viewUnseenMessage();
						if ($viewUnseenMessage) {
							while ($message = $viewUnseenMessage->fetch_assoc()) {
						?>
						<tr>
							<td><?= $sl; ?></td>
							<td><?= $message['fname'] . ' ' . $message['lname']; ?></td>
							<td><?= $message['email']; ?></td>
							<td style="width: 350px;"><?= $format->textShorten($message['message'], 100); ?></td>
							<td><?= $format->formatDate($message['date']); ?></td>
							<td>
								<a href="viewmsg.php?msgId=<?= $message['id']; ?>">View</a> || <a href="replymsg.php?msgId=<?= $message['id']; ?>">Reply</a> || <a href="?msgsennId=<?= $message['id']; ?>">Seen</a>
							</td>
						</tr>
						<?php
						$sl++;
							}
						}
						?>
					</tbody>
				</table>
               </div>
            </div>
            <div class="box round first grid">
                <h2>Seenbox</h2>
                <div class="block">        
                    <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>Serial No.</th>
							<th>Name</th>
							<th>Email</th>
							<th>Message</th>
							<th>Date</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						$sl = 1;
						$viewSeenMessage = $forcontact->viewSeenMessage();
						if ($viewSeenMessage) {
							while ($message = $viewSeenMessage->fetch_assoc()) {
						?>
						<tr>
							<td><?= $sl; ?></td>
							<td><?= $message['fname'] . ' ' . $message['lname']; ?></td>
							<td><?= $message['email']; ?></td>
							<td style="width: 350px;"><?= $format->textShorten($message['message'], 100); ?></td>
							<td><?= $format->formatDate($message['date']); ?></td>
							<td>
								<a href="viewmsg.php?msgId=<?= $message['id']; ?>">View</a> || <a href="replymsg.php?msgId=<?= $message['id']; ?>">Reply</a> || <a href="?msgdeleteId=<?= $message['id']; ?>" onclick="return confirm('Are you sure to delete?');">Delete</a>
							</td>
						</tr>
						<?php
						$sl++;
							}
						}
						?>
					</tbody>
				</table>
               </div>
            </div>
        </div>
<?php include 'inc/footer.php'; ?>
