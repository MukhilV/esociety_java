 <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="javax.servlet.http.HttpSession" %>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd"> 

<html>
<head>
<meta charset="ISO-8859-1">
<title>Settings</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  

<style>
@import url('https://fonts.googleapis.com/css?family=Mukta');
body {
 margin:0;
  font-family: 'Mukta', sans-serif;
  font-size: 20px;
  background-color: #E5F1F5;
           
}
/*side nav*/
.sidebar {
  margin: 0;
  padding: 0;
  width: 250px;
  background-color: #0B2732;

  position: fixed;
  height: 100%;
  overflow: auto;
  font-size:20px;
}

.sidebar a {
  display: block;
  color: white;
  padding: 15px;
  font-size:20px;
  font-style:bold;
 
  text-decoration: none;
}
 

.sidebar a:hover:not(.active) {
  background-color: #f2f2f2;
  color: #0B2732;
  
}

div.content {
  margin-left: 250px;
  padding: 1px 16px;
  height: 1000px;
}

@media screen and (max-width: 700px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
  .sidebar a {float: left; }
  div.content {margin-left: 0;}
}

@media screen and (max-width: 400px) {
  .sidebar a {
    text-align: center;
    float: none;
  }
}


/*****card****/
html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: center;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 20px 20px 20px 20px;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.container {
  padding: 0 16px;
}
.container input[type="text"],
.container input[type="number"],.container input[type="password"]{
 width: 100%;
    display: block;
    margin:20px 0;
    padding: 15px;
    border: 1px solid #b5b5b5;
    outline: none;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}


/*******dropdown********/
.dropbtn {
  background-color: #1D3D49;
  color: white;
  padding: 20px;
  padding-right:30px;
  font-size: 20px;
  border: none;
  cursor: pointer;
  font-weight:bold;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  right: 0;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
width:250px;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  
}

.dropdown-content a:hover {background-color: #f1f1f1;}
.dropdown:hover .dropdown-content {display: block;}
.dropdown:hover .dropbtn {background-color: #6CACC6;}



</style>

<script>

function admincheck(){
	var adminmail=sessionStorage.getItem("adminmail");
	var adminpswrd=sessionStorage.getItem("adminpswrd");
	//alert(adminmail);
	if(adminmail=="esocadmin@gmail.com" && adminpswrd=="admin"){
		
		var a=document.createElement("A");
		a.setAttribute("href", "http://localhost:8080/esociety/CreateEvent.jsp");
		var text = document.createTextNode("\xa0\xa0\xa0\xa0Manage Event ");
		
		var i=document.createElement("i");
		i.setAttribute("class","fa fa-calendar-o");
		
		a.appendChild(i);
		a.appendChild(text);
		
		var sidenav=document.getElementById("mySidenav");
		sidenav.insertBefore(a,sidenav.lastElementChild);
		
		//withdraw
		var a=document.createElement("A");
		a.setAttribute("href", "http://localhost:8080/esociety/Withdraw.jsp");
		var text = document.createTextNode("\xa0\xa0\xa0\xa0Withdraw ");
		
		var i=document.createElement("i");
		i.setAttribute("class","fa fa-money");
		
		a.appendChild(i);
		a.appendChild(text);
		
		var sidenav=document.getElementById("mySidenav");
		sidenav.insertBefore(a,sidenav.lastElementChild);
		
		//payworker
		var a=document.createElement("A");
		a.setAttribute("href", "http://localhost:8080/esociety/Payworker.jsp");
		var text = document.createTextNode("\xa0\xa0\xa0\xa0Pay Worker ");
		
		var i=document.createElement("i");
		i.setAttribute("class","fa fa-credit-card");
		
		a.appendChild(i);
		a.appendChild(text);
		
		var sidenav=document.getElementById("mySidenav");
		sidenav.insertBefore(a,sidenav.lastElementChild);
		}
}

</script>

</head>
<body onload="admincheck()">
  
<div id="mySidenav" class="sidebar">
<a href="http://localhost:8080/esociety/Dashboard.jsp" style="text-align:center;   
 font-family: 'Brush Script MT', cursive;
 padding-top:20px;font-size:30px;">E- Society</b></a>
 <img src="lg2.png" 
 style="width:80%;  height:170px;padding:0px;margin:20px; border: 20px solid #E5F1F5; 
 background-color: #E5F1F5;border-bottom-left-radius:100px 40%;border-bottom-right-radius:100px 10%;
 border-top-right-radius:100px 40%;border-top-left-radius:100px 40%;"></img>
 <!-- <a  href=""> <img src="" style="width:100%; height:60px; padding:10px;"></img></a> -->
<a  href="http://localhost:8080/esociety/Dashboard.jsp"><i class="fa fa-television"></i>&nbsp;&nbsp;&nbsp;&nbsp;Dashboard</a> 
<!--  <a  href="http://localhost:8080/esociety/Profile.jsp"><i class="fa fa-user"></i>&nbsp;&nbsp;&nbsp;&nbsp;Profile</a> --> 
 <a href="http://localhost:8080/esociety/Wallet.jsp"><i class="fa fa-google-wallet"></i>&nbsp;&nbsp;&nbsp;&nbsp;Wallet</a>
<!-- <a  href="http://localhost:8080/esociety/Setings.jsp"><i class="fa fa-fw fa-wrench"></i>&nbsp;&nbsp;&nbsp;&nbsp;Settings</a>-->
  <a href="http://localhost:8080/esociety/Reports.jsp"><i class="fa fa-pie-chart"></i>&nbsp;&nbsp;&nbsp;&nbsp;Reports</a>
   <a href="http://localhost:8080/esociety/Feedback.jsp"><i class="fa fa-envelope"></i>&nbsp;&nbsp;&nbsp;&nbsp;Mail</a>
   <!--  <a href="http://localhost:8080/esociety/index.jsp" onclick="clearSessionStorage()"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;&nbsp;&nbsp;log out</a>  -->
</div>


<div class="content" >

<%
HttpSession session1=request.getSession();
String username=(String) session1.getAttribute("username");
%>
<div style="width:100%; height:70px; background-color: #1D3D49" >

<div class="dropdown" style="float:right;height:100%;">

  <button class="dropbtn"><i class="fa fa-user-circle"></i>&nbsp;&nbsp;&nbsp;&nbsp;<% out.println((""+username.charAt(0)).toUpperCase()+username.substring(1));%></button>
  <div class="dropdown-content" >
  	<a href="http://localhost:8080/esociety/Profile.jsp"><i class="fa fa-user"></i>&nbsp;&nbsp;&nbsp;&nbsp;Profile</a>
  	<a href="http://localhost:8080/esociety/Setings.jsp"><i class="fa fa-fw fa-wrench"></i>&nbsp;&nbsp;&nbsp;&nbsp;Settings</a>
    <a href="http://localhost:8080/esociety/index.jsp" onclick="clearSessionStorage()"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;&nbsp;&nbsp;Log out</a>
  </div>
</div>
 </div>

<script>
function openNav() {
  document.getElementById("mySidenav").style.display = "block";
}

function closeNav() {
  document.getElementById("mySidenav").style.display = "none";
}
</script>

<script>
function validate(){
	var oldpassword=document.settingsform.oldpassword.value;
	var newpassword=document.settingsform.newpassword.value;
	var newname=document.settingsform.newname.value;
	var newincome=document.settingsform.newincome.value;
	if(newname=="" && newincome=="" && oldpassword=="" && newpassword=="" ){alert("Enter some value");return false;}
	
	else if(oldpassowrd!="" && newpassword==""){
		alert("Enter new password");
		return false;
	}
	else if(newpassword!="" && oldpassword==""){
		alert("Confirm your old password");
		return false;
	}
}
</script>

<script>
function clearSessionStorage(){
	sessionStorage.setItem("adminmail","");
	sessionStorage.setItem("adminpswrd","");
}
</script>
<br><br><br>
<br><h1 style="text-align:center"><b>Settings</b></h1><br>
 <div class="container" style="width:70%;margin:0 auto;">
  <div class="card" >
       <form name="settingsform" action="SettingsServ" method="post" onsubmit="return validate()">
        
    <div class="card-header" style='background-color:#397993;color:white;'>Change your personal details</div>
    
    <div class="card-body" style="font-size:15px;">
    
           Enter new name:<br>
            <input type="text" name="newname" id="newname" style="height: 70px; width: 100% " placeholder=" New name">
                   <%
				String namestatus=(String)request.getAttribute("namestatus");  
				if(namestatus!=null)
				out.println("<div class=\"alert alert-dark\">"+namestatus+"</div>");
					%>	
            <br>Change income:<br>
            <input type="number" name="newincome" id="newincome" style="height: 70px; width: 100%" placeholder=" New income">
                   <%
						String incomestatus=(String)request.getAttribute("incomestatus");  
						if(incomestatus!=null)
						out.println("<div class=\"alert alert-dark\">"+incomestatus+"</div>");
						%>
            <br>Change Password:<br>
            <input type="password" name="oldpassword" id="oldpassword" style="height: 70px; width: 100%" placeholder=" Old password">
                   <%
						String incorrectopswrd=(String)request.getAttribute("incorrectopswrd");  
						if(incorrectopswrd!=null)
						out.println("<div class=\"alert alert-dark\">"+incorrectopswrd+"</div>");
							%>
            <input type="password" name="newpassword" id="newpassword" style="height: 70px; width: 100%" placeholder=" New password">
                <%
						String passwordstatus=(String)request.getAttribute("passwordstatus");  
						if(passwordstatus!=null)
						out.println("<div class=\"alert alert-dark\">"+passwordstatus+"</div>");
							%>
							
							                <%
						String bothpassword=(String)request.getAttribute("bothpassword");  
						if(bothpassword!=null)
						out.println("<div class=\"alert alert-dark\">"+bothpassword+"</div>");
							%>
							
            <br><input type="submit" value="Modify" style="height: 70px; width: 100%"  class="btn btn-info"><br>
    	
    </div> 
 

    </form>
  </div>
</div>

<br><br><br>

<br><h1 style="text-align:center"><b>Delete Account</b></h1><br>

 <div class="container" style="width:70%;margin:0 auto;">
  <div class="card" >
       <form name="deleteacc" action="DeleteAccount" method="post" >
        
    <div class="card-header" style='background-color:#397993;color:white;'>Delete your account</div>
    
    <div class="card-body" style="font-size:15px;">
    		<h3 style="text-align:center "> Warning!. Once the account is deleted, it cannot be undone</h3>
    		
    		 <input type="password" name="delpassword" id="delpassword" style="height: 70px; width: 100%" placeholder=" Confirm your password to delete the account" required>
  			<input type="submit" value="Delete Account" style="height: 70px; width: 100%"  class="btn btn-info">
    	
    </div> 
         <div class="card-footer" style="font-size:20px;">
     				 <%
String delaccstatus=(String)request.getAttribute("delaccstatus");
if(delaccstatus!=null){
	out.println("<div class=\"alert alert-dark\">"+delaccstatus+"</div>");
}
%>
</div>

    </form>
  </div>
</div>






<!-- 

<h1 style="text-align:center"><b>Settings</b></h1>
<div class="settings" style="margin: 0 auto;" >
    
            You can change one or more property at a time<br>
        
        <form name="settingsform" action="SettingsServ" method="post" onsubmit="return validate()">
        
            Enter new name:<br>
            <input type="text" name="newname" id="newname" style="height: 30px; width: 70% " placeholder=" New name"><br>
                   <%/*
				String namestatus=(String)request.getAttribute("namestatus");  
				if(namestatus!=null)
				out.println("<div class=\"alert alert-dark\"><strong>"+namestatus+"</strong></div>");
					*/%>	
            <br>Change income:<br>
            <input type="number" name="newincome" id="newincome" style="height: 30px; width: 70%" placeholder=" New income"><br>
                   <%/*
						String incomestatus=(String)request.getAttribute("incomestatus");  
						if(incomestatus!=null)
						out.println("<div class=\"alert alert-dark\"><strong>"+incomestatus+"</strong></div>");
						*/%>
            <br>Change Password:<br>
            <input type="password" name="oldpassword" id="oldpassword" style="height: 30px; width: 70%" placeholder=" Old password"><br>
                   <%/*
						String incorrectopswrd=(String)request.getAttribute("incorrectopswrd");  
						if(incorrectopswrd!=null)
						out.println("<br><font color=red size=4px>"+incorrectopswrd+"</font><br>");
							*/%>
            <input type="password" name="newpassword" id="newpassword" style="height: 30px; width: 70%" placeholder=" New password"><br>
                <%/*
						String passwordstatus=(String)request.getAttribute("passwordstatus");  
						if(passwordstatus!=null)
						out.println("<div class=\"alert alert-dark\"><strong>>"+passwordstatus+"</strong></div>");
							*/%>
							
							                <%/*
						String bothpassword=(String)request.getAttribute("bothpassword");  
						if(bothpassword!=null)
						out.println("<div class=\"alert alert-dark\"><strong>>"+bothpassword+"</strong></div>");
							*/%>
							
            <br><input type="submit" value="Modify" style="height: 70px; width: 70%" class="button"><br>
        </form>
        
        <br><a href=""><button type="button" style="height: 70px; width: 70%" class="button"> Delete account </button></a><br>
        
</div>
-->
<br><br><br><br><br>
</div>

</body>
</html>