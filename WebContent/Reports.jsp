 <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.lang.Math" %> 
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd"> 


<html>
<head>
<meta charset="ISO-8859-1">
<title>Reports</title>

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
.container input[type="date"]{
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

table{border:1;}


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
	
	//var today = new Date();
	//var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
	//document.getElementById("range1").min=String(""+date);
	
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


<br><br>
<h1 style="text-align:center"><b>Contribution of society</b></h1>
<br>

<!-- CHARTS -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<%
String[] events=new String[20];
String[] members=new String[20];
String[] workers=new String[20];
int[] collected=new int[20];

int i1=0,i2=0,i3=0;

try {
String connectionURL = "jdbc:mysql://localhost:3307/esociety"; 
Connection connection = null; 
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();  
connection = DriverManager.getConnection(connectionURL, "root", "Pswrd@MySQL");


if(!connection.isClosed())
{
	
	Statement stmt1=connection.createStatement();
	ResultSet rs1=stmt1.executeQuery("select name,collected from events where status='active'");
	i1=0;
	while(rs1.next()){
		events[i1]=rs1.getString(1);
		collected[i1++]=rs1.getInt(2);
		}
	
	Statement stmt2=connection.createStatement();
	ResultSet rs2=stmt2.executeQuery("select mailid from members");
	i2=0;
	while(rs2.next()){
		members[i2++]=rs2.getString(1);
		}
	
	Statement stmt3=connection.createStatement();
	ResultSet rs3=stmt3.executeQuery("select mailid from workers");
	i3=0;
	while(rs3.next()){
		workers[i3++]=rs3.getString(1);
		}
	
	for(int i=0;i<i1;i++){
		//System.out.println();
		if(collected[i]!=0){
		out.println("<script type='text/javascript'>"+
				"google.charts.load('current', {'packages':['corechart']});"+
						"google.charts.setOnLoadCallback(drawChart);"+
				"function drawChart() {"+
						"var data = google.visualization.arrayToDataTable(["+
				"['Task', 'Hours per Day'],");
				//out.println("['Work', 8],['Eat', 2],['TV', 4],['Gym', 2],['Sleep', 8]]);");
		/***********members*************/
				float sum=0;float piesize=0;
				String name=null;
				for(int j=0;j<i2;j++){
					
					Statement stmt4=connection.createStatement();
					ResultSet rs4=stmt4.executeQuery("select sum(amount),name from inward where mailid='"+members[j]+"' and event='"+events[i]+"' ");
					
					while(rs4.next()){
						sum=(float)rs4.getInt(1);
						name=rs4.getString(2);
						}
					//System.out.print("Sum:"+sum+",");
					if(sum!=0){
						
						piesize=(sum/collected[i])*24;
						out.println("['"+members[j]+"',"+Math.round(piesize)+"],");
						
						//System.out.print("Pie:"+piesize+",");
						//System.out.print("Rounded"+Math.round(piesize)+",");
					}
				}
				/*
				Statement stmt4=connection.createStatement();
				ResultSet rs4=stmt4.executeQuery("select sum(amount) from inward where name='"+members[i2-1]+"' and event='"+events[i]+"' ");
				
				while(rs4.next()){
					sum=rs4.getInt(1);
					}
				System.out.print(sum+",");
				piesize=(sum/collected[i])*24;
				out.println("['"+members[i2-1]+"',"+piesize+"]");
				
				*/
				
			/***********workers***************/	
				
				for(int j=0;j<i3-1;j++){
					
					Statement stmt5=connection.createStatement();
					ResultSet rs5=stmt5.executeQuery("select sum(amount),name from inward where mailid='"+workers[j]+"' and event='"+events[i]+"' ");
					
					while(rs5.next()){
						sum=(float)rs5.getInt(1);
						name=rs5.getString(2);
						}
					//System.out.print("Sum:"+sum+",");
					if(sum!=0){
						
						piesize=(sum/collected[i])*24;
						out.println("['"+workers[j]+"',"+Math.round(piesize)+"],");
						
						//System.out.print("Pie:"+piesize+",");
						//System.out.print("Rounded"+Math.round(piesize)+",");
					}
				}
				out.println("]);");
				
				/*
				Statement stmt5=connection.createStatement();
				ResultSet rs5=stmt5.executeQuery("select sum(amount) from inward where name='"+workers[i2-1]+"' and event='"+events[i]+"' ");
				
				while(rs5.next()){
					sum=rs5.getInt(1);
					}
				System.out.print(sum+",");
				piesize=(sum/collected[i])*24;
				out.println("['"+workers[i3-1]+"',"+piesize+"]");
				*/
				
				
			
			
			
			
		out.println("var options = {'title':'"+events[i].toUpperCase()+"', 'width':750, 'height':600};"+
					" var chart = new google.visualization.PieChart(document.getElementById('piechart"+i+"'));"+
				"chart.draw(data, options);}</script>");
		
		out.println("<div id=\"piechart"+i+"\" style=\"margin:auto; width:720px; height: 670px;\"></div>");
	
	
		}
	}
	

	
	
	
}

connection.close();

}
catch(Throwable e){
	e.printStackTrace();;
}

%>

<!-- END OF CHARTS -->

<div class="alert alert-dark" style="margin:auto;width:70%">
<strong>Note:</strong><br>1.The Following chart gives percentage of amount paid by 
members of the society with respect to the total amount collected so far.<br>
 2.Events for which collected funds is 'zero' are not displayed here.
</div>

<br><hr><br>

<br><br>
<h1 style="text-align:center"><b>Report Generation</b></h1>
<br>

 <div class="container" style="width:40%;margin:0 auto;">
  <div class="card" >
    <form name="reports" action="ReportServ" method="post">
        
    <div class="card-header" style='background-color:#397993;color:white;'>Generate reports</div>
    
    <div class="card-body" style="font-size:15px;">
    	  <input type="date" id="range1" name="range1" style="height: 70px; width: 100%" min="" placeholder=" From" required> 
        <input type="date" name="range2" style="height: 70px; width: 100%" placeholder=" To" required>
        <input type="submit" value="generate report" style="height: 70px; width: 100%" class="btn btn-info">
    </div> 
</form>
</div>
 
  </div>
<br><hr><br>
<h3 style="text-align:center">Inward Payments:</h3><br>
            <%
      
    		response.setContentType("text/html");
String output=(String)request.getAttribute("output");  
if(output!="" && output!=null)
out.println(output);
%>
<br><hr><br>
 <h3 style="text-align:center">Outward Payments:</h3><br>
             <%
      
    		response.setContentType("text/html");
String output1=(String)request.getAttribute("output1");  
if(output1!="" && output1!=null)
out.println(output1);
%>


<!--  
<div class="report" style="margin: 0 auto;" >
    
    <form name="reports" action="ReportServ" method="post">
     
         Inward payment details of given date range:<br>
        <br><input type="date" id="range1" name="range1" style="height: 40px; width: 40%" min="" placeholder=" From" required> &nbsp; &nbsp;
        <input type="date" name="range2" style="height: 40px; width: 40%" placeholder=" To" required><br>
        
      
        <br><input type="submit" value="generate report" style="height: 70px; width: 100%" class="button"><br>
        </form>
        <br>
           
            </div>
            
            <h3 style="text-align:center">Inward Payments:</h3>
            <%/*
      
    		response.setContentType("text/html");
String output=(String)request.getAttribute("output");  
if(output!="" && output!=null)
out.println(output);
*/%>
   
   <h3 style="text-align:center">Outward Payments:</h3>
             <%/*
      
    		response.setContentType("text/html");
String output1=(String)request.getAttribute("output1");  
if(output1!="" && output1!=null)
out.println(output1);*/
%>

-->

<br><br><br><br><br>

</div>
</body>
</html>