<?php
session_start();
include('includes/config.php');
include('includes/checklogin.php');
check_login();
//code for add courses
if ($_POST['submit']) {
	$fpm = $_POST['leaveapplicationstatus'];
	$id = $_GET['id'];
	$query = "update registration set leaveapplicationstatus=? where id=?";
	$stmt = $mysqli->prepare($query);
	$rc = $stmt->bind_param('si', $fpm, $id);
	$stmt->execute();
	echo "<script>alert('Student leave application has been approved successfully');</script>";
	// echo $stmt;/


}

?>
<!doctype html>
<html lang="en" class="no-js">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="theme-color" content="#357be">
	<title>Edit Student</title>
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/dataTables.bootstrap.min.css">>
	<link rel="stylesheet" href="css/bootstrap-social.css">
	<link rel="stylesheet" href="css/bootstrap-select.css">
	<link rel="stylesheet" href="css/fileinput.min.css">
	<link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
	<link rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery-1.11.3-jquery.min.js"></script>
	<script type="text/javascript" src="js/validation.min.js"></script>
</head>

<body>
	<?php include('includes/header.php'); ?>
	<div class="ts-main-content">
		<?php include('includes/sidebar.php'); ?>
		<div class="content-wrapper">
			<div class="container-fluid">

				<div class="row">
					<div class="col-md-12">

						<h2 class="page-title">Edit Student </h2>

						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-default">
									<div class="panel-heading">Edit Student</div>
									<div class="panel-body">
										<form method="post" class="form-horizontal">
											<?php
											$id = $_GET['id'];
											$ret = "select * from registration where id=?";
											$stmt = $mysqli->prepare($ret);
											$stmt->bind_param('i', $id);
											$stmt->execute(); //ok
											$res = $stmt->get_result();
											//$cnt=1;
											while ($row = $res->fetch_object()) {
											?>
												<div class="hr-dashed"></div>

												<div class="form-group">
													<label class="col-sm-2 control-label">Stduent Name</label>
													<div class="col-sm-8">
														<input type="text" class="form-control" name="fpm" id="fpm" value="<?php echo $row->firstName; ?> <?php echo $row->middleName; ?> <?php echo $row->lastName; ?>" required="required" readonly>
													</div>
												</div>


												<div class="form-group">
													<label class="col-sm-2 control-label">leave application</label>
													<div class="col-sm-8">
														<textarea rows="5" name="address" id="address" class="form-control" required="required" readonly><?php echo $row->leaveapplication; ?></textarea>

													</div>
												</div>

												<div class="form-group">
													<label class="col-sm-2 control-label">leave applications status</label>
													<div class="col-sm-8">
														<select name="leaveapplicationstatus" class="form-control" required="required">
															<option value="<?php echo $row->gender; ?>"><?php echo $row->leaveapplicationstatus; ?></option>
															<option value="pending">pending</option>
															<option value="approved">approved</option>
														</select>

													</div>
												</div>


											<?php } ?>
											<div class="col-sm-8 col-sm-offset-2">

												<input class="btn btn-primary" type="submit" name="submit" value="Update Student">
											</div>

									</div>

									</form>

								</div>
							</div>


						</div>




					</div>
				</div>

			</div>
		</div>


	</div>
	</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap-select.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>
	<script src="js/Chart.min.js"></script>
	<script src="js/fileinput.js"></script>
	<script src="js/chartData.js"></script>
	<script src="js/main.js"></script>

	</script>
</body>

</html>