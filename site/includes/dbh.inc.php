<?php

$servername = "db5000376748.hosting-data.io";
$dbUsername = "dbu150217";
$dbPassword = "P^x4%AhzJv6*MA@#^*q!#S4CJVibOY!Z";
$dbName = "dbs364085";

$conn = mysqli_connect($servername, $dbUsername, $dbPassword, $dbName);

if (!$conn) {
  die("Connection to DB has failed: ".mysqli_connect_error());
}
