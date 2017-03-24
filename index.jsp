<html>
<head>
	<style type="text/css">
    	<%@include file="assets/bootstrap/css/bootstrap.min.css" %>
    	<%@include file="assets/css/form-elements.css" %>
    	<%@include file="my.css" %>
    	<%@include file="style.css" %>
    	<%@include file="css/style.css" %>
    	<%@include file="css/reset.css" %>
    	<%@include file="font-awesome.min.css" %>
	</style>
	<script src="assets/js/jquery-1.11.1.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"></script>
	<script src="assets/js/scripts.js"></script>
	<script src="js/modernizr.js"></script>
	<title>
		Discussion Forum
	</title>
</head>

<body>

	<div class="my-topnav my-card my-top my-light-grey" id="head">
    	<a href="#" >Discussion Forum</a>
    	<!-- Nav tabs -->
    	<ul class="nav nav-tabs" role="tablist" style="float: right;">
      		<li role="presentation"><a href="#" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
      		<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">About Us</a></li>
      		<li role="presentation"><a href="http://oopadai.com/packages.php" aria-controls="messages" role="tab" data-toggle="tab">Packages</a></li>
      		<li role="presentation"><a href="http://oopadai.com/coming.php" aria-controls="settings" role="tab" data-toggle="tab">Offerzone</a></li>
      		<li><div class="main-nav"><a class="cd-signup" href="#0" data-modal-id="modal-register"><i class="fa fa-user-plus fa-lg"></i></a></div></li>
    	</ul>
  	</div>

	<div class="cd-user-modal"> <!-- this is the entire modal form, including the background -->
		<div class="cd-user-modal-container"> <!-- this is the container wrapper -->
			<ul class="cd-switcher">
				<li><a href="#0">Sign in</a></li>
				<li><a href="#0">New account</a></li>
			</ul>

			<div id="cd-login"> <!-- log in form -->
				<form class="cd-form">
					<p class="fieldset">
						<label class="image-replace cd-email" for="signin-email">E-mail</label>
						<input class="full-width has-padding has-border" id="signin-email" type="email" placeholder="E-mail">
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signin-password">Password</label>
						<input class="full-width has-padding has-border" id="signin-password" type="password"  placeholder="Password">
						<a href="#0" class="hide-password">Show</a>
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<input type="checkbox" id="remember-me" checked>
						<label for="remember-me">Remember me</label>
					</p>

					<p class="fieldset">
						<button class="full-width" id="login_form" onclick="login_form_submit()" type="submit">Login</button>
					</p>
				</form>
				
				<p class="cd-form-bottom-message"><a href="#0">Forgot your password?</a></p>
				<!-- <a href="#0" class="cd-close-form">Close</a> -->
			</div> <!-- cd-login -->

			<div id="cd-signup"> <!-- sign up form -->
				<form class="cd-form" action="register.jsp" method="post">
					<p class="fieldset">
						<label class="image-replace cd-username" for="signup-username">Username</label>
						<input class="full-width has-padding has-border" id="signup-username" type="text" placeholder="Username" name="username" required>
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-email" for="signup-email">E-mail</label>
						<input class="full-width has-padding has-border" id="signup-email" type="email" placeholder="E-mail" name="email" required>
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signup-password">Password</label>
						<input class="full-width has-padding has-border" id="signup-password" type="password"  placeholder="Password" name="password" required>
						<a href="#0" class="hide-password">Show</a>
						<span class="cd-error-message">Error message here!</span>
					</p>
                                        
                                        <p class="fieldset">
						<label class="image-replace cd-password" for="signup-password">Password</label>
						<input class="full-width has-padding has-border" id="signup-password-confirm" type="password"  placeholder="Confirm Password" name="check_password" onchange="check()" required>
						<a href="#0" class="hide-password">Show</a>
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<input type="checkbox" id="accept-terms" required>
						<label for="accept-terms">I agree to the <a href="#0">Terms</a></label>
					</p>

					<p class="fieldset">
						<button onclick="reg_form_submit()" id="reg_form" class="full-width has-padding" type="submit">Create account</button>
					</p>
				</form>

				<a href="#0" class="cd-close-form">Close</a>
			</div> <!-- cd-signup -->

			<div id="cd-reset-password"> <!-- reset password form -->
				<p class="cd-form-message">Lost your password? Please enter your email address. You will receive a link to create a new password.</p>

				<form class="cd-form">
					<p class="fieldset">
						<label class="image-replace cd-email" for="reset-email">E-mail</label>
						<input class="full-width has-padding has-border" id="reset-email" type="email" placeholder="E-mail">
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding" type="submit" value="Reset password">
					</p>
				</form>

				<p class="cd-form-bottom-message"><a href="#0">Back to log-in</a></p>
			</div> <!-- cd-reset-password -->
			<a href="#0" class="cd-close-form">Close</a>
		</div> <!-- cd-user-modal-container -->
	</div> <!-- cd-user-modal -->


	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script type="text/javascript">
  function reg_form_submit() {
    document.getElementById("reg_form").submit();
   } 
   function login_form_submit() {
   	document.getElementById("login_form").submit();
   }
   function check() {
        if (document.getElementById('signup-password-confirm').value==document.getElementById('signup-password').value){
        }
        else {
            alert("Password do not match");
            document.getElementById('signup-password-confirm').value='';
            document.getElementById('signup-password').value='';


        }
   }
  </script>


  <!-- MODAL -->
     <!--<div class="modal fade" id="modal-register" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
         <div class="modal-dialog">
          <div class="modal-content">

           <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
             <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
         </button>
         <ul class="nav nav-justified nav-tabs" role="tablist">
         	<li><a class="cd-signin" href="#">Login</a></li>
        	<li><a class="cd-signup" href="#">Register</a></li>
         </ul>
        <ul class="nav nav-tabs" role="tablist">
        <li role="presentation">
         <h3 class="modal-title" id="modal-register-label" style="color: #fd625e; font-weight: bold; font-family: Verdana;">Login</h3>
         </li>
         <li role="presentation">
         <h3 class="modal-title" id="modal-register-label" style="color: #fd625e; font-weight: bold; font-family: Verdana;">Register</h3>
         </li>
         </ul>
     </div>-->


     <!--Register -->
    <!-- <div id="register">
     <div class="modal-body">

           <form action="register.php" method="post" class="registration-form" enctype="multipart/form-data">
              <div class="form-group">
                 <label class="sr-only" for="form-first-name">First name</label>
                 <input type="text" name="form-first-name" placeholder="First name..." class="form-first-name form-control" id="form-first-name">
             </div>
             <div class="form-group">
              <label class="sr-only" for="form-last-name">Last name</label>
              <input type="text" name="form-last-name" placeholder="Last name..." class="form-last-name form-control" id="form-last-name">
          </div>
          <div class="form-group">
              <label class="sr-only" for="form-email">Email</label>
              <input type="text" name="form-email" placeholder="Email..." class="form-email form-control" id="form-email">
          </div>
          <div class="form-group">
              <label class="sr-only" for="form-password">Password</label>
              <input type="password" name="form-password" placeholder="Enter Password" class="form-password form-control" id="form-password">
          </div>
          <div class="form-group">
              <label class="sr-only" for="form-password"> Confirm Password</label>
              <input type="password" name="form-confirm" placeholder="Confirm Password" class="form-confirm form-control" id="form-confirm">
          </div>
          <div class="form-group">
              <label class="sr-only" for="form-about-yourself">About yourself</label>
              <textarea name="form-about-yourself" placeholder="About yourself..."
              class="form-about-yourself form-control" id="form-about-yourself" style="overflow: hidden; resize: none;"></textarea>
          </div>
		  <div class="form-group">
              <label class="sr-only" for="form-tags">Specialities</label>
              <input type="text" name="form-tags" placeholder="Enter Tags like Chemistry, Physics, etc. seperated by a single comma" class="form-tags form-control" id="form-tags" style="overflow: hidden; resize: none;">
          </div>
          <div class="form-group">
            <label class="sr-only" for="form-about-yourself">Upload Picture</label>
            <input type="file" name="image" id="image" accept="image/*">
          </div>
          <button type="submit" class="btn">Sign me up!</button>
      </form>
  </div>
</div>-->


	<!--Login-->
	<!--<div id="login">
     <div class="modal-body">

           <form action="register.php" method="post" class="registration-form" enctype="multipart/form-data">
              
          <div class="form-group">
              <label class="sr-only" for="form-email">Email</label>
              <input type="text" name="form-first-name" placeholder="NickName" class="form-first-name form-control" id="form-first-name">
          </div>
          <div class="form-group">
              <label class="sr-only" for="form-password">Password</label>
              <input type="password" name="form-password" placeholder="Enter Password" class="form-password form-control" id="form-password">
          </div>
          <button type="submit" class="btn">Login!</button>
      </form>
  </div>
</div>
-->
</body>
</html>