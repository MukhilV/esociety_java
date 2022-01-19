<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

 <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
              h1{font-family: sans-serif;
                text-align: center;
                 color:   #4d4d4d;
            }   
            
            div {
    width: 300px;
  padding: 50px;
  margin: 20px;
  
}
input{
    height: 30px;
}

/* top nav*/
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color:  #00802b;
}

li {
  float: left;
  font-size: 28px;
  font-family: sans-serif;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: #4CAF50;
}

/*button*/
.button {
  display: inline-block;
  border-radius: 4px;
  background-color: #00802b;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 20px;
  padding: 20px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
        </style>
        <script>
            function validate()
            {
                var name=document.signin.name.value;
                var email=document.signin.email.value;
                var income=document.signin.income.value;
                var pswrd1=document.signin.pswrd1.value;
                var pswrd2=document.signin.pswrd2.value;
                
                
                if(name=="") {alert("Enter Name"); return false;}
                if(email=="") {alert("Enter Mail");return false;}
                if(income=="") {alert("Enter Monthly income");return false;}
                if(pswrd1=="") {alert("Enter Password");return false;}
                if(pswrd2=="") {alert("confirm Password");return false;}
               // if(pswrd1!=pswrd2) {alert("Password doesn't match");}
                
            }
        </script>
</head>
<body>

 <ul>
             <li style="float:left"><a href=""> &nbsp;&nbsp;&nbsp; E -Society  </a></li>
 <!--   <li style="float:right"><a href="http://localhost:8080/E-Society/MemberLogin.html"><i class="fa fa-sign-in"></i> login </a></li> -->
  
        </ul>
        
        
        <div style="margin: 0 auto;">
            <img src="green.png" alt="" width="180" height="180" style="padding-left:75px;">
            <form name="signin" onsubmit="validate()" action="SignupServ" method="post">
            <select name="persontype" id="persontype" style="height: 30px; width: 100%">
 			<option value="Member"> Member</option>
 			<option value="worker"> Worker</option>
 			</select>
 			<br><br>
        <br><input type="text" name="name" placeholder=" Name" style="width: 100%" required ><br>
        <br><input type="email" name="email" placeholder=" E-mail" style="width: 100%" required ><br>
        <br><input type="number" name="income" placeholder=" Monthly income" style="width: 100%" required><br>
        <br><input type="password" name="pswrd1" placeholder=" Password" style="width: 100%" required><br>
        <br><input type="password" name="pswrd2" placeholder=" Confirm Password" style="width: 100%" required><br>
     <br>   <%
String passwordstatus=(String)request.getAttribute("passwordstatus");
if(passwordstatus!=null){
	out.println("<font color=red size=4px>"+passwordstatus+"</font>");
}
%><br>
        <br><input type="submit" value="Sign up" style="vertical-align: middle; width: 100%; height: 70px;" class="button">
        <br></form>
            <br><br><label style="font-size: 20px;">Already have an account?<a href="http://localhost:8080/esociety/index.jsp"> <label style="font-size: 20px;">Log in</label></a></label>
        </div>
       <!--   <a href="http://localhost:8080/E-Society/WorkerSignup.html"><button class="button" style="vertical-align:bottom; width: 20%; float: right"> <i class="fa fa-user-plus"></i> Sign-up as worker</button></a> -->



</body>
</html>