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
        <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/9bff21277a.js"></script>
        <title>update category page</title>
    </head>
    <body>
    <%
    Class.forName("org.postgresql.Driver");
	String DB_CONNECTION = "jdbc:postgresql://ec2-44-206-197-71.compute-1.amazonaws.com/d5rq8o52eacr8k";
	String DB_USER = "snzyojrrgmxiog";
	String DB_PASSWORD ="f97a885181429218179ab9db94ff4fc6ab7ef611657375b7e35dad06697b711c";

	String id=request.getParameter("id");
    String sql= "SELECT * FROM category WHERE categoryID='"+ id +"'" ;
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
            <a href="MainPage.jsp" onclick="return confirm('Do you want to log out ?');"><i class="fa-solid fa-right-from-bracket"></i>   LOGOUT</a>
        </div>
      </section><!-- SIDEBAR -->
        
		<div id="myMain">
	        <h2>UPDATE CATEGORY</h2>
	        <form id="create" action="" method="post" action="CategoryHandler">
	        	<input type="hidden" name="categoryID" value='<%=rs.getString("categoryID") %>'/>
	    
	            <label for="categoryName">Category Name</label>
	            <input type="text" id="categoryName" name="categoryName" value='<%=rs.getString("categoryName") %>'><br>
	            
	            <label for="status" class="status">Status</label>
	            <select name="categoryStatus">
				  <option  selected disabled hidden><%=rs.getString("categoryStatus") %></option>
				  <option value="ACTIVE">ACTIVE</option>
				  <option value="INACTIVE">INACTIVE</option>
				</select>
		        <div class="respond">
		            <button class="btn">BACK</button>
		            <input type="hidden" name="action" value="updateCategory">
		            <button class="btn" type="submit" formaction="CategoryHandler" onclick="return confirm('Are you sure you want to update?');">UPDATE CATEGORY</button>
		        </div>
	        </form>
	    </div>
	    <%} %>
    </body>
    
<style>
  body {
      position: relative;
  }
  
  h2 {
      margin-top: 40px;
      margin-left: 10px;
      font-size: 30px;
  }
  
  label {
      font-size: 20px;
      font-weight: bold;
      margin-left: 50px;
  }
  
  .status {
      margin-right: 115px;
  }
  
  input[type=text] {
      width: 50%;
      padding: 10px 20px;
      margin: 15px 65px;
      box-sizing: border-box;
      border: 2px solid black;
      border-radius: 4px;
      -webkit-transition: 0.2s;
      transition: 0.2s;
      outline: none;
      text-transform: uppercase;
  }
  
  input[type=checkbox] {
      margin-top: 15px;
      margin-left: 0px;
  } 
  
  input[type=text]:focus {
      border: 2px solid rgb(160, 154, 154);
  }
  
  .space {
      margin-left: 25px;
  }
  
  .status1 {
      color: rgb(20, 190, 20);
      font-size: 28px;
      margin-right: 10px;
  }
  
  .status2 {
      color: red;
      font-size: 28px;
      margin-right: 10px;
  }
  
  .btn {
      display: inline;
      color: white;
      background-color: black;
      border-radius: 25px;
      padding: 15px 10px;
      text-align: center;
      cursor: pointer;
      margin-left: 10px;
  }
  
  .respond {
      position: absolute;
      top: 500px;
      right: 20px;
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
  
  a:link, a:visited {
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