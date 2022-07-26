<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/9bff21277a.js"></script>
        <title>create category page</title>
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
        <h2>CREATE CATEGORY</h2>
        <form id="create" method="post" action="CategoryHandler">
            <label for="categoryName">Category Name</label>
            <input type="text" id="categoryName" name="categoryName"><br>
            
            <label for="status" class="status">Status</label>
            
            <input type="checkbox" id="status1" name="categoryStatus" value="ACTIVE">
            <label for="status1"><span class="status1">&#9679;</span>ACTIVE</label>
            
            <input type="checkbox" id="status2" name="categoryStatus" value="INACTIVE">
            <label for="status2"><span class="status2">&#9679;</span>INACTIVE</label>
        
        <div class="respond">
        	<button class="btn">BACK</button>
        	
			<input type="hidden" name="action" value="createCategory">
    		<button type="submit" class="btn" name="submit" formaction="CategoryHandler">CREATE CATEGORY</button><br><br>
        </div>
        </form>
        </div>
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
      margin-right: 145px;
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
      padding-left: 0;
  } 
  
  input[type=text]:focus {
      border: 2px solid rgb(160, 154, 154);
  }
 
  .status1 {
      color: rgb(20, 190, 20);
      font-size: 28px;
      padding-right: 5px;
  }
  
  .status2 {
      color: red;
      font-size: 28px;
      padding-right: 5px;
  }
  
  #status2 {
  	  margin-left: 80px;
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