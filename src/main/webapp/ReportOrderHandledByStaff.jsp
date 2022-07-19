<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/9bff21277a.js"></script>
        <title>Report Order Handled By Staff page</title>
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
                <a href="storeList.jsp"><i style='font-size:24px' class="fas">&#xf54f;</i>  STORE</a>
                <a href="productList.jsp"><i class="fas">&#xf49e;</i>   PRODUCT</a>
                <a href="orderList.jsp"><i class="fa-solid fa-cart-arrow-down"></i>   ORDER</a>
                <a href="ReportMainPage.jsp"><i class="fa-solid fa-chart-column"></i>   REPORT</a>
                <a href="staffInformation.jsp"><i class="fa-solid fa-user"></i>   PROFILE</a>
                <a href="MainPage.jsp" onclick="return confirm('Do you want to log out ?');"><i class="fa-solid fa-right-from-bracket"></i>   LOGOUT</a>

    		</div></section><!-- SIDEBAR -->
            <div id="myMain">
            <h2>Report Order Handled by Staff</h2><br><br><br>
            <span action="/action_page.php" class="search-container">
                <button type="submit" class="srcbtn"><i class="fa fa-search"></i></button>
                <input type="text" class="search" placeholder="Search.." name="search"></span><br>
            <label for="entries" class="entries">SHOW</label>
            <input type="number" class="entries1" id="entries" name="entries">
            <span class="symbol">&#8645;</span>
            <span class="entries">ENTRIES</span>
            <table id="store">
                <tr>
                  <th id="staffID">STAFF ID</th>
                  <th id="staffName">STAFF NAME</th>
                  <th id="totalOrder">TOTAL ORDER</th>
                  <th id="jan">JAN</th>
                  <th id="feb">FEB</th>
                  <th id="mac">MAC</th>
                  <th id="april">APRIL</th>
                  <th id="may">MAY</th>
                  <th id="june">JUNE</th>
                  <th id="july">JULY</th>
                  <th id="aug">AUG</th>
                  <th id="sept">SEPT</th>
                  <th id="oct">OCT</th>
                  <th id="nov">NOV</th>
                  <th id="dec">DEC</th>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
              </table></div>
            <div class="respond">
            	<input type="button" value="PRINT" class="btn" onclick="printPage()"/>
        	</div>
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
	
	table, td, th {
	    border: 2px solid white;
	    padding: 5px;
	    word-wrap: break-word;
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
    
    function printPage() 
    {
        window.print();
    }

</script>
</html>