<?php

require_once "../vendor/autoload.php";
use MicrosoftAzure\Storage\Common\ServicesBuilder;
use MicrosoftAzure\Storage\Common\ServiceException;
use MicrosoftAzure\Storage\Table\Models\BatchOperations;
use MicrosoftAzure\Storage\Table\Models\Entity;
use MicrosoftAzure\Storage\Table\Models\EdmType;
$connectionString = 'DefaultEndpointsProtocol=https;AccountName=yoke-db;AccountKey=<yourKey>';
$tableClient = ServicesBuilder::getInstance()->createTableService($connectionString);









$host='tcp:yoke-db.database.windows.net,1433';
$username='yokeAdmin';
$password='p@55w0rd';
$database_name="yokeData";
$table_name="Users";

//$connection = mysqli_connect($host, $username, $password, $database_name) or die("connection failed");

$uname=$_POST['uname'];
$pword=$_POST['pword'];
$email=$_POST['email'];
$fname=$_POST['fname'];
$lname=$_POST['lname'];

// $connectionInfo = array("UID" => "yokeAdmin@yoke-db", "pwd" => "p@55w0rd", "Database" => "yokeData", "LoginTimeout" => 30, "Encrypt" => 1, "TrustServerCertificate" => 0);
// $serverName = "yoke-db.database.windows.net";
// $conn = sqlsrv_connect($serverName, $connectionInfo);

try {
    $connection = new PDO("sqlsrv:server = tcp:yoke-db.database.windows.net,1433; Database = yokeData", "yokeAdmin", "p@55w0rd");
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch (PDOException $e) {
    print("Error connecting to SQL Server.");
    die(print_r($e));
}



$sql="INSERT INTO $table_name(uname,pword,email,fname,lname)
      VALUES($uname,$pword,$email,$fname,$lname)";

$result=mysqli_query($sql);


#mysqli_close();
sqlsrv_close();
?>