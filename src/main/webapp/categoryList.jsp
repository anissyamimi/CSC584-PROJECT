<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/9bff21277a.js"></script>
        <title>List of category page</title>
    </head>
        <body>
        <sql:setDataSource var="ic" driver="org.postgresql.Driver"
                   url="jdbc:postgresql://ec2-44-206-197-71.compute-1.amazonaws.com/d5rq8o52eacr8k"
                   user = "snzyojrrgmxiog"
                   password="f97a885181429218179ab9db94ff4fc6ab7ef611657375b7e35dad06697b711c"/>
		
		<sql:query dataSource="${ic}" var="oc">
		    SELECT categoryID,categoryName,categoryStatus from Category where categoryID>0
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
                <a href="MainPage.jsp" onclick="return confirm('Do you want to log out ?');"><i class="fa-solid fa-right-from-bracket"></i>   LOGOUT</a>

            </div></section><!-- SIDEBAR -->
    <div id="myMain">
        <h2>CATEGORY</h2><br>
            <a href="createCategory.jsp" class="btn">CREATE CATEGORY</a><br><br>
            <span action="/action_page.php" class="search-container">
                <button type="submit" class="srcbtn"><i class="fa fa-search"></i></button>
                <input type="text" class="search" placeholder="Search.." name="search"></span><br>
            <label for="entries" class="entries">SHOW</label>
            <input type="number" class="entries1" id="entries" name="entries">
            <span class="symbol">&#8645;</span>
            <span class="entries">ENTRIES</span>
            
            <div style="overflow-x:auto;">
            <table id="store" style="text-align: center;">
                <tr>
                  <th onclick="sortTable(0)" id="categoryID">CATEGORY ID <img src="filterW.png"></th>
                  <th onclick="sortTable(1)" id="categoryName">CATEGORY NAME <img src="filterW.png"></th>
                  <th onclick="sortTable(2)" id="categoryStatus">CATEGORY STATUS <img src="filterW.png"></th>
                  <th>ACTION <img src="filterW.png"></th>
                </tr>
                
                <c:forEach var="result" items="${oc.rows}">
                <tr>
                  <td class="categoryID"><c:out value="${result.categoryID}"/></td>
                  <td class="categoryName"><c:out value="${result.categoryName}"/></td>
                  <td class="categoryStatus"><c:out value="${result.categoryStatus}"/></td>
                  
                  <td>
					<form method="post">
						<button  class="action" type="update" formaction="updateCategory.jsp?id=${result.categoryID}">&#128393;
						</button>
					</form>
					<form method="post">
						<input type="hidden" name="categoryID" value="${result.categoryID}">
						<input type="hidden" name="action" value="deleteCategory">
						<button  class="action" type="delete" formaction="CategoryHandler" onclick="return confirm('Are you sure you want to delete?')">&#128465;</button>
					</form>
				</td>
                </tr>
                </c:forEach>
              </table>
              <br>
              <div class="respond">
                <span class="info">SHOWING 1 TO 3 ENTRIES</span>
                <a href="#" class="btnB">PREVIOUS</a>
                <a href="#" class="btnB1">1</a>
                <!--<a href="#" class="btnB">2</a></button>
                <a href="#" class="btnB">3</a></button> 
                if lebih dari satu page/ data banyak -->
                <a href="#" class="btnB">NEXT</a>
            </div></div>
        </body>
<style>
	body {
	    position: relative;
	}
	
	h2 {
	    margin-top: 40px;
	    margin-left: 20px;
	    font-size: 40px;
	}
	
	.btn {
	    color: white;
	    background-color: black;
	    border-radius: 25px;
	    padding: 15px 10px;
	    text-align: center;
	    cursor: pointer;
	    text-decoration: none;
	    margin-left: 20px;
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
	
	table, td, th {
	    border: 2px solid white;
	    padding: 5px;
	}
	
	table {
	    width: 100%;
	    border-collapse: collapse;
	    max-width: 1000px;
	    margin-top: 35px;
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
	
	img {
	    width: 20px;
	    display: inline;
	    margin-left: 13px;
	    margin-right: 0px;
	    float: right;
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
	
	.popup .overlay {
	    position: fixed;
	    top: 0px;
	    left: 0px;
	    width: 100vw;
	    height: 100vh;
	    background: white;
	    z-index: 1;
	    display: none;
	}
	
	.popup .content {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%,-50%) scale(0);
	    background: white;
	    width: 400px;
	    height: 200px;
	    z-index: 2;
	    padding: 20px;
	    box-sizing: border-box;
	    border-radius: 25px;
	    border: 2px solid black;
	}
	
	.popup .close-btn {
	    position: absolute;
	    right: 20px;
	    top: 20px;
	    width: 30px;
	    background-color: black;
	    color: white;
	    font-size: 25px;
	    font-weight: 600;
	    line-height: 30px;
	    text-align: center;
	    border-radius: 50%;
	    cursor: pointer;
	}
	
	.popup.active .content {
	    display: block;
	}
	
	.popup.active .content {
	    transition: all 100ms ease-in-out;
	    transform: translate(-50%,-50%) scale(1);
	}
	
	h4 {
	    margin-top: 70px;
	    position: inline;
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
	  padding: 5px 10000px 5px 10px;
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

</style>
<script>
    function togglePopup() {
        document.getElementById("popup").classList.toggle("active");
    }

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