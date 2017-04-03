<html>
<head>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
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
    	<a href="#" >DiFo</a>
    	<!-- Nav tabs -->
    	<ul class="nav nav-tabs" role="tablist" style="float: right;">
      		<li role="presentation"><a href="#" aria-controls="home" role="tab" >Home</a></li>
      		<li role="presentation"><a href="questions.jsp" aria-controls="messages" role="tab" >Questions</a></li>
      		<li role="presentation"><a href="chat.jsp" aria-controls="settings" role="tab" >Chat</a></li>
                <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" >Users</a></li>
                <li role="presentation"><a href="showprofile.jsp" aria-controls="profile" role="tab" >Profile</a></li>
                <li role="presentation"><a href="aboutus.jsp" aria-controls="profile" role="tab" >About Us</a></li>
                <li><div class="main-nav"><a class="cd-signup" href="#0" data-modal-id="modal-register">Register</a></div></li>
    	</ul>
  	</div>

	<div class="cd-user-modal"> <!-- this is the entire modal form, including the background -->
		<div class="cd-user-modal-container"> <!-- this is the container wrapper -->
			<ul class="cd-switcher">
				<li><a href="#0">Sign in</a></li>
				<li><a href="#0">New account</a></li>
			</ul>

			<div id="cd-login"> <!-- log in form -->
                            <form class="cd-form" action="login.jsp" method="post">
					<p class="fieldset">
						<label class="image-replace cd-email" for="signin-email">E-mail</label>
						<input name="email" class="full-width has-padding has-border" id="signin-email" type="email" placeholder="E-mail">
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signin-password">Password</label>
						<input class="full-width has-padding has-border" id="signin-password" type="password"  placeholder="Password" name="password">
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
						<label class="image-replace cd-email" name="user_email" for="signup-email">E-mail</label>
						<input class="full-width has-padding has-border" id="signup-email" type="email" placeholder="E-mail" name="email" required>
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signup-password">Password</label>
						<input class="full-width has-padding has-border" id="signup-password" type="password"  placeholder="Password" name="password" required onkeyup="return password_check();">
						<a href="#0" class="hide-password">Show</a>
						<span class="cd-error-message">Error message here!</span>
                                                <span id="check" hidden="true">Type Password</span>
					</p>
                                        
                                        <p class="fieldset">
						<label class="image-replace cd-password" for="signup-password">Password</label>
						<input class="full-width has-padding has-border" id="signup-password-confirm" type="password"  placeholder="Confirm Password" name="check_password" onchange="check()" required>
						<a href="#0" class="hide-password">Show</a>
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<input type="checkbox" id="accept-terms" required>
						<label for="accept-terms">I agree to the <a target="_blank" href="terms.html">Terms</a></label>
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
            
            function password_check() {
                var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z]) (?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
                var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
                var enoughRegex = new RegExp("(?=.{6,}).*", "g");
                var pwd = document.getElementById("signup-password");
                
                if (pwd.value.length==0) {
                    document.getElementById('check').innerHTML = 'Type Password';
                } else if (false == enoughRegex.test(pwd.value)) {
                    document.getElementById('check').innerHTML = 'More Characters';
                } else if (strongRegex.test(pwd.value)) {
                    document.getElementById('check').innerHTML = '<b><span style="color:green">Strong!</span>';
                } else if (mediumRegex.test(pwd.value)) {
                    document.getElementById('check').innerHTML = '</b><b><span style="color:orange">Medium!</span>';
                } else {
                    document.getElementById('check').innerHTML = '</b><b><span style="color:red">Weak!</span>';
                }
            }
        </script>
</body>
</html>