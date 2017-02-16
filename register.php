<?php
$uname=$_POST["uname"];
$pword=$_POST["pword"];
$email=$_POST["email"];
$fname=$_POST["fname"];
$lname=$_POST["lname"];


require_once "autoload.php";
use MicrosoftAzure\Storage\Common\ServicesBuilder;
use MicrosoftAzure\Storage\Common\ServiceException;
use MicrosoftAzure\Storage\Table\Models\BatchOperations;
use MicrosoftAzure\Storage\Table\Models\Entity;
use MicrosoftAzure\Storage\Table\Models\EdmType;
$connectionString = 'DefaultEndpointsProtocol=https;AccountName=hotyoke;AccountKey=nZ+Mwn9i7oDCi2k0f5kCb3l4RPjBp1ujG7l1hUYNJm1mVcITF9ZPE6jS3GW+onQOyIjR/FDdMe5IRX+Q/bAuSA==';
$tableClient = ServicesBuilder::getInstance()->createTableService($connectionString);

batchInsertCredentials($tableClient);

function createTable($tableClient)
{
    try {
        // Create table.
        $tableClient->createTable("Users");
    } catch(ServiceException $e){
        $code = $e->getCode();
        $error_message = $e->getMessage();
        echo $code.": ".$error_message.PHP_EOL;
    }
}



function batchInsertCredentials($tableClient)
{
      $batchOp = new BatchOperations();
      $entity = new Entity();
      $entity->setPartitionKey("Users");
      $entity->setRowKey($_POST["uname"]);
      $entity->addProperty("pword", EdmType::STRING, $_POST["pword"]);
      $entity->addProperty("email", EdmType::STRING, $_POST["email"]);
      $entity->addProperty("fname", EdmType::STRING, $_POST["fname"]);
      $entity->addProperty("lname", EdmType::STRING, $_POST["lname"]);
      $batchOp->addInsertEntity("Users", $entity);
    try {
        $tableClient->batch($batchOp);
        header('Location: success.html');
        
    } catch(ServiceException $e){
        $code = $e->getCode();
        $error_message = $e->getMessage();
        echo $code.": ".$error_message.PHP_EOL;
    }
}



?>