<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/9bff21277a.js" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Registration</title>
</head>
<body>
	<div id="myMain">
	<div class='center'>
	<div class="header">STAFF INFORMATION</div>
      <form name="myForm" action="StaffHandler" method="post" onsubmit="return validation()">
      		<br>
            <label  for="staffName">Full Name <span>*</span></label>
            <input type="text" name="staffName" placeholder="Enter your full name">
            
            <br><br>
         	<label for="idno">Identification Number <span>*</span></label>
			<input type="text" name="staffID" id="staffID" placeholder="Enter your mykad identification number (without -)">
			
			<br><br>
			<label for="phoneno">Phone Number <span>*</span></label>
			<input type="text" name="staffPhone" id="staffPhone" placeholder="Enter your phone number (without -)">
			
			<br><br>
			<label for="address">Address <span>*</span></label>
			<input type="text" name="staffAddress" class="forInput" id="staffAddress" placeholder="Enter your address">
			
			<br><br>
			<label for="city">City <span>*</span></label>
			<input type="text" name="staffCity" id="staffCity" placeholder="Enter your city">
			
			<br><br>
			<label for="postcode">Postcode <span>*</span></label>
			<input type="text" name="staffPostcode" id="staffPostcode" placeholder="Enter your postcode">
			
			<label for="state">State <span>*</span></label>
	      	<select name="staffState" id="staffState" class="forInput">
	          <option value="">--State--</option>
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
            <label for="email">Email <span>*</span></label>
            <input type="text" name="staffEmail" placeholder="Enter your email">
			
			<br><br>
			<label for="birthday">Birth Date <span>*</span></label>
	  		<input type="date" id="staffBirthDate" name="staffBirthDate">
	  		
	  		<br><br>
			<label for="gender" class="staffGender">Gender <span>*</span></label>
			<input type="radio" name="staffGender" id="male" value="Male">Male
			<input type="radio" name="staffGender" id="female" value="Female" >Female
			
			<br><br><br>
			<label for="MaritalStatus">Marital Status <span>*</span></label>
	      	<select name="staffMaritalstatus" id="staffMaritalstatus">
	          <option>--Marital Status--</option>
	          <option value="Single">Single</option>
	          <option value="Married">Married</option>
	          <option value="Divorced">Divorced</option>
	          <option value="Widowed">Widowed</option>
	     	</select>
			
			<br>
			<label  for="race">Race <span>*</span></label>
	  		<input type="text" id="stafface" name="staffRace" placeholder="Enter your race">
	  		
	  		<br><br>
	  		<label for="nationality">Nationality <span>*</span></label>
	  		<input type="text" id="staffNationality" name="staffNationality" placeholder="Enter your nationality">
	  		
	  		<label for="nationality">Password <span>*</span></label>
	  		<input type="password" id="psw1" name="staffPassword" placeholder= "Enter Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
			   title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
			   
			<label for="nationality">Re-enter Password <span>*</span></label>
			<input type="password" id="psw2" name="password" placeholder= "Re-Enter Password" required>
           
            <input type="hidden" name="action" value="createStaff">
         	<button type="submit" class="btn" name="submit" formaction="StaffHandler" onclick="matchPassword()" >REGISTER</button><br><br>
      </form>
    </div></div>
</body>
<style>

body{
	background-color: #000000;
	font: 1em Helvetica;}
  
.header{
	font-size: 25px;
	font-weight: bold;
	color: #FFFFFF;
	padding: 10px;
	background: #000000;
	border-bottom: 1px solid #737373;
	border-radius: 5px 5px 5px 5px;
	text-align: center;
	}
	
span {
	color: red;
	font-weight: bold;
	font-size: 20px;
	}

.btn {
	background-color: #000000;
	color: white;
	padding: 12px;
	margin: 10px 0;
	border: none;
	width: 100%;
	border-radius: 3px;
	cursor: pointer;
	font-size: 17px;
	}
	
.btn:hover {
	background-color: #959595;
	}
	
label {
	 margin-bottom: 2px;
	 display: block;
	 }
		
input[type=text], input[type=date], input[type=password], radio{
	 width: 98%;
	 margin-bottom: 25px;
	 padding: 10px;
	 border: 1px solid #ccc;
	 border-radius: 3px;
	 text-transform: uppercase;
	 }
	 
select {
	 width: 100%;
	 margin-bottom: 25px;
	 padding: 10px;
	 border: 1px solid #ccc;
	 border-radius: 3px;
	 text-transform: uppercase;
}
	 
#male {
	 margin-right: 10px; 
	 }
	 
#female {
	margin-right: 10px;
	margin-left: 25px;
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

* {
  	margin: 0px;
	}
</style>
<script>

function validation(){
	 var ans1 = document.forms["myForm"]["name"].value;
	 var ans2 = document.forms["myForm"]["idno"].value;
	 var ans3 = document.forms["myForm"]["phoneno"].value;
	 var ans4 = document.forms["myForm"]["address"].value;
	 var ans5 = document.forms["myForm"]["city"].value;
	 var ans6 = document.forms["myForm"]["postcode"].value;
	 var ans7 = document.forms["myForm"]["email"].value;
	 var ans8 = document.forms["myForm"]["race"].value;
	 var ans9 = document.forms["myForm"]["nationality"].value;
	 var ans10 = document.forms["myForm"]["religion"].value;
	
	 if(ans1 == ""|| ans1 == null){
	   alert("Form must be filled in");
	   return false;}
	
	 if(ans2 == "" || ans2 == null){
	   alert("Form must be filled in");
	   return false;}
	
	 if(ans3 == ""|| ans3 == null){
	   alert("Form must be filled in");
	   return false;}
	
	 if(ans4 == "" || ans4 == null){
	   alert("Form must be filled in");
	   return false;}
	
	 if(ans5 == "" || ans5 == null){
	   alert("Form must be filled in");
	   return false;}
	
	 if(ans6 == "" || ans6 == null){
	   alert("Form must be filled in");
	   return false;}
	
	 if(ans7 == "" || ans7 == null){
	   alert("Form must be filled in");
	   return false;}
	
	 if(ans8 == "" || ans8 == null){
	   alert("Form must be filled in");
	   return false;}
	 
	 if(ans9 == "" || ans9 == null){
	    alert("Form must be filled in");
	    return false;}
	 
	 if(ans10 == "" || ans10 == null){
	    alert("Form must be filled in");
	    return false;}
}

function openNav() {
      document.getElementById("Sidebar").style.width = "275px";
      document.getElementById("myMain").style.marginLeft = "275px";
    }
    
    function closeNav() {
      document.getElementById("Sidebar").style.width = "0";
      document.getElementById("myMain").style.marginLeft= "0";
    }
	function matchPassword(){
		  var psw1 = document.getElementById("staffPassword");
		  var psw2 = document.getElementById("password");
		  if(psw1 != psw2){
		  	alert("Passwords did not match");
		  	return false;}
		  else{
		  	alert("Account created successfully");
		  	return true;}
	 }
</script>
</html>
