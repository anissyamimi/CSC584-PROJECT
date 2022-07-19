<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://kit.fontawesome.com/9bff21277a.js"></script>
  <title>Create Order Page</title>
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
		<form>
			<h2>CREATE ORDER</h2>
			<label for="custName">Customer Name :</label>
			<input type= "text" name = "custName" id="custName"><br>
			<label for="custIC">Identification Number :</label>
			<input type= "number" name = "custIC" id="custIC"><br>
			<label for="custPhone">Phone Number :</label> 
			<input type= "number" name = "custPhone" id="custPhone"><br>
			<label for="custAddress">Address :</label>
			<input type= "text" name = "custAddress" id="custAddress"><br>
			<div class="short">
			<label for="state" id="state">State: </label>
			<select name="state" id="state">
			<option value="Johor" id="state">Johor</option>
			<option value="Kedah" id="state">Kedah</option>
			<option value="Kelantan" id="state">Kelantan</option>
			<option value="Melaka" id="state">Melaka</option>
			<option value="Negeri Sembilan" id="state">Negeri Sembilan</option>
			<option value="Pahang" id="state">Pahang</option>
			<option value="Penang" id="state">Penang</option>
			<option value="Perak" id="state">Perak</option>
			<option value="Perlis" id="state">Perlis</option>
			<option value="Sabah" id="state">Sabah</option>
			<option value="Sarawak" id="state">Sarawak</option>
			<option value="Selangor" id="state">Selangor</option>
			<option value="Terengganu" id="state">Terengganu</option>
			<option value="Kuala Lumpur" id="state">Kuala Lumpur</option>
			<option value="Labuan" id="state">Labuan</option>
			<option value="Putrajaya" id="state">Putrajaya</option>
			</select>
			<label for="custPostcode">Postcode :</label> 
			<input type= "number" name = "custPostcode" id="custPostcode"><br>
			</div>
			<label for="custEmail">Email Address :</label> 
			<input type= "email" name = "custEmail" id="custEmail"><br>
			<table id="store">
			    <tr>
			      <th>PRODUCT ID</th>
			      <th>PRODUCT NAME</th>
			      <th>PRODUCT COLOR</th>
			      <th>PRODUCT QUANTITY</th>
			      <th>SUBTOTAL</th>
			    </tr>
			    <tr class="tbl">
			      <td><input type= "text" name = "prodID" id="prodID"></td>
			      <td><input type= "text" name = "prodName" id="prodName"></td>
			      <td><input type= "text" name = "prodColor" id="prodColor"></td>
			      <td><input type= "number" name = "prodQuantity" id="prodQuantity"></td>
			      <td><input type= "number" name = "prodPrice" id="prodPrice"></td>
			    </tr>
			    <tr class="tbl">
			      <td><input type= "text" name = "prodID" id="prodID"></td>
			      <td><input type= "text" name = "prodName" id="prodName"></td>
			      <td><input type= "text" name = "prodColor" id="prodColor"></td>
			      <td><input type= "number" name = "prodQuantity" id="prodQuantity"></td>
			      <td><input type= "number" name = "prodPrice" id="prodPrice"></td>
			    </tr>
			    <tr class="tbl">
			      <td><input type= "text" name = "prodID" id="prodID"></td>
			      <td><input type= "text" name = "prodName" id="prodName"></td>
			      <td><input type= "text" name = "prodColor" id="prodColor"></td>
			      <td><input type= "number" name = "prodQuantity" id="prodQuantity"></td>
			      <td><input type= "number" name = "prodPrice" id="prodPrice"></td>
			    </tr>
			  </table>
			  <br>
			<div class="total">
				<label for="grossTotal">Gross Total (RM)</label>
				<input type= "text" name = "grossTotal" id="grossTotal"><br>
				<label for="tax">Tax (%)</label> 
				<input type= "text" name = "tax" id="tax"><br>
				<label for="discount">Discount (%)</label>
				<input type= "text" name = "discount" id="discount"><br>
				<label for="netPrice">Net Price (RM)</label> 
				<input type= "text" name = "netPrice" id="netPrice">
			</div>
			<div class="respond">
            	<a href="#" class="btn">BACK</a>
            	<a class="btn">CREATE ORDER</a>
        	</div>
			
		</form></div>
</body>
<style>
	body {
      position: relative;
  	}
  
  	h2 {
      margin-top: 40px;
      margin-left: 30px;
      font-size: 30px;
  	}
  
  	label {
      font-size: 20px;
      font-weight: bold;
      margin-left: 80px;
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
	    max-width: 800px;
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
	
	input[type=text], input[type=number], input[type=email] {
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
      top: 800px;
      right: 20px;
  }
  
  .respond a {
  	  text-decoration: none;
  	  font-size: 20px;
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
  
  .total {
  		float: right;
  		margin-right: 220px
  }
  
  .total input[type=text] {
  	    width: 30%;
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
  
  .total label {
	    font-size: 20px;
	    font-weight: bold;
	    margin-left: 15px;
	    margin-top: 15px;
	    display: inline-block;
	    width: 200px;
  	}
  	
  	.short input[type=number], select {
  	    width: 12.8%;
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
  
  	.short label {
	    font-size: 20px;
	    font-weight: bold;
	    margin-left: 80px;
	    margin-top: 15px;
	    display: inline-block;
	    width: 240px;
  	}	
  	
  	.tbl input[type=text], .tbl input[type=number] {
  		width: 100%;
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