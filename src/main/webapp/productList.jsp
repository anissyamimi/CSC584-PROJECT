<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
       
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/9bff21277a.js"></script>
    <title>List of products page</title>
</head>
<body>

       
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
<div id="myMain">
    <h2>PRODUCT LIST</h2><br>
    <a href="createProduct.jsp" class="btn">CREATE PRODUCT</a><br><br>


    <table id="store">
        <tr>
            <th id="prodID">PRODUCT ID </th>
            <th id="prodName">PRODUCT NAME </th>
            <th id="prodPrice">PRICE PER UNIT </th>
            <th id="prodColor">COLOR </th>
            <th id="prodQuantity">QUANTITY </th>
	        <th id="prodCategory">CATEGORY </th>
            <th id="prodAvail">AVAILABILITY </th>
            <th id="storeName">STORE NAME </th>

            <th id="action">ACTION </th>
        </tr>
        
        
       <%
        String DB_DRIVER = "org.postgresql.Driver";
   		String DB_CONNECTION = "jdbc:postgresql://ec2-44-206-197-71.compute-1.amazonaws.com/d5rq8o52eacr8k";
   	    String DB_USER = "snzyojrrgmxiog";
   	    String DB_PASSWORD = "f97a885181429218179ab9db94ff4fc6ab7ef611657375b7e35dad06697b711c";

       Connection con = null;
       Statement stat = null;
       ResultSet res = null;
       
       Class.forName(DB_DRIVER);
       con = DriverManager.getConnection(DB_CONNECTION,DB_USER,DB_PASSWORD);
       stat = con.createStatement();
       String data = "select * from product join category using (categoryid) join store using (storeid)";
       res = stat.executeQuery(data);
       while(res.next()){
       %>
       
        <tr id="myUL">
            <td><a href="prodDetails.jsp?id=<%=res.getString("productid")%>"><%=res.getString("productid")%></a></td>
            <td><%=res.getString("productname")%></td>
            <td>RM<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value='<%=res.getFloat("productprice")%>'/></td>
            <td><%=res.getString("productcolor")%></td>
            <td><%=res.getString("productquantity")%></td>
            <td><%=res.getString("categoryname")%></td>
            <td><%=res.getString("productavailability")%></td>
            <td><%=res.getString("storename")%></td>
            <td class="action">
            <a href="updateProduct.jsp?id=<%=res.getString("productid")%>">&#128393;</a> 
            <form action="ProductHandler" method="post">
            <input type="hidden" name="productid" value="<%=res.getString("productid")%>">
            <input type="hidden" name="action" value="deleteProduct">
            <button class="action1" onclick="return confirm('Are you sure you want to delete?');">&#128465;</button>
     		</form>
         
            </td>
        </tr>
       <% 
       }
       %>  

    </table>
</div>
</body>
<style>
    body {
        position: relative;
    }

    h2 {
        text-align: center;
        font-size: 40px;
        margin-top: 30px;
        margin-bottom: 10px;
    }

    .btn {
        color: white;
        background-color: black;
        border-radius: 25px;
        padding: 15px 10px;
        text-align: center;
        cursor: pointer;
        text-decoration: none;
        float: right;
	    margin-right: 30px;
    }
    
    .btn:hover {
    	background-color: #404040;
		box-shadow: 14px 4px 15px 8px rgba(0,0,0,0.99);
    }

    .search-container {
        float: right;
        padding: 6px 10px;
        margin-top: 8px;
        margin-right: 30px;
        border: none;
    }

    .search {
        height: 23px;
    }

    .srcbtn {
        cursor: pointer;
        background-color: white;
        border: none;
        font-size: 22px;
    }

    label {
        margin-left: 35px;
    }

    .entries{
        font-weight: bold;
        font-size: 18px;
    }

    .entries1 {
        width: 35px;
        border: 2px solid black;
    }

    .symbol {
        font-size: 20px;
        font-weight: bold;
        margin-left: 3px;
        cursor: pointer;
    }

    table, td, th {
        border: 2px solid white;
        padding: 5px;
        word-wrap: break-word;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        max-width: 1100px;
        margin-top: 35px;
        margin-left: auto;
        margin-right: auto;
    }
    
    td {
    	text-align: left;
    	padding-left: 25px;
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

    img {
        width: 20px;
        display: inline;
        margin-left: 13px;
        margin-right: 0px;
        float: right;
    }

    .btnB {
        display: inline;
        border: 2px solid black;
        padding: 10px 5px;
        text-align: center;
        cursor: pointer;
        margin-left: 0px;
        text-decoration: none;
        color: black;
        font-size: 10px;
        font-weight: bold;
    }

    .btnB1 {
        display: inline;
        background-color: black;
        padding: 12px 9px;
        text-align: center;
        cursor: pointer;
        margin-left: 0px;
        text-decoration: none;
        color: white;
        font-weight: bold;
    }

    .respond a:link {
        font-size: 15px;
    }

    .respond {
        position: absolute;
        top: 550px;
        right: 20px;
    }

    .info {
        float: left;
        margin-right: 50px;
    }

    .action {
        font-weight: 900;
        font-size: 25px;
        text-align: center;
        cursor: pointer;
        text-decoration: none;
    }

    .action a {
        text-decoration: none;
        color: black;
    }

    .action1 {
        font-weight: 900;
        font-size: 25px;
        text-align: center;
        cursor: pointer;
        border: none;
        background-color: transparent;
    }

    .symbol1 {
        font-size: 50px;
        float: left;
        margin-left: 30px;
        position: inline;
        margin-top: 45px;
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

    .openbtn:hover {
        background-color: #444;
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
    

</script>
</html>