
 <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="javax.servlet.http.HttpSession" %>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd"> 
<html>
<head>
<!--  <meta charset="ISO-8859-1">-->
<title>Dashboard</title>

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
.container input[type="number"],
.container select
{
 width: 100%;
    display: block;
    margin:20px 0;
    padding: 15px;
    border: 1px solid #b5b5b5;
    outline: none;
    color:grey;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}
/*
hr{
height:5px;
border-radius:5px;
background-color: grey;
}
*/

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
		text.setAttribuite
		
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




 <div id="mySidenav" class="sidebar">
<a href="http://localhost:8080/esociety/Dashboard.jsp" style="text-align:center;   
 font-family: 'Brush Script MT', cursive;
 padding-top:20px;font-size:30px;">E- Society</b></a>
 <img src="lg2.png" 
 style="width:80%;  height:170px;padding:0px;margin:20px; border: 20px solid #E5F1F5; 
 background-color: #E5F1F5;border-bottom-left-radius:100px 40%;border-bottom-right-radius:100px 10%;
 border-top-right-radius:100px 40%;border-top-left-radius:100px 40%;"></img>
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

<!--  
<a style="float: right;color:white;padding-top:17px;padding-bottom:20px;padding-right:20px; " href="http://localhost:8080/esociety/index.jsp" onclick="clearSessionStorage()"> 
<button type="button" class="btn btn-info" style="border-radius:5px;fontsize:15px;background-color: #6CACC6">
<i class="fa fa-sign-out"></i> Log out</button></a>
-->




<% 

String[] events=new String[20];
int f=0;

try {
String connectionURL = "jdbc:mysql://localhost:3307/esociety"; 
Connection connection = null; 
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();  
connection = DriverManager.getConnection(connectionURL, "root", "Pswrd@MySQL");



if(!connection.isClosed())
{
String output="",ename="",edesc="",efrom="",eto="",estatus="";
int efund=0,vault=0,ecollected=0,upvote=0,downvote=0;


//money in vault
Statement stmt1=connection.createStatement();
ResultSet rs1=stmt1.executeQuery("select amount from vault where id=1");
while(rs1.next()){vault=rs1.getInt(1);}
out.println("<br>");out.println();out.println();out.println();out.println();
out.println("<div class='jumbotron text-center' "+
" style=' background-image: url(\"money1.jpg\"); height: 20%;background-position: center;background-repeat: no-repeat;background-size: cover;' >"+
"<p style='font-size:50px;color:white;opacity:0.9;'><b>Money in vault: "+vault+"</b></p> </div>");
out.println("<hr>");
%>


<% 
//displaying events
Statement stmt=connection.createStatement();
ResultSet rs=stmt.executeQuery("select * from events where status='active'");
out.println("<br><br><h1 style=\"text-align:center\"><b>On going Events</b></h1><br>");


String votestatus=(String)request.getAttribute("votestatus");
if(votestatus!=null){
out.println("<div class=\"alert alert-info\" style=\"width:50%; margin: 0 auto;\"><strong>"+votestatus+"</strong></div><br><br>");
}


while(rs.next()){
 	ename=rs.getString("name");
 	edesc=rs.getString("desc");
 	efrom=rs.getString("from");
 	eto=rs.getString("to");
 	efund=rs.getInt("fund");
 	ecollected=rs.getInt("collected");
 	upvote=rs.getInt("upvote");
 	downvote=rs.getInt("downvote");
 	//estatus=rs.getString("status");
 	if(efund==0 && ecollected==0){
 		PreparedStatement ps3=connection.prepareStatement("update events set status='completed' where name='"+ename+"'");
		ps3.executeUpdate();
		continue;
 	}
 	//output=output+"<tr><td>"+ename+"</td><td>"+edesc+"</td><td>"+efrom+"</td><td>"+eto+"</td><td>"+efund+"</td><td>"+ecollected+"</td></tr>";
 	
 	
 	output=output+"<div class=\"container\">";
output=output+"<div id=\"accordion\">";
 	output=output+"<div class=\"card\">";
 	output=output+"<div class=\"card-header\" style='background-color:#1D3D49;'><a class=\"card-link\" data-toggle=\"collapse\" href=\"#collapseOne\" style='color:white'>"+ename+"</a></div>";
 	output=output+"<div id=\"collapseOne\" class=\"collapse show\" data-parent=\"#accordion\"><div class=\"card-body\">"+
 	"<b>From:</b> "+efrom+" <br> <b>To:</b> "+eto+"<br>"+
 	"<b>Description:</b> "+edesc+"<br>"+
 	"<b>Collected:</b> "+ecollected+"<br>"+
 	"<b>Total amount required:</b> "+efund+" <br>"+
 	"<b>Upvotes:</b> "+upvote+"<br>"+
 	"<b>Downvotes:</b> "+downvote+" </div></div>";
 	
 	output=output+" <div class=\"card-footer\" style=\"font-size:20px color:white;\">"+
 	" <form name=\"upvoteform\" action=\"VoteServ\" method=\"post\" style=\"float:left;padding:10px;\">"+
 	"<input type=\"hidden\"  name=\"vote\" value=\"1\">"+
 	"<input type=\"hidden\"  name=\"eventname\" value="+ename+">"+
 	"<button type=\"submit\" class=\"btn btn-info\" style=\"border-radius:5px;fontsize:15px; background-color: #6CACC6\">"+
 	"<i class=\"fa fa-thumbs-up\"></i> Upvote</button></a>"+
 	 "</form>";
 	output=output+" <form name=\"downvoteform\" action=\"VoteServ\" method=\"post\" style=\"float:right;padding:10px;\">"+
 			"<input type=\"hidden\"  name=\"vote\" value=\"-1\">"+
 			"<input type=\"hidden\"  name=\"eventname\" value="+ename+">"+
 		 	"<button type=\"submit\" class=\"btn btn-info\" style=\"border-radius:5px;fontsize:15px;background-color: #6CACC6\">"+
 		 	"<i class=\"fa fa-thumbs-down\"></i> Downvote</button></a>"+
 		 	 "</form>";
	
 		 	 
	output=output+"</div>";
 	output=output+"</div>";
 	output=output+"</div><br>";
 	output=output+"</div>";
 	
 	events[f]=ename;
 	f+=1;
}

out.println(output);

if(f==0){
 	output=output+"<div class=\"container\">";
output=output+"<div id=\"accordion\">";
 	output=output+"<div class=\"card\">";
 	output=output+"<div class=\"card-header\" style='background-color:#1D3D49;'><a class=\"card-link\" data-toggle=\"collapse\" href=\"#collapseOne\" style='color:white'></a></div>";
 	output=output+"<div id=\"collapseOne\" class=\"collapse show\" data-parent=\"#accordion\"><div class=\"card-body\"><h3 style=\"text-align:center\">No Ongoing Events</h3></div></div></div>";
 	output=output+"</div><br>";
 	output=output+"</div>";
 	out.println(output);
}
}
connection.close();

}

catch(Exception ex){
System.out.println(ex);

}
%>

<!--  
******************************************
 <div class="card-footer" style="font-size:20px;">
 <form name="upvote" action="" method="post" style="float:left;">
<button type="submit" class="btn btn-info" style="border-radius:5px;fontsize:15px;background-color: #6CACC6">
<i class="fa fa-thumbs-up"></i> Upvote</button></a>
 </form> 

 <form name="upvote" action="" method="post" style="float:right;">
<button type="submit" class="btn btn-info" style="border-radius:5px;fontsize:15px;background-color: #6CACC6">
<i class="fa fa-thumbs-up"></i> Downvote</button></a>
 </form> 

 </div>

******************************************
-->

<hr>
<h1 style="text-align:center"><b>Payment section</b></h1><br>

 <div class="container" style="width:40%;margin:0 auto;">
  <div class="card" >
        <form name="inward" action="DashboardServ" method="post" onsubmit="validate()">
        
    <div class="card-header" style='background-color:#397993;color:white;'>Pay for Events</div>
    
    <div class="card-body" style="font-size:15px;">
    
    <select name="eventname"  style="height:70px; width: 100%" required>
				<option value="" selected disabled >Events</option>
				<% for(int i=0;i<f;i++){
					out.println("<option value=\""+events[i]+"\" >"+events[i]+"</option>");
				}
				%>
 			</select>
    
    	<!--  <input type="text" name="eventname" style="height: 70px; width: 100%;" placeholder=" Enter event name" required> -->
          <input type="number" name="amt" style="height: 70px; width: 100%;" placeholder=" Enter amount" min="1" required>
           
            <div style=""><button type="submit" class="btn btn-info" style="height: 70px;width:100%;font-size:20px; " >Pay</button></div><br>
    </div> 
    
    
    <div class="card-footer" style="font-size:20px;">
     				 <%
String paymentstatus=(String)request.getAttribute("paymentstatus");
if(paymentstatus!=null){
	out.println("<div class=\"alert alert-dark\">"+paymentstatus+"</div>");
}
%>
</div>

    </form>
  </div>
</div>
<!--   <div style="margin: 0 auto;"><a href="http://localhost/workspace/msg.php"><button class="button">Show Requests</button></a></div>-->
<br><br><br><br>
</div>
<br><br><br><br>

</body>
</html>