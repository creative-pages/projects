<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 
if (isset($_GET['seenMessage'])) {
	$id = $_GET['seenMessage'];
	$contact->seenMessage($id);
}
if (isset($_GET['deleteMessage'])) {
	$id = $_GET['deleteMessage'];
	$contact->deleteMessage($id);
}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Inbox</h2>
                <div class="block">        
                    <table class="data display datatable" id="example">
					<thead class="table table-bordered table-hover table-striped">
						<tr>
							<th>S. N.</th>
							<th>Name</th>
							<th>Email</th>
							<th>Subject</th>
							<th>Message</th>
							<th>Date</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<?php 
							$viewUnseenMessage = $contact->viewUnseenMessage();
							if ($viewUnseenMessage) {
								$sl = 1;
								while ($row = $viewUnseenMessage->fetch_assoc()) {
						?>
							<tr>
								<td><?= $sl; ?></td>
								<td><?= $row['name']; ?></td>
								<td><?= $row['email']; ?></td>
								<td><?= $row['subject']; ?></td>
								<td style="width: 250px;"><?= $format->textShorten($row['message'], 80); ?></td>
								<td><?= $format->dateFormat($row['date']); ?></td>
								<td>
									<a href="view-message.php?viewMessage=<?= $row['id']; ?>">View</a> ||
									<a href="reply-message.php?replyMessage=<?= $row['id']; ?>">Reply</a> ||
									<a href="?seenMessage=<?= $row['id']; ?>">Seen</a>
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
                <h2>Seen Message</h2>
                <div class="block">        
                    <table class="data display datatable" id="example">
					<thead class="table table-bordered table-hover table-striped">
						<tr>
							<th>S. N.</th>
							<th>Name</th>
							<th>Email</th>
							<th>Subject</th>
							<th>Message</th>
							<th>Date</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<?php 
							$viewSeenMessage = $contact->viewSeenMessage();
							if ($viewSeenMessage) {
								$sl = 1;
								while ($row = $viewSeenMessage->fetch_assoc()) {
						?>
							<tr>
								<td><?= $sl; ?></td>
								<td><?= $row['name']; ?></td>
								<td><?= $row['email']; ?></td>
								<td><?= $row['subject']; ?></td>
								<td style="width: 250px;"><?= $format->textShorten($row['message'], 80); ?></td>
								<td><?= $format->dateFormat($row['date']); ?></td>
								<td>
									<a href="view-message.php?viewMessage=<?= $row['id']; ?>">View</a> ||
									<a href="reply-message.php?replyMessage=<?= $row['id']; ?>">Reply</a> ||
									<a href="?deleteMessage=<?= $row['id']; ?>" onclick="return confirm('Are you sure to delte?');">Delete</a>
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
<script type="text/javascript">
    $(document).ready(function () {
        setupLeftMenu();

        $('.datatable').dataTable();
        setSidebarHeight();
    });
</script>
<?php include 'inc/footer.php';?>
