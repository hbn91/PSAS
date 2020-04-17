<?php
  session_start();
 ?>

<!DOCTYPE html>

<html>
    <html prefix="og: https://ogp.me/ns#">
        
        
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta property="og:site_name" content="PSAS | ashharbin.co.uk"/>
    <meta property="og:type" content="website"/>
    <meta property="og:title" content="Project Supervisor Allocation System | ashharbin.co.uk"/>
    <meta property="og:description" content="GrubShare connects you to a whole new world of recipes, people and tastes."/>
    <meta property="og:image" content="https://grubshare.net/favicon.png"/>
    <meta property="og:url" content="https://psas.ashharbin.co.uk/"/>
    <meta property="og:locale" content="en_GB" />
    
    <title>Project Supervisor Allocation System</title>
    <link href="https://grubshare.net/favicon.png" rel="icon" type="image/png" />
    <link rel="stylesheet"  type="text/css" href="assets/css/main.css">
</head>

<body>
<header class="header-container">
    <div>
        <img id="header-logo" src="assets/img/logo.png" alt="University of Lincoln">
    </div>
    <h1><span>Welcome to the</span> University of Lincoln Project Supervisor Allocation System  </h1>
    <h2>Designed by Ash Harbin (HAR 17652530)</h2>

    <!-- Edit this to forward user to index.php if not logged in and not already on index, if logged in, forward to results if already done, or forward to testing if not done. Provide links if redirect not function, may need JavaScript for that? Not sure -->
    <?php
      if (isset($_SESSION['userID'])) {
          echo '<p>You are currently logged in as</p>';
        
      } else {
          echo '<p>You are currently not logged in. You should be redirected, if not please click this link.</p>';
      }

     ?>

</header>
