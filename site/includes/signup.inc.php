<?php
  if (isset($_POST['signup-submit'])) {

    require 'dbh.inc.php';

    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['pwd'];
    $passwordRepeat = $_POST['pwd-repeat'];

    //echo "$username, $email, $password, $passwordRepeat";

    //Error checking, if one passes then it will redirect to the sign up page with an error

    //Checks for an empty field
    if(empty($username) || empty($email) || empty($password) || empty($passwordRepeat)) {
      header("Location: ../signup.php?error=emptyfields");
      exit();

    //Checks email is valid
    } else if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
      header("Location: ../signup.php?error=invalidemail");
      exit();

    //Checks username is valid with valid characters using regular expressions
    } else if (!preg_match("/^[a-zA-Z0-9]*$/", $username)) {
      header("Location: ../signup.php?error=invalidusername");
      exit();

    //Checks passwords are the same
    } else if ($password !== $passwordRepeat) {
      header("Location: ../signup.php?error=passwordmatch");
      exit();

    //Else check username and email hasn't already been taken
    } else {
      $sql = "SELECT userName FROM users WHERE userName=?";
      $stmt = mysqli_stmt_init($conn);
      $sql1 = "SELECT userEmail FROM users WHERE userEmail=?";
      $stmt1 = mysqli_stmt_init($conn);

      //The following prepares an SQL statement so SQL injection isn't a problem
      if (!mysqli_stmt_prepare($stmt, $sql) || !mysqli_stmt_prepare($stmt1, $sql1)) {
        header("Location: ../signup.php?error=sqlerror");
        exit();

      } else {

        //Gets the amount of rows for the given username
        mysqli_stmt_bind_param($stmt, "s", $username);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_store_result($stmt);
        $resultUsername = mysqli_stmt_num_rows($stmt);

        //Gets the amount of rows for the given email
        mysqli_stmt_bind_param($stmt1, "s", $email);
        mysqli_stmt_execute($stmt1);
        mysqli_stmt_store_result($stmt1);
        $resultEmail = mysqli_stmt_num_rows($stmt1);

        //Give error if rows are greater than 0 (AKA username been taken)
        if($resultUsername > 0) {
          header("Location: ../signup.php?error=duplicateusername");
          exit();

        //Give error if rows are greater than 0 (AKA email been taken)
        } else if ($resultEmail > 0) {
          header("Location: ../signup.php?error=duplicateemail");
          exit();

        } else {

          //If all error checking passes, prepare statement to upload user to database
          $sql = "INSERT INTO users (userName, userEmail, userPassword) VALUES (?, ?, ?)";
          $stmt = mysqli_stmt_init($conn);
          if (!mysqli_stmt_prepare($stmt, $sql)) {
            header("Location: ../signup.php?error=sqlerror");
            exit();

          } else {
            $pwdHash = password_hash($password, PASSWORD_DEFAULT);

            mysqli_stmt_bind_param($stmt, "sss", $username, $email, $pwdHash);
            mysqli_stmt_execute($stmt);
            header("Location: ../signup.php?signup=success");
            exit();
          }
        }
      }
    }

    //Close database
    mysqli_stmt_close($stmt);
    mysqli_close($conn);

  } else {

    //If the user comes here via a link and not a PHP POST then redirect to signup
    header("Location: ../signup.php");
    exit();
}
