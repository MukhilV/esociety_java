
 <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="javax.servlet.http.HttpSession" %> 
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd"> 
<html>
<head>
<!--  <meta charset="ISO-8859-1">-->
<title>Profile</title>

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
.container input[type="number"]{
 	width: 100%;
 	float:right;
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

.cover{

  background-image: url("cover1.jpg");
  height: 50%;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

.greet{
color:white;
padding:40px;
}

th{
font-size:40px;

}
td{
font-size:20px;
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
function openNav() {
  document.getElementById("mySidenav").style.display = "block";
}

function closeNav() {
  document.getElementById("mySidenav").style.display = "none";
}

</script>

<script>

function admincheck(){

	var adminmail=sessionStorage.getItem("adminmail");
	var adminpswrd=sessionStorage.getItem("adminpswrd");
	//alert(adminmail);
	if(adminmail=="esocadmin@gmail.com" && adminpswrd=="admin"){
		
		//create event
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

<script>
function validate(){
	
}
</script>

<script>
function clearSessionStorage(){
	sessionStorage.setItem("adminmail","");
	sessionStorage.setItem("adminpswrd","");
}
</script>


</head>
<body onload="admincheck()">

<%
HttpSession session1=request.getSession();
String username1=(String) session1.getAttribute("username");

%>

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


<div style="width:100%; height:70px; background-color: #1D3D49" >

<div class="dropdown" style="float:right;height:100%;">

  <button class="dropbtn"><i class="fa fa-user-circle"></i>&nbsp;&nbsp;&nbsp;&nbsp;<% out.println((""+username1.charAt(0)).toUpperCase()+username1.substring(1));%></button>
  <div class="dropdown-content" >
  	<a href="http://localhost:8080/esociety/Profile.jsp"><i class="fa fa-user"></i>&nbsp;&nbsp;&nbsp;&nbsp;Profile</a>
  	<a href="http://localhost:8080/esociety/Setings.jsp"><i class="fa fa-fw fa-wrench"></i>&nbsp;&nbsp;&nbsp;&nbsp;Settings</a>
    <a href="http://localhost:8080/esociety/index.jsp" onclick="clearSessionStorage()"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;&nbsp;&nbsp;Log out</a>
  </div>
</div>
 </div>
 <br>
 
 
 

 <% 
try {
String connectionURL = "jdbc:mysql://localhost:3307/esociety"; 
Connection connection = null; 
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();  
connection = DriverManager.getConnection(connectionURL, "root", "Pswrd@MySQL");

String username="";

if(!connection.isClosed())
{
	

String email=(String) session1.getAttribute("email");
String persontype=(String) session1.getAttribute("persontype");

String output="",mailid="",name="",income="",wallet="",account="";
Statement stmt=connection.createStatement();
ResultSet rs=stmt.executeQuery("SELECT * FROM `esociety`.`"+persontype+"` where (`mailid`='"+email+"');");

while(rs.next()){
 	mailid=rs.getString("mailid");
 	name=rs.getString("name");
 	username=name;
 	income=""+rs.getInt("income");
 	wallet=""+rs.getInt("wallet");
 	if(persontype.equals("workers")){account=""+rs.getInt("account");}

 	}
%>
 
 
 
 <div class='cover' >
 
 <div class="greet">
 <p style="font-size:50px;"><b>Hello,  <%out.println(username); %></b></p>
 <p>This is your profile page. You can see all the information about you.<p>
 </div>
 <br><br><br><br><br>
 
 <div class="container">
  <div class="card">
    <div class="card-header" style="text-align:center;color:white;background-color: #397993"><h1><b>Profile</b></h1></div>
    <div class="card-body">
   <!--  <br><input type="file" id="img" name="img" accept="image/*"><br><br> -->
    <p>Name:</p><input type="text" value="<% out.println(name);%>" disabled>
    <p>Mail Id:</p><input type="text" value="<% out.println(mailid);%>"  disabled>
    <p>Monthly income:</p><input type="text" value="<% out.println(income);%>"  disabled>
    <p>Money in wallet:</p><input type="text" value="<% out.println(wallet);%>"  disabled>
    <%
    if(persontype.equals("workers")){
    	output=output+"<p>Money in account:</p><input type=\"text\" value='"+account+"' disabled>";
    	out.println(output);
    	}
    %>
    
    </div> 
   
</div>
 </div>
 


<%/*
output=output+"<tr><td><h2>Name:</h2></td><td><h2>"+name+"</h2></td></tr>";
output=output+"<tr><td><h2>Mailid:</h2></td><td><h2>"+mailid+"</h2></td></tr>";
output=output+"<tr><td><h2>Monthly income:</h2></td><td><h2>"+income+"</h2></td></tr>";
output=output+"<tr><td><h2>Money in wallet:</td><td><h2>"+wallet+"</h2></td></tr>";
if(persontype.equals("workers")){
output=output+"<tr><td><h2>Money in account:</td><td><h2>"+account+"</h2></td></tr>";
}
output=output+"</table>";
output=output+"</div>";
out.println(output);
*/
connection.close();
}
}

catch(Exception ex){
System.out.println(ex);
}
%>


<br><br><br><br><br><br><br>
           
</div>
 
</div>


</body>
</html>