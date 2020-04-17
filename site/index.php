<?php
  require "header.php";
?>

<body class="LoginSignupPage">
    <div class="login-box">
    <section>

      <h1 class = "loginTitle">Log in to PSAS</h1>

        <!-- edit this to forward the user to the second page if already logged in -->
     <?php
      if (isset($_SESSION['userID'])) {
        echo '<a href="settings.php"><button class="header-button">Settings</button></a>';

        echo '<form action="includes/logout.inc.php" method="post">
            <button class="header-button" type="submit" name="logout-submit">Log out</button>
          </form>';
        
      } else {
        echo '<a href="signup.php"><button class="header-button">Sign Up</button></a>';
        echo '<a href="login.php"><button class="header-button">Log In</button></a>';
      }

     ?>
        
        
      <?php
        if (isset($_GET['error'])) {
          if ($_GET['error'] == "emptyfields") {
            echo '<p class="signup-error">Not all fields were completed.</p>';

          } else if ($_GET['error'] == "sqlerror") {
            echo '<p class="signup-error">SQL ERROR.</p>';

          } else if ($_GET['error'] == "invalidpassword") {
            echo '<p class="signup-error">Password is incorrect.</p>';

          } else if ($_GET['error'] == "nouser") {
            echo '<p class="signup-error">User not found.</p>';

          }
        } else if ($_GET['signup'] == "success") {
          echo '<p class="signup-success">Login successful!</p>';
        }
       ?>

      <form class = "loginForm" action="includes/login.inc.php" method="post">

        <input class = "loginInputBox" type="text" name="username" value="Username" onfocus="if(this.value==this.defaultValue)this.value='';" onblur="if(this.value=='')this.value=this.defaultValue;">
		<br>
        <input class = "loginInputBox" type="text" name="pwd" value="Password" onfocus="if(this.value==this.defaultValue){this.value=''; this.type='password'}" onblur="if(this.value==''){this.value=this.defaultValue; this.type = 'text'}">
		<br>
        <button class = "loginButton" type="submit" name="login-submit">Log in</button>
      </form>

    </section>
  </div>

<?php
  require "footer.php";
?>
