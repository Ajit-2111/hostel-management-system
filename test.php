<?php
include('includes/config.php');

$Registration_No = 'TD-20-0212';
	$password='9689433147';

	//$leaveapplicationstatus="approved";
	$stmt = $mysqli->prepare("SELECT regno,emailid,password,id,leaveapplicationstatus FROM registration WHERE regno=? and password=?  and leaveapplicationstatus!='approved'");

	$stmt->bind_param('ss', $Registration_No, $password);
	$stmt->execute();
	$stmt->bind_result($Registration_No,$uremail,$password, $id, $leaveapplicationstatus);
	$rs = $stmt->fetch();
	if($stmt->errno){
    die('Error: ' . $stmt->error);
}
	$stmt->close();
	
	echo $id;
?>