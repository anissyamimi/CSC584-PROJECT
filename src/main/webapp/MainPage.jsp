<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Main Page</title>
</head>
<body>
	<section class="whole-container">
		<div class="video-container">
            <video src="lenovo.mp4" autoplay muted loop></video>
        </div>
        <div class="content">
            <div class="cardcontainer">
                <img class="galleryImg" src="Adidos.png" width="200px" height="200px">
            </div>
            <h1 class="welcome">
                <span class="text-wrapper">
                    <span class="letters">INVENTORY MANAGEMENT SYSTEM</span>
                </span>    
            </h1>
            <br><br>
            <ul>
                <li><a href="Login.jsp" class="btn"><b>LOGIN</b></a>
                <a href="Register.jsp" class="btn"><b>REGISTER</b></a></li>
            </ul>
        </div>  
	</section>
</body>
<style>

	* {
	    box-sizing: border-box;
	    margin: 0;
	    padding: 0;}
	
	body {
	    font-family: 'Open Sans', sans-serif;
	    line-height: 1.5;}
	
	@keyframes zoominoutsinglefeatured {
	    0% {
	        transform: scale(1,1);}
	    50% {
	        transform: scale(1.2,1.2);}
	    100% {
	        transform: scale(1,1);}
	}
	
	.whole-container {
	    height: 100vh;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    text-align: center;
	    color: #fff;
	    padding: 0 20px;}
	
	.cardcontainer img {
	    animation: zoominoutsinglefeatured 1s infinite ;}
	
	.welcome {
		position: relative;
		font-weight: 100;
		font-size: 2em;}
	
	.welcome .letter {
		display: inline-block;
		line-height: 1em;
		transform-origin: 0 0;}
	
	.video-container {
	    position: absolute;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    overflow: hidden;}
	
	.video-container video {
	    min-width: 100%;
	    min-height: 100%;
	  	position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    object-fit: cover;}
	
	.video-container:after {
	    content: '';
	    z-index: 1;
	    height: 100%;
	    width: 100%;
	    top: 0;
	    left: 0;
	    background: rgba(0, 0, 0, 0.5);
	    position: absolute;}
	
	.content {
	    z-index: 2;}
	
	.btn {
		display: inline-block;
		padding: 20px 37px;
		background: var(--primary-color);
		background-color: #FFFFFF;
		color: #000000; 
		font: bold;
		font-size: 18px;
		border-radius: 10px;
		border: 2px;
		margin-top: 25px;
		opacity: 0.7;
		text-decoration: none;
		text-align: center;
		width: 250px;}
	
	.btn:hover {
	    transform: scale(0.98);
	    background-color: #000000;
		color: white;}
	
	ul {
		list-style-type: none;}
	
</style>
</html>