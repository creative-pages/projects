<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 

if (!isset($_GET['customerId']) || $_GET['customerId'] == NULL) {
    echo "<script>window.location = 'inbox.php';</script>";
} else {
    $id = $_GET['customerId'];
    $customerDetails = $customer->customerDetails($id);
    $row = $customerDetails->fetch_assoc();
}
    
?>
        <div class="container">
                <div class="row">
                    <div class="col-sm-6 offset-sm-3 mt-5">
                        <table class="table table-primary table-bordered table-hover table-striped">
                            <tr>
                                <td>Name</td>
                                <td><?= $row['name']; ?></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td><?= $row['email']; ?></td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td><?= $row['address']; ?></td>
                            </tr>
                            <tr>
                                <td>City</td>
                                <td><?= $row['city']; ?></td>
                            </tr>
                            <tr>
                                <td>Zip Code</td>
                                <td><?= $row['zip_code']; ?></td>
                            </tr>
                            <tr>
                                <td>Country</td>
                                <td><?= $row['country']; ?></td>
                            </tr>
                            <tr>
                                <td>Phone</td>
                                <td><?= $row['phone']; ?></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <a class="btn btn-primary" href="inbox.php">Back To Inbox</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
<?php include 'inc/footer.php';?>