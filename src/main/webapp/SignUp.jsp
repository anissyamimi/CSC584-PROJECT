<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Sign Up Page</title>
	<link rel= "stylesheet" href = "https://use.fontawesome.com/releases/v5.6.3/css/all.css">
</head>
<body>
	<div id='center'>
	  <div class='signup'>
		<div class="header">SIGN UP PAGE</div>
		<form>
		<br><br>
			 <input type="password" id="psw1" name="password1" placeholder= "Enter Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
			   title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
			 <input type="password" id="psw2" name="password2" placeholder= "Re-Enter Password" required>
		<br><br><br><br><br>
		<br><br><br>
		<input type="submit" onclick="matchPassword()" value="Signup">
		<br><br>
		</form>
	  </div>
	  <div class='whysign'>
	    <img class="galleryImg" src="Adidos.png" width="300px" height="300px">
	  </div>
	 </div>
</body>

<style>
	body{
	  background-color: #000000;
	  font: 1em Helvetica;}
	
	#center{
		width: 81%;
		margin: 5px auto;
		margin-top: 25px;
		position:relative;}
		
	.header{
		font-size: 25px;
		font-weight: bold;
		color: #FFFFFF;
		padding: 10px;
		background: #000000;
		border-bottom: 1px solid #737373;
		border-radius: 5px 5px 0 0;}
		
	.whysign{
	  float: left;
	  background-color: black;
	  width: 400px;
	  height: 540px;
	  border-radius: 5px 0 0 5px;
	  padding-top: 50px;
	  }
		
	[type=submit]{
	  margin-top: 25px;
	  width: 80%;
	  border: 0;
	  background-color: #000000;
	  border-radius: 5px;
	  height: 40px;
	  color: white;
	  font-weight: 400;
	  font-size: 1em;
	  cursor: pointer;
	  }
	  
	[type="submit"]:hover{
		background: #404040;
		transition: .5s;}
		
	.signup{
	  float: right;
	  width: 550px;
	  height: 540px;
	  padding: 10px 20px;
	  background-color: white;
	  text-align: center;
	  border-radius: 0 5px 5px 0;}
	
	[type=text],[type=password]{
	  display: block;
	  margin: 0 auto;
	  width: 80%;
	  border: 0;
	  border-bottom: 1px solid rgba(0,0,0,.2);
	  height: 40px;
	  line-height: 50px;  
	  margin-top: 20px;
	  margin-bottom: 20px;
	  font-size: 1em;
	  color: black;}
	  
	img {
	  display: block;
	  margin-top: 30%;
	  margin-left: auto;
	  margin-right: auto;}
	
	
	form a{
		text-decoration: none;
		font-size: 18px;
		color: #404040;
		padding: 0 0 0 20px;}
	
	form a:hover{
		color: black;
		transition: .5s;
		font-weight: bold;
		}
			  
</style>
<script>
		function matchPassword(){
			  var psw1 = document.getElementById("psw1");
			  var psw2 = document.getElementById("psw2");
			  if(psw1 != psw2){
			  	alert("Passwords did not match");
			  	return false;}
			  else{
			  	alert("Account created successfully");
			  	return true;}
		 }
	</script>
</html>