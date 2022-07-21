<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/9bff21277a.js"></script>
        <title>Product details page</title>
    </head>
    <body>
    
       <sql:setDataSource var="ic" driver="org.postgresql.Driver"
          url="jdbc:postgresql://ec2-44-206-197-71.compute-1.amazonaws.com/d5rq8o52eacr8k"
          user = "snzyojrrgmxiog"
          password="f97a885181429218179ab9db94ff4fc6ab7ef611657375b7e35dad06697b711c"/>
			
		<sql:query dataSource="${ic}" var="oc">
		    SELECT * from category
		</sql:query>

		
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
            <a href="storeList.jsp"><i style='font-size:24px' class="fas">&#xf54f;</i>  STORE</a>
            <a href="staffInformation.jsp"><i class="fa-solid fa-user"></i>   PROFILE</a>
            <form method="get" action="StaffHandler" class="flg">
		        <input type="hidden" name="action" value="logoutStaff">
		        <button type="submit" class="lg"  value="LOGOUT" onclick="return confirm('Do you want to log out ?');"><i class="fa fa-right-from-bracket"></i>   LOG OUT</button>
		    </form>
        </div></section><!-- SIDEBAR -->
        
       <%
    		String DB_DRIVER = "org.postgresql.Driver";
        	String DB_CONNECTION = "jdbc:postgresql://ec2-44-206-197-71.compute-1.amazonaws.com/d5rq8o52eacr8k";
    	    String DB_USER = "snzyojrrgmxiog";
    	    String DB_PASSWORD = "f97a885181429218179ab9db94ff4fc6ab7ef611657375b7e35dad06697b711c";

       Connection conn = null;
       Statement stat = null;
       ResultSet res = null;
       PreparedStatement stmt = null;
       Class.forName(DB_DRIVER).newInstance();
       conn = DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);
       %>
		<div id="myMain">
        <h2>PRODUCT DETAILS</h2>
       <%
       stat = conn.createStatement();
       String u = request.getParameter("id");
       String data = "select * from product join category using (categoryid) where productid='"+u+"'";
       res = stat.executeQuery(data);
       while(res.next()){
       %>

			<input type="hidden" name="id" value="<%=res.getInt("productid")%>" disabled>
            <label for="prodName">Product Name</label>
            <%=res.getString("productname")%> <br>
            <label for="prodPrice" id="prodPrice">Product Price</label>
			RM<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value='<%=res.getFloat("productprice")%>'/><br>         
			<label for="prodColor">Product Color </label>
            <%=res.getString("productcolor")%><br>
            <label for="prodQuantity">Product Quantity </label>
            <%=res.getInt("productquantity")%><br>
            <label for="available">Product Availability:</label>
            <%=res.getString("productavailability")%><br>
            <label for="category">Product Category:</label>
            <%=res.getString("categoryname")%><br>

			<div class="respond">
            	<button class="btn" onclick="window.location.href='productList.jsp';">BACK</button>
            </div>
       </div>
        
           	<%
            }
   			%>
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
      margin-left: 30px;
      margin-top: 15px;
      display: inline-block;
      width: 240px;
  }
  
  table, td, th {
	    border: 2px solid white;
	    padding: 5px;
	}
	
	table {
	    width: 100%;
	    border-collapse: collapse;
	    max-width: 500px;
	    margin-top: 10px;
	    margin-left: auto;
	    margin-right: auto;
	}
	
	#store tr:nth-child(even) {
	    background-color: #a7a7a7;
	}
	
	#store tr:nth-child(odd) {
	    background-color: #dfdddd;
	}
	
	#store th {
	  padding-top: 12px;
	  padding-bottom: 12px;
	  text-align: center;
	  background-color: black;
	  color: white;
	}
	
	input[type=text], select {
	     width: 50%;
	     padding: 5px 5px;
	     box-sizing: border-box;
	     border: 2px solid black;
	     border-radius: 4px;
	     -webkit-transition: 0.2s;
	     transition: 0.2s;
	     outline: none;
	     text-transform: uppercase;
	     background-color: #dfdddd;
	 } 
  
  input[type=text]:focus {
      border: 2px solid rgb(160, 154, 154);
  }
  
  .space {
      margin-left: 25px;
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
      right: 50px;
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
	  padding: 5px 1235px 5px 10px;
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
  
  .add {
  		border-radius: 50%;
  		color: white;
  		font-size: 15px;
  		background-color: black;
  		position: absolute;
  		right: 400px;
  }
  
  .add2 {
  		border-radius: 50%;
  		color: white;
  		font-size: 15px;
  		background-color: black;
  		position: absolute;
  		right: 370px;
  }
  
  .lg {
	  padding-top: 10px;
	  padding-bottom: 15px;
	  padding-left: 22px;
	  padding-right: 80px;
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
	  border:none;
	}
	
	.flg {
	  margin-top: 160px;
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

      function myDeleteFunction() {
    	  document.getElementById("store").deleteRow(0);
    	}
      
</script>   
</html>