<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-society</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/esociety/dummy.js" type="text/javascript"></script>
<link rel="stylesheet" href="/esociety/dummy.css" type="text/css" >

<!------ Include the above in your HEAD tag ---------->

<style>
   
@import url('https://fonts.googleapis.com/css?family=Mukta');
body{
  font-family: 'Mukta', sans-serif;
	height:100vh;
	
	/*background-image: url(http://www.planwallpaper.com/static/images/Free-Wallpaper-Nature-Scenes.jpg);*/
	/*background-image:url("bg4.jpg");
	 background-image: linear-gradient(to bottom right,#347B98, #F7F0D4);
	  background-repeat: no-repeat;*/
	
	background-color: #E5F1F5;
	background-position:center;
	position:relative;
    overflow-y: scroll;
}
a{
  text-decoration:none;
  color:#444444;
}
.login-reg-panel{
    position: relative;
    top: 50%;
    transform: translateY(-50%);
	text-align:center;
    width:70%;
	right:0;left:0;
    margin:auto;
    height:500px;
    background-color: #092834;
   
}
.white-panel{
    background-color: rgba(255,255, 255, 1);
    height:650px;
    position:absolute;
    top:-50px;
    width:50%;
    right:calc(50% - 50px);
    transition:.3s ease-in-out;
    z-index:0;
    box-shadow: 0 0 15px 9px #00000096;
    
}
.login-reg-panel input[type="radio"]{
    position:relative;
    display:none;
}
.login-reg-panel{
    color:#B8B8B8;
    
}
.login-reg-panel #label-login, 
.login-reg-panel #label-register{
    border:3px solid #9E9E9E;
    padding:5px 5px;
    width:150px;
    display:block;
    text-align:center;
    border-radius:10px;
    cursor:pointer;
    font-weight: 600;
    font-size: 18px;
   
}
.login-info-box{
    width:30%;
    padding:0 50px;
    top:20%;
    left:0;
    position:absolute;
    text-align:left;
    
}
.register-info-box{
    width:30%;
    padding:0 50px;
    top:20%;
    right:0;
    position:absolute;
    text-align:left;
    
    
}
.right-log{right:50px !important;}

.login-show, 
.register-show{
    z-index: 1;
    display:none;
    opacity:0;
    transition:0.3s ease-in-out;
    color:#242424;
    text-align:left;
    padding:50px;
    
}
.show-log-panel{
    display:block;
    opacity:0.9;
    
}
.login-show input[type="text"], .login-show input[type="password"],
.login-show input[type="email"],.login-show select{
    width: 100%;
    display: block;
    margin:20px 0;
    padding: 15px;
    border: 1px solid #b5b5b5;
    outline: none;
    color:grey;
   
}
.login-show input[type="submit"] {
    max-width: 150px;
    width: 100%;
    background: #444444;
    color: #f9f9f9;
    border: none;
    padding: 10px;
    text-transform: uppercase;
    border-radius: 2px;
    float:right;
    cursor:pointer;
    
}
.login-show a{
    display:inline-block;
    padding:10px 0;
   
}

.register-show input[type="text"], .register-show input[type="password"],
.register-show input[type="email"],.register-show input[type="number"],
.register-show select{
    width: 100%;
    display: block;
    margin:20px 0;
    padding: 15px;
    border: 1px solid #b5b5b5;
    outline: none;
    color:grey;
    
}
.register-show input[type="submit"] {
    max-width: 150px;
    width: 100%;
    background: #444444;
    color: #f9f9f9;
    border: none;
    padding: 10px;
    text-transform: uppercase;
    border-radius: 2px;
    float:right;
    cursor:pointer;
    
}
.credit {
    position:absolute;
    bottom:10px;
    left:10px;
    color: #3B3B25;
    margin: 0;
    padding: 0;
    font-family: Arial,sans-serif;
    text-transform: uppercase;
    font-size: 12px;
    font-weight: bold;
    letter-spacing: 1px;
    z-index: 99;
}
a{
  text-decoration:none;
  color:#2c7715;
}
    
    

</style>

	<script>
function getval(){
	var mail=document.login.mail.value;
	var pswrd=document.login.pswrd.value;
	var type=login.persontype.value;
	sessionStorage.setItem("persontype",type);
	if(mail=="esocadmin@gmail.com" && pswrd=="admin" && type=="members"){
		sessionStorage.setItem("adminmail",mail);
		sessionStorage.setItem("adminpswrd",pswrd);
		//alert("identified as admin");
	}
	//alert("from getval()");
	
	document.getElementById("result").innerHTML = sessionStorage.getItem("persontype");
	return true;
}
</script>

</head>
<body>
 <h1 style="text-align:center;   
 font-family: 'Brush Script MT', cursive;
 padding-top:20px;
 color:#092834;"><img src="lg2.png" style="width:10%;  height:170px;"></img><b>E-Society<b></h1> 
 
 	     				 <%
String delaccstatus=(String)request.getAttribute("delaccstatus");
if(delaccstatus!=null){
	out.println("<br><br><div class=\"alert alert-info\" style=\"width:50%; margin: 0 auto;\"><strong>"+delaccstatus+" !</strong></div>");
}
%>

<div class="login-reg-panel">




		<div class="login-info-box">
			<h2>Have an account?</h2>
			
			<label id="label-register" for="log-reg-show">Login</label>
			<input type="radio" name="active-log-panel" id="log-reg-show"  checked="checked">
		</div>
						
						
						
							
		<div class="register-info-box">
			<h2>Don't have an account?</h2>
			
			<label id="label-login" for="log-login-show">Register</label>
			<input type="radio" name="active-log-panel" id="log-login-show">
		</div>
				
				
				
							
		<div class="white-panel">
			<div class="login-show">
			<br><br><br>
				<h2>LOGIN</h2>
				<form name="login" method="post" action="LoginServ" onsubmit="return getval()">
				 <select name="persontype" id="persontype" style=" width: 100%;
   				 display: block;
    			margin:20px 0;
   				 padding: 15px;
    			border: 1px solid #b5b5b5;
    			outline: none;" required >
				 <option value="" selected disabled >Person Type</option>
				 <option value="members"> Member</option>
 				<option value="workers"> Worker</option>
				 </select>
 					
				<input type="email" name="mail" id="mail" placeholder="Email" style="width:100%" required>
				<input type="password" name="pswrd" id="pswrd" placeholder="Password" required>
				<%
			String login_msg=(String)request.getAttribute("error");  
			if(login_msg!=null)
			out.println("<font color=red size=4px>"+login_msg+"</font>");
				%>
				<input type="submit" value="Login" style="vertical-align: middle; width: 50%;" >
				<a href="">Forgot password?</a>
				</form>
			</div>
			
			
			
			
			<div class="register-show">
				<!-- <h2>REGISTER</h2> -->
				<form name="signin" onsubmit="validate()" action="SignupServ" method="post">
				<select name="persontype" id="persontype" style=" width: 100%">
				<option value="" selected disabled >Person Type</option>
 			<option value="Member"> Member</option>
 			<option value="worker"> Worker</option>
 			</select>
				<input type="text" name="name" placeholder=" Name" style="width: 100%" required >
				<input type="number" name="income" placeholder=" Monthly income" style="width: 100%" required>
				<input type="email" name="email" placeholder="Email" required>
				<input type="password" name="pswrd1" placeholder="Password" required>
				<input type="password" name="pswrd2"placeholder="Confirm Password" required>
				 <%
String passwordstatus=(String)request.getAttribute("passwordstatus");
if(passwordstatus!=null){
	out.println("<font color=red size=4px>"+passwordstatus+"</font>");
}
%>
				 <%
String signupstatus=(String)request.getAttribute("signupstatus");
if(signupstatus!=null){
	out.println("<font color=green size=4px>"+signupstatus+"</font>");
}
%>
				
				<input type="submit" value="Register" style="width:100%">
				</form>
			</div>
			
			
		</div>
	</div>
	

	
	<script>
	/**
	 * http://usejsdoc.org/
	 */

	    $(document).ready(function(){
	    $('.login-info-box').fadeOut();
	    $('.login-show').addClass('show-log-panel');
	});


	$('.login-reg-panel input[type="radio"]').on('change', function() {
	    if($('#log-login-show').is(':checked')) {
	        $('.register-info-box').fadeOut(); 
	        $('.login-info-box').fadeIn();
	        
	        $('.white-panel').addClass('right-log');
	        $('.register-show').addClass('show-log-panel');
	        $('.login-show').removeClass('show-log-panel');
	        
	    }
	    else if($('#log-reg-show').is(':checked')) {
	        $('.register-info-box').fadeIn();
	        $('.login-info-box').fadeOut();
	        
	        $('.white-panel').removeClass('right-log');
	        
	        $('.login-show').addClass('show-log-panel');
	        $('.register-show').removeClass('show-log-panel');
	    }
	});
	  

	</script>
	<br> <br><br> <br><br> <br><br> <br><br> <br><br> <br><br> <br><br> <br><br> <br>
	

	
<br><br> <br><br> <br><br> <br>

</body>
</html>