<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://kit.fontawesome.com/9bff21277a.js"></script>
  <title>Update Staff Information Page</title>
</head>
<body>
    <%
    Class.forName("org.postgresql.Driver");
	String DB_CONNECTION = "jdbc:postgresql://ec2-44-206-197-71.compute-1.amazonaws.com/d5rq8o52eacr8k";
	String DB_USER = "snzyojrrgmxiog";
	String DB_PASSWORD ="f97a885181429218179ab9db94ff4fc6ab7ef611657375b7e35dad06697b711c";

	String id=(String)session.getAttribute("staffID");
    String sql= "SELECT * FROM staff WHERE staffID='"+ id +"'" ;
    Connection con=DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery(sql);
    while(rs.next())
    {
%>
	<section class="header"><!-- SIDEBAR -->
	        <div id="main">
	            <button class="openbtn" onclick="openNav()"><i class="fa fa-bars"></i></button>
	        </div>
	        <div id="Sidebar" class="sidebar">
				<a href="#" class="closebtn" onclick="closeNav()">x</a>
				<h1 class="ad">ADMIN</h1>
				<a href="Dashboard.jsp"><i class="fa-solid fa-magnifying-glass"></i>  DASHBOARD</a>
				<a href="categoryList.jsp"><i class="fa fa-tag"></i>   CATEGORY</a>
				<a href="productList.jsp"><i class="fas">&#xf49e;</i>   PRODUCT</a>
                <a href="staffInformation.jsp"><i class="fa-solid fa-user"></i>   PROFILE</a>
				<form method="get" action="StaffHandler" class="flg">
			        <input type="hidden" name="action" value="logoutStaff">
			        <button type="submit" class="lg"  value="LOGOUT" onclick="return confirm('Do you want to log out ?');"><i class="fa fa-right-from-bracket"></i>   LOG OUT</button>
			    </form>
			</div></section><!-- SIDEBAR -->
	
	<div id="myMain">
	<div class='center'>
	<div class="h">UPDATE STAFF INFORMATION</div>
      <form action="StaffHandler" name="myForm" method="post" onsubmit="return validation()">
      <input type="hidden" name="staffID" value='<%=rs.getString("staffID")%>'/>
      
      		<br>
            <label  for="staffName">FULL NAME: <span>*</span></label>
            <input type="text" name="staffName" class="forInput" value='<%=rs.getString("staffName") %>'>
            
            <br>
         	<label for="idno" >IDENTIFICATION NUMBER: <%=rs.getString("staffID")%></label>
			
			<br>
			<label for="phoneno">PHONE NUMBER: <span>*</span></label>
			<input type="text" name="staffPhone" class="forInput" value='<%=rs.getString("staffPhone") %>'>
			
			<br>
			<label for="address">ADDRESS: <span>*</span></label>
			<input type="text" name="staffAddress" class="forInput" value='<%=rs.getString("staffAddress") %>'>
			
			
			<br>
			<label for="city">CITY: <span>*</span></label>
			<input type="text" name="staffCity" class="forInput" value='<%=rs.getString("staffCity") %>'>
			
			<br>
			<label for="postcode">POSTCODE: <span>*</span></label>
			<input type="text" name="staffPostcode" class="forInput" value='<%=rs.getString("staffPostcode") %>'>
			
			<br>
			<label for="state">STATE: <span>*</span></label>
			<select name="staffState" id="staffState" class="forInput">
	          <option  selected hidden value="<%=rs.getString("staffState") %>"><%=rs.getString("staffState") %></option>
	          <option value="Johor">Johor</option>
	          <option value="Kedah">Kedah</option>
	          <option value="Kelantan">Kelantan</option>
	          <option value="Kuala Lumpur">Kuala Lumpur</option>
	          <option value="Melaka">Melaka</option>
	          <option value="Negeri Sembilan">Negeri Sembilan</option>
	          <option value="Pahang">Pahang</option>
	          <option value="Perak">Perak</option>
	          <option value="Perlis">Perlis</option>
	          <option value="Pulau Pinang">Pulau Pinang</option>
	          <option value="Sabah">Sabah</option>
	          <option value="Sarawak">Sarawak</option>
	          <option value="Selangor">Selangor</option>
	          <option value="Terengganu">Terengganu</option>
	     	</select>
            
            <br>
            <label for="email">EMAIL: <span>*</span></label>
            <input type="text" name="staffEmail" class="forInput" value='<%=rs.getString("staffEmail") %>'>
			
			<br>
			<label for="birthday">BIRTHDATE: <span>*</span></label>
			<input type="date" name="staffBirthDate" class="forInput" value='<%=rs.getString("staffBirthDate") %>'>

	  		<br>
			<label for="gender" class="gender">GENDER: <span>*</span></label>
			<select name="staffGender">
				  <option  selected hidden value="<%=rs.getString("staffGender") %>"><%=rs.getString("staffGender") %></option>
				  <option value="MALE">MALE</option>
				  <option value="FEMALE">FEMALE</option>
				</select>
			
			<br>
			<label for="MaritalStatus">MARITAL STATUS: <span>*</span></label>
			<select name="staffMaritalStatus" id="staffMaritalstatus">
	          <option  selected hidden value="<%=rs.getString("staffMaritalStatus")%>"><%=rs.getString("staffMaritalStatus")%></option>
	          <option value="Single">Single</option>
	          <option value="Married">Married</option>
	          <option value="Divorced">Divorced</option>
	          <option value="Widowed">Widowed</option>
	     	</select>
			
			<br>
			<label  for="race">RACE: <span>*</span></label>
			<input type="text" name="staffRace" class="forInput" value='<%=rs.getString("staffRace") %>'>
	  		
	  		<br>
	  		<label for="nationality">NATIONALITY: <span>*</span></label>
	  		<input type="text" name="staffNationality" class="forInput" value='<%=rs.getString("staffNationality") %>'>
           
            <br> 
	        <div class="respond">
            		<input type="hidden" name="action" value="updateStaff">
    				<button type="submit" class="btn" formaction="StaffHandler" onclick="return confirm('Are you sure you want to update?');">UPDATE</button><br>
        	</div>
        <%} %>
      </form>
    </div></div>
</body>
<style>
	body {
      position: relative;
      font: 1em Helvetica;
  	}
  
  * {
    margin: 0px;
  }
  
  .sidebar {
      height: 100%;
      width: 0;
      position: fixed;
      z-index: 1;
      top: 0;
      left: 0;
      background-color: #111;
      overflow-x: hidden;
      transition: 0.5s;
      padding-top: 60px;
   }
   
   span {
	color: red;
	font-weight: bold;
	font-size: 20px;
	}
    
  .ad {
      color: white;
      text-align: center;
      font-size: 35px;
      padding-bottom: 15px;
   }
  
  .sidebar a {
      padding: 10px 25px;
      text-decoration: none;
      font-size: 10px;
      display: block;
      transition: 0.3s;
      cursor: pointer;
      color: white;
      height: 30px;
   }
    
  .sidebar .closebtn {
      position: absolute;
      top: 0;
      right:50px;
   }
    
  .closebtn {
      width: 3px;
      border-radius: 200px;
      font-size: 40px;
      color: white;
  }
  
  .openbtn {
      font-size: 40px;
      cursor: pointer;
      background-color: #111;
      color: white;
      padding: 5px 10000px 5px 10px;
      border: none;
  }
  
  #main {
      transition: margin-left .5s;
  }
  
  #Sidebar a:link, a:visited {
      font-size: 30px;
      margin-left: 0px;
      text-decoration: none;
      display: absolute;
  }
  	
  #Sidebar a:nth-child(even) {
        background-color: white;
        color: black;
  }
  
  #Sidebar a:nth-child(odd) {
        background-color: black;
        color: white;
  }
    
  #Sidebar a:hover{
  		background-color: #404040;
  		color: white;
  }
  
  .h{
	font-size: 25px;
	font-weight: bold;
	color: #FFFFFF;
	padding: 10px;
	background: #000000;
	border-bottom: 1px solid #737373;
	border-radius: 5px 5px 5px 5px;
	text-align: center;
	}

.btn {
	background-color: #000000;
	color: white;
	padding: 12px;
	margin: 10px 10px;
	justify-item: center;
	border: none;
	width: 90px;
	height: 45px;
	border-radius: 3px;
	cursor: pointer;
	font-size: 17px;
	text-decoration:none;
	}
	
	.respond {
      position: absolute;
      right: 500px;
  }
  
.btn:hover {
	background-color: #959595;
	}
	
label {
	 margin-bottom: 2px;
	 display: block;
	 }

		
input[type=text], input[type=date], input[type=password], select, radio{
	 width: 100%;
	 margin-bottom: 25px;
	 padding: 10px;
	 border: 1px solid #ccc;
	 border-radius: 3px;
	 }

.center{
	float: right;
	width: 90%;
	height: 100%;
	padding: 30px 20px;
	background-color: white;
	border-radius: 5px 5px 5px 5px;
	min-height:500px;
	margin-left: 50px;
	margin-right: 50px;
	margin-top:20px;
	background :#FFFFFF;
	position :relative;
	text-align: justify;
	margin-bottom: 50px;
	}
	
	.lg {
	  padding-top: 10px;
	  padding-bottom: 15px;
	  padding-left: 22px;
	  padding-right: 75px;
	  text-decoration: none;
	  font-size: 30px;
	  display: absolute;
	  transition: 0.3s;
	  cursor: pointer;
	  color: white;
	  height: 60px;
	  margin-right: 0px;
	  background-color: black;
	  text-align: right;
	  font-family: 'Times New Roman', serif;
	}
	
	.flg {
	  margin-top: 230px;
	}
    
    #Sidebar button:hover{
  		background-color: #404040;
  		color: white;
  	}
</style>
<script>
    function openNav() {
      document.getElementById("Sidebar").style.width = "275px";
      document.getElementById("myMain").style.marginLeft = "275px";
    }
    
    function closeNav() {
      document.getElementById("Sidebar").style.width = "0";
      document.getElementById("myMain").style.marginLeft= "0";
    }
 </script>
</html>