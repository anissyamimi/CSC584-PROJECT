<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/9bff21277a.js"></script>
        <title>Main report page</title>
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
                <table style="width:100%">
                  <tr class="dash">
                    <td><img src= "reportpage1.png" alt="stock product icon"><br></td>
                    <td><img src= "reportpage2.png" alt="sales and profit icon"><br></td> 
                    <td><img src= "reportpage3.png" alt="Order handled By Staff icon"><br></td>
                  </tr>
                  <tr class="more">
                    <td>MORE INFO<a href="ReportTotalSalesAndProfit.jsp">&#10142;</a></td>
                    <td>MORE INFO<a href="ReportProductStockLeft.jsp">&#10142;</a></td>
                    <td>MORE INFO<a href="ReportOrderHandledByStaff.jsp">&#10142;</a></td>
                  </tr>
              </table></div>
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
    padding: 5px 10000px 5px 10px;
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
    width: 80%;
    padding-left: 20px;
    padding-right: 20px;
    padding-top: 10px;
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