<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/9bff21277a.js"></script>
    <title>dashboard page</title>
</head>
<body>
        <sql:setDataSource 
       			   var="ic" 
       			   driver="org.postgresql.Driver"
                   url="jdbc:postgresql://ec2-44-206-197-71.compute-1.amazonaws.com/d5rq8o52eacr8k"
                   user = "snzyojrrgmxiog"
                   password="f97a885181429218179ab9db94ff4fc6ab7ef611657375b7e35dad06697b711c"
         />
		
		<sql:query dataSource="${ic}" var="oc">
		    SELECT COUNT (productID) FROM product
		</sql:query>
		<sql:query dataSource="${ic}" var="oc2">
 			SELECT COUNT (categoryID) FROM category
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
        <a href="staffInformation.jsp"><i class="fa-solid fa-user"></i>   PROFILE</a>
        <form method="get" action="StaffHandler" class="flg">
		        <input type="hidden" name="action" value="logoutStaff">
		        <button type="submit" class="lg"  value="LOGOUT" onclick="return confirm('Do you want to log out ?');"><i class="fa fa-right-from-bracket"></i>   LOG OUT</button>
		</form>
        
    </div>
    </section><!-- SIDEBAR -->
	<div id="myMain">
	    <table style="width:100%">
	        <tr class="dash">
	        <c:forEach var="result" items="${oc.rows}">
	            <td><c:out value="${result.count}"/><img src= "laptop.png" alt="shoe icon"><br>
	                <p>TOTAL PRODUCT</p></td>
            </c:forEach>
            <c:forEach var="result" items="${oc2.rows}">
	            <td><c:out value="${result.count}"/><img src= "statistic.png" alt="statistic icon"><br>
	                <p>TOTAL CATEGORY</p></td>
             </c:forEach>
	        </tr>
	        <tr class="more">
	            <td>MORE INFO<a href="productList.jsp">&#10142;</a></td>
	            <td>MORE INFO<a href="categoryList.jsp">&#10142;</a></td>
	        </tr>
	    </table>
	</div>
</body>

<style>

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
        right: 50px;
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
        padding: 5px 1320px 5px 10px;
        border: none;
    }

    .openbtn:hover {
        background-color: #444;
    }

    #main {
        transition: margin-left .5s;
    }

    p {
        font-size: 18px;
        text-align: center;
        margin-top: 3px;
        margin-bottom: 10px;
        font-weight: bold;
    }

    .more {
        font-size: 16px;
        text-align: center;
        font-weight: bold;
        color: black;
    }

    .more a {
        color: black;
        padding-left: 10px;
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

    th, td {
        border: solid black;

    }

    table {
        max-width: 800px;
        margin-top: 50px;
        margin-left: auto;
        margin-right: auto;
        border-spacing: 40px 0px;
    }

    .dash {
        font-size: 65px;
    }

    img {
        width: 45%;
        padding-left: 50px;
        padding-right: auto;
        padding-top: 10px;
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