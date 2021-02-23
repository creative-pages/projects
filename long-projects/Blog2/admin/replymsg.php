<?php include 'inc/header.php'; ?>
<?php include 'inc/sidebar.php'; ?>
<?php 
if (!isset($_GET['msgId']) || $_GET['msgId'] == NULL) {
    header("Location: inbox.php");
} else {
    $id = $_GET['msgId'];
    $viewSingleMessage = $forcontact->viewSingleMessage($id);
    $message = $viewSingleMessage->fetch_assoc();
}
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['send_message'])) {
    $sendMsg = $forcontact->sendMsg($_POST);
}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Reply</h2>
                <div class="block">               
                 <form action="" method="POST">
                    <?php  if (isset($sendMsg)) { echo $sendMsg; } ?>
                    <table class="form">
                        <tr>
                            <td>
                                <label>From</label>
                            </td>
                            <td>
                                <?= $message['email']; ?>
                                <input type="hidden" name="mail_from" value="<?= $message['email']; ?>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>To</label>
                            </td>
                            <td>
                                <input type="email" name="mail_to" placeholder="Enter your email..." class="form-control w-50" />
                                <?php if (isset($post->title)) { echo $post->title; } ?>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Subject</label>
                            </td>
                            <td>
                                <input type="text" name="subject" placeholder="Enter the subject..." class="form-control w-50" />
                                <?php if (isset($post->title)) { echo $post->title; } ?>
                            </td>
                        </tr>
                     
                        <tr>
                            <td style="vertical-align: top; padding-top: 9px;">
                                <label>Message</label>
                            </td>
                            <td>
                                <textarea style="padding: 6px 4px; height: 200px;" class="form-control w-50" name="rep_message" placeholder="Write your message.."></textarea>
                                <?php if (isset($post->content)) { echo $post->content; } ?>
                            </td>
                        </tr>
						<tr>
                            <td></td>
                            <td>
                                <input type="submit" name="send_message" Value="Reply" />
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
        </div>
<?php include 'inc/footer.php'; ?>
