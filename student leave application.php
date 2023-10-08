<?php
session_start();
include('includes/config.php');
include('includes/checklogin.php');
check_login();
//code for registration
if (isset($_POST['submit'])) {
	$leaveapplicationtype = $_POST['leaveapplicationtype'];

	$leaveapplication = $_POST['leaveapplication'];
	$leaveapplicationstatus = 'pending';
	$aid = $_SESSION['id'];
	$ret = "select * from registration where id=?";
	$stmt = $mysqli->prepare($ret);
	$stmt->bind_param('i', $aid);
	$stmt->execute(); //ok
	$res = $stmt->get_result();
	$row = $res->fetch_object();
	$FULLNAME = $row->firstName . " " . $row->middleName . " " . $row->lastName;
	$BUILDING =  $row->Building;
	$REGNO = $row->regno;
	$YEAR = $row->branch;
	$SEMESTER = $row->semester;
	$CONTACTNO = $row->contactno;
	$ROOMNO = $row->roomno;
	if ($leaveapplicationtype == "temporary") {
		$leaveapplicationstatus = 'pending';
		$query = "INSERT INTO `shortleaveapplication`(`name`, `building`, `regno`, `year`, `semester`, `contactno`, `roomno`, `shortleave`, `shortleavestatus`) VALUES (?,?,?,?,?,?,?,?,?)";
		$stmt = $mysqli->prepare($query);
		$rc = $stmt->bind_param('sssssiiss', $FULLNAME, $BUILDING, $REGNO, $YEAR, $SEMESTER, $CONTACTNO, $ROOMNO, $leaveapplication, $leaveapplicationstatus);
		$stmt->execute();


		echo "<script>alert('leave application Succssfully sent');</script>";
	} else if ($dropdown_value == "permanent") {
		$query = "update registration set leaveapplication=?,leaveapplicationstatus=? where id=?";
		$stmt = $mysqli->prepare($query);
		$rc = $stmt->bind_param('ssi', $leaveapplication, $leaveapplicationstatus, $aid);
		$stmt->execute();
		echo "<script>alert('leave application Succssfully sent');</script>";
		// echo $stmt;
	}
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
	<title>Student Hostel Registration</title>
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
	<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
	<script>
		function getSeater(val) {
			$.ajax({
				type: "POST",
				url: "get_seater.php",
				data: 'roomid=' + val,
				success: function(data) {
					//alert(data);
					$('#seater').val(data);
				}
			});

			$.ajax({
				type: "POST",
				url: "get_seater.php",
				data: 'rid=' + val,
				success: function(data) {
					//alert(data);
					$('#fpm').val(data);
				}
			});
			$.ajax({
				type: "POST",
				url: "get_seater.php",
				data: 'bldname=' + val,
				success: function(data) {
					//alert(data);
					$('#bldname').val(data);
				}
			});
		}
	</script>

</head>

<body>
	<?php include('includes/header.php'); ?>
	<div class="ts-main-content">
		<?php include('includes/sidebar.php'); ?>
		<div class="content-wrapper">
			<div class="container-fluid">

				<div class="row">
					<div class="col-md-12">

						<h2 class="page-title">Leave Application </h2>

						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-primary">
									<div class="panel-heading">Fill all Info</div>
									<div class="panel-body">
										<form method="post" action="" class="form-horizontal">
											<?php
											$uid = $_SESSION['login'];
											$stmt = $mysqli->prepare("SELECT emailid FROM registration WHERE id=? ");
											$stmt->bind_param('s', $uid);
											$stmt->execute();
											$stmt->bind_result($email);
											$rs = $stmt->fetch();
											$stmt->close();
											if ($rs) { ?>
												<!-- <h3 style="color: red" align="left">Hostel already booked by you</h3> -->
											<?php } else {
												echo "";
											}
											?>
											<div class="form-group">
												<label class="col-sm-4 control-label">
													<h4 style="color: green" align="left">Room Related info </h4>
												</label>
											</div>


											<?php

											$aid = $_SESSION['login'];
											$ret = "select * from registration where id=?";
											$stmt = $mysqli->prepare($ret);
											$stmt->bind_param('s', $aid);
											$stmt->execute(); //ok
											$res = $stmt->get_result();
											//$cnt=1;
											while ($row = $res->fetch_object()) {
											?>
												<div class="form-group">
													<label class="col-sm-2 control-label">Room No</label>
													<div class="col-sm-8">
														<input type="text" name="bldnno" id="bldname" value="<?php echo $row->roomno; ?>" class="form-control" readonly>
													</div>
												</div>

												<div class="form-group">
													<label class="col-sm-2 control-label">Building</label>
													<div class="col-sm-8">
														<input type="text" name="bldname" id="bldname" value="<?php echo $row->Building; ?>" class="form-control" readonly>
													</div>
												</div>

												<div class="form-group">
													<label class="col-sm-2 control-label">leave application</label>
													<div class="col-sm-8">
														<textarea rows="5" name="leaveapplication" id="leaveapplication" class="form-control" required="required"><?php echo $row->leaveapplication; ?></textarea>

													</div>
												</div>



												<div class="form-group">
													<label class="col-sm-2 control-label">leave application type</label>
													<div class="col-sm-8">
														<select name="leaveapplicationtype" id="leaveapplicationtype" class="form-control" required="required">
															<option value="">Enter the type</option>
															<option value="temporary">Temporary</option>
															<option value="permanent">Permanent</option>
														</select>
													</div>
												</div>



												<div class="form-group">
													<label class="col-sm-2 control-label">leave application status</label>
													<div class="col-sm-8">
														<input type="text" name="leave application status" id="leave application status" value="<?php echo $row->leaveapplicationstatus; ?>" class="form-control" readonly>

													</div>
												</div>



											<?php } ?>
											<div class="col-sm-6 col-sm-offset-4">
												<button class="btn btn-default" type="submit">Cancel</button>
												<input type="submit" name="submit" Value="Update" class="btn btn-primary">
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
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('input[type="checkbox"]').click(function() {
			if ($(this).prop("checked") == true) {
				$('#paddress').val($('#address').val());
				$('#pcity').val($('#city').val());
				$('#pstate').val($('#state').val());
				$('#ppincode').val($('#pincode').val());
			}

		});
	});
</script>
<script>
	function checkAvailability() {
		$("#loaderIcon").show();
		jQuery.ajax({
			url: "check_availability.php",
			data: 'roomno=' + $("#room").val(),
			type: "POST",
			success: function(data) {
				$("#room-availability-status").html(data);
				$("#loaderIcon").hide();
			},
			error: function() {}
		});
	}
</script>


<script type="text/javascript">
	$(document).ready(function() {
		$('#duration').keyup(function() {
			var fetch_dbid = $(this).val();
			$.ajax({
				type: 'POST',
				url: "ins-amt.php?action=userid",
				data: {
					userinfo: fetch_dbid
				},
				success: function(data) {
					$('.result').val(data);
				}
			});


		})
	});
</script>

</html>