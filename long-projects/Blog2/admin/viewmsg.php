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
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>View Message</h2>
                <div class="block">
                    <table class="table table-hover">
                        <tr>
                            <td>
                                <label>Date</label>
                            </td>
                            <td>
                                <?= $format->formatDate($message['date']); ?>
                            </td>
                        </tr>
                        <tr>
                        <tr>
                            <td>
                                <label>Name</label>
                            </td>
                            <td>
                                <?= $message['fname'] . ' ' . $message['lname']; ?>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Email</label>
                            </td>
                            <td>
                                <?= $message['email']; ?>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Message</label>
                            </td>
                            <td>
                                <?= $message['message']; ?>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label><a href="replymsg.php?msgId=<?= $message['id']; ?>">Reply</a></label>
                            </td>
                            <td>
                                <a href="inbox.php">Back</a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <!-- Load TinyMCE -->
        <script src="js/tiny-mce/jquery.tinymce.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                setupTinyMCE();
                setDatePicker('date-picker');
                $('input[type="checkbox"]').fancybutton();
                $('input[type="radio"]').fancybutton();
            });
        </script>
<?php include 'inc/footer.php'; ?>
