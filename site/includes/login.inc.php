<?php

if (isset($_POST['login-submit'])) {

  require "dbh.inc.php";

  $username = $_POST['username'];
  $password = $_POST['pwd'];

  if (empty($username) || empty($password)) {
    header("Location: ../login.php?error=empty");
    exit();

  } else {
    $sql = "SELECT * FROM users WHERE userName=?";
    $stmt = mysqli_stmt_init($conn);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
      header("Location: ../login.php?error=sqlerror");
      exit();

    } else {
      mysqli_stmt_bind_param($stmt, s, $username);
      mysqli_stmt_execute($stmt);
      $result = mysqli_stmt_get_result($stmt);
      if ($row = mysqli_fetch_assoc($result)) {
        $checkPwd = password_verify($password, $row['userPassword']);
        if ($checkPwd == false) {
          header("Location: ../login.php?error=invalidpassword");
          exit();

        } else if ($checkPwd == true) {
          session_start();
          $_SESSION['userID'] = $row['userID'];
          $_SESSION['userName'] = $row['userName'];

          mysqli_stmt_close($stmt);
          mysqli_close($conn);

          header("Location: ../index.php?login=success");

        } else {
          mysqli_stmt_close($stmt);
          mysqli_close($conn);

          header("Location: ../login.php?error=invalidpassword");
          exit();
        }

      } else {
        mysqli_stmt_close($stmt);
        mysqli_close($conn);
        
        header("Location: ../login.php?error=nouser");
        exit();
      }
    }
  }


} else {
  header("Location: ../login.php");
  exit();
}
