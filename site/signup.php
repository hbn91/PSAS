<?php
  require "header.php";
?>
     
     
     
<body class="LoginSignupPage">
<div class="login-box">
  <section>

    <h1 class = "loginTitle">Create a GrubShare account</h1>
    
    <?php
      if (isset($_GET['error'])) {
        if ($_GET['error'] == "emptyfields") {
          echo '<p class="signup-error">Not all fields were completed.</p>';

        } else if ($_GET['error'] == "invalidemail") {
          echo '<p class="signup-error">Email is invalid.</p>';

        } else if ($_GET['error'] == "invalidusername") {
          echo '<p class="signup-error">Username is invalid.</p>';

        } else if ($_GET['error'] == "passwordmatch") {
          echo '<p class="signup-error">Passwords do not match.</p>';

        } else if ($_GET['error'] == "sqlerror") {
          echo '<p class="signup-error">SQL ERROR.</p>';

        } else if ($_GET['error'] == "duplicateusername") {
          echo '<p class="signup-error">Username has already been taken.</p>';

        } else if ($_GET['error'] == "duplicateemail") {
          echo '<p class="signup-error">Email already in use.</p>';

        }
      } else if ($_GET['signup'] == "success") {
        echo '<p class="signup-success">Sign up successful!</p>';
      }
    ?>
    
    <form class="loginForm" action="includes/signup.inc.php" method="post">
        <br>
      <input class="loginInputBox" type="text" name="username" value = "Username" onfocus="if(this.value==this.defaultValue)this.value='';" onblur="if(this.value=='')this.value=this.defaultValue;">
        <br>
      <input class="loginInputBox" type="text" name="email" value = "Email" onfocus="if(this.value==this.defaultValue)this.value='';" onblur="if(this.value=='')this.value=this.defaultValue;">
        <br>
      <input class="loginInputBox" type="text" name="pwd" value="Password" onfocus="if(this.value==this.defaultValue){this.value=''; this.type='password'}" onblur="if(this.value==''){this.value=this.defaultValue; this.type = 'text'}">
        <br>
      <input class="loginInputBox" type="text" name="pwd-repeat" value="Repeat Password" onfocus="if(this.value==this.defaultValue){this.value=''; this.type='password'}" onblur="if(this.value==''){this.value=this.defaultValue; this.type = 'text'}">
        <br>
      <button class="loginButton" type="submit" name="signup-submit">Sign up</button>
    </form>

  </section>
</div>

<div class="container">
  <div class="flexcontainer col">
      <!--<div class="flexbox getstart">
          <p>GrubShare connects you to a whole new world of recipes, people and tastes.</p>
          <p><a class="button" href="#">Get Started</a></p>
      </div>
      <div class="flexcontainer borderbottom bulletin">
          <div class="flexbox item item1">
              <img alt="" src="https://ukcdn.ar-cdn.com/recipes/port500/2a8b063e-be0c-45f2-b98f-985e0acbea91.jpg" />
              <a href="#"></a>
              <h3>Simple Soups</h3>
          </div>
          <div class="flexbox item item2">
              <img alt="" src="https://www.fromvalerieskitchen.com/wordpress/wp-content/uploads/2016/03/Easy-Blueberry-Cheesecake-Dessert-219-e1458357681643-1-500x500.jpg" />
              <a href="#"></a>
              <h3>Delicious Desserts</h3>
          </div>
      </div>-->
  </div>
  <!--<div class="flexcontainer startsect">-->
  <!--    <div class="flexbox bt browse">-->
  <!--        <h3>Browse</h3>-->
  <!--        <p>Browse thousands of our user shared recipes. View recipe lists from your friends, or tell us what you fancy and we&#39;ll give you suggestions.</p>-->
  <!--    </div>-->
  <!--    <div class="flexbox tp discover">-->
  <!--        <h3>Discover</h3>-->
  <!--        <p>Discover options for dietary requirements, what you&#39;ve got in the cupboard, category or even price per serving.</p>-->
  <!--    </div>-->
  <!--    <div class="flexbox bt shop">-->
  <!--        <h3>Shop</h3>-->
  <!--        <p>Once you&#39;ve found a recipe you love, quickly add all of the required ingredients to your shopping basket and arrange a convenient delivery.</p>-->
  <!--    </div>-->
  <!--    <div class="flexbox tp share">-->
  <!--        <h3>Share</h3>-->
  <!--        <p>After enjoying your delicious meal, share photos, reviews thoughts and maybe even a few recommendations to other users.</p>-->
  <!--    </div>-->
  </div>


<?php
  require "footer.php";
?>

