<?php include 'inc/header.php'; ?>
<?php include 'inc/sidebar.php'; ?>
<?php 
if (!isset($_GET['userId']) || $_GET['userId'] == NULL) {
    header("Location: user-list.php");
} else {
    $id = $_GET['userId'];
    $viewSingleUser = $user->viewSingleUser($id);
    $view_single_user = $viewSingleUser->fetch_assoc();
}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>View Message</h2>
                <div class="block">
                    <table class="table table-hover">
                        <tr>
                            <td>
                                <label>Name</label>
                            </td>
                            <td>
                                <?= $view_single_user['name']; ?>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Username</label>
                            </td>
                            <td>
                                <?= $view_single_user['username']; ?>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Email</label>
                            </td>
                            <td>
                                <?= $view_single_user['email']; ?>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Details</label>
                            </td>
                            <td>
                                <?= $view_single_user['details']; ?>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Role</label>
                            </td>
                            <td>
                                <?php 
                                if ($view_single_user['role'] == '1') {
                                    echo "Admin";
                                } elseif ($view_single_user['role'] == '2') {
                                    echo "Author";
                                } else {
                                    echo "Editor";
                                }
                            ?>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <a href="user-list.php">Back</a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
<?php include 'inc/footer.php'; ?>
