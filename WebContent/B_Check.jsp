<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
	String checkIn = request.getParameter("checkIn");
	String checkOut = request.getParameter("checkOut");
	String driver = "com.mysql.cj.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String database = "sewwandi";
	String userid = "root";
	String password = "";
	try {
		Class.forName(driver);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Room Reservation</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/util.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" /></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript">
	function validate() {

		var datepicker1 = document.getElementById("checkIn");
		var datepicker2 = document.getElementById("checkOut");
		if (datepicker1.value.trim() == "") {

			alert("Please enter CheckIn date!..");
			checkIn.style.border = "solid 3px red";
			return false;
		} else if (datepicker2.value.trim() == "") {

			alert("Please enter CheckOut date!..");
			checkOut.style.border = "solid 3px red";
			return false;
		}

		else {

			true;
		}
	}
</script>



<style type="text/css">
* {
	color: #000;
}

.header {
	overflow: hidden;
	background: #962C54;
	padding: 0 0;
}

.header a {
	float: left;
	color: #fff;
	text-align: center;
	padding: 12px;
	text-decoration: none;
	font-size: 18px;
	line-height: 25px;
	border-radius: 4px;
}

.header a:hover {
	background: #de87a8;
}

.header-right {
	float: right;
}

@media screen and (max-width: 480px) {
	.header a {
		float: none;
		display: block;
		text-align: left;
	}
	.header-right {
		float: none;
	}
	h1 img {
		float: none;
		display: block;
		text-align: center;
	}
}

h1 {
	font-family: 'Red Rose';
	font-weight: bold;
	font-style: oblique;
}

h1 img {
	border-image: round;
}

.h1 {
	font-family: "Times New Roman", Times, serif;
	font-weight: 100px;
	text-align: center;
	background: #962C54;
	font-transform: uppercase;
	color: #fff;
	font-size: 27px;
}

.bg {
	background: url('img/i2.jpg') no-repeat;
	width: 100%;
	height: 100%;
}

.add {
	border-radius: 5px;
	padding: 10px 10px;
	margin-top: 20px;
	margin-bottom: 20px;
	-webkit-box-shadow: -5px 2px 62px 8px rgba(0, 0, 0, 0.75);
	-moz-box-shadow: -5px 2px 62px 8px rgba(0, 0, 0, 0.75);
	box-shadow: -5px 2px 62px 8px rgba(0, 0, 0, 0.75);
	height: auto;
}

.slide-container {
	width: 1600px;
	height: 450px;
	margin-left: auto;
	margin-right: auto;
	overflow: hidden;
	text-align: center;
}

.image-container {
	width: 4800px;
	height: 900px;
	position: relative;
	transition: left 2s;
	-webkit-transition: left 2s;
	-moz-transition: left 2s;
	-o-transition: left 2s;
}

.slider-image {
	float: left;
	margin: 0px;
	padding: 0px;
}

.button-container {
	top: -20px;
	position: relative;
}

.slider-button {
	display: inline-block;
	height: 10px;
	width: 10px;
	border-radius: 5px;
	background-color: #fff;
}

#slider-image-1:target ~ .image-container {
	left: 0px;
}

#slider-image-2:target ~ .image-container {
	left: -1600px;
}

#slider-image-3:target ~ .image-container {
	left: -3200px;
}

.footer-top {
	background: #631d38;
	padding: 20px 0;
}

h2 {
	color: #fff;
}

p {
	color: #fff;
}

.segment-one h2:before {
	content: '|';
	color: #c65039;
	padding-right: 10px;
}

.segment-two ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

.segment-two h2:before {
	content: '|';
	color: #c65039;
	padding-right: 10px;
}

.segment-two ul li {
	border-bottom: 1px solid rgba(255, 255, 255, 0.3);
	line-height: 40px;
}

.segment-two ul li a {
	color: #fff;
	text-decoration: none;
}

.segment-three h2:before {
	content: '|';
	color: #c65039;
	padding-right: 10px;
}

.segment-three a {
	background: black;
	width: 40px;
	height: 40px;
	display: inline-block;
	border-radius: 50%;
}

.segment-three a i {
	font-size: 20px;
	color: #fff;
	padding: 10px 12px;
}

.segment-four ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

.segment-four h2:before {
	content: '|';
	color: #c65039;
	padding-right: 10px;
}

.segment-four ul li {
	border-bottom: 1px solid rgba(255, 255, 255, 0.3);
	line-height: 40px;
}

.segment-four ul li a {
	color: #fff;
	text-decoration: none;
}

.footer-bottom {
	background: #280b16;
	padding: 5px 0;
	color: #fff;
}

.footer-top {
	
}

.btn-block {
	width: 100%;
	align: center;
	box-shadow: 6px 6px 6px 6px rgba(.2,.2,.2,.2);
}

.border {
	width: 55%;
}

.h4 {
	font-family: "Times New Roman", Times, serif;
	text-align: center;
	font-transform: uppercase;
	font-size: 20px;
}

.container {
	width: 60%;

		
	outline-color:#d9d9d9;
	border-style: groove;
	border-top-right-radius: 15px;
	border-top-left-radius: 15px;
	border-bottom-right-radius: 15px;
	border-bottom-left-radius: 15px;
	box-shadow: 1px 1px 1px 1px rgba(.2,.2,.2,.2);
}
}
input[type=date]:focus:focus {
	background: #f2f4f2;
	outline: solid;
	outline-color:#fff;
	
}
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	list-style: none;
	text-decoration: none;
	font-family: "Times New Roman", Times, serif;
}

.wrapper {
	display: flex;
	position: relative;
}

.wrapper .sidebar {
	position: absolute;
	width: 250px;
	height: 100%;
	background: #962C54;
	padding: 30px 0;
}

.wrapper .sidebar h5 {
	color: #fff;
	text-transform: uppercase;
	text-align: center;
	margin-bottom: 30px;
}

.wrapper .sidebar ul li {
	padding: 15px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.05);
	border-top: 1px solid rgba(225, 225, 225, 0.05);
}

.wrapper .sidebar ul li a {
	color: #fff;
	display: block;
}

.wrapper .sidebar ul li a .fa {
	width: 25px;
}

.wrapper .sidebar ul li i {
	color: #fff;
}

.wrapper .sidebar ul li :hover i {
	color: #000;
}

.wrapper .sidebar ul li:hover {
	background: #de87a8;
}

.wrapper .sidebar ul li:hover a {
	color: #000;
}

.wrapper .sidebar .social_media {
	position: absolute;
	bottom: 5px;
	left: 50%;
	transform: translateX(-50%);
	display: flex;
}

.wrapper .sidebar .social_media a {
	display: block;
	width: 40px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	margin: 0 15px;
	color: #fff;
	border-top-right-radius: 5px;
	border-top-left-radius: 5px;
}

.wrapper .siderbar .social_media a i {
	color: #fff;
}

.wrapper .main_content {
	width: 100%;
	margin-left: 250px;
}

.card-text {
	color: black;
}

.roomRow {
	background: #f2f4f2;
	border-top-right-radius: 15px;
	border-top-left-radius: 15px;
	border-bottom-right-radius: 15px;
	border-bottom-left-radius: 15px;
	box-shadow: 2px 2px 2px 2px rgba(.2,.2,.2,.2);
}

.price {
	color: #6b6767;
	font-size: medium;
}
</style>

</head>
<body>
	<!-- <body style="background-image: url('img/media/My7.jpeg');background-repeat:repeat;"> -->

	<div class="header">
		<div class="header-right">
			<a href="customerhome.jsp"><i class="fa fa-home"></i> Home</a> <a
				href="register.jsp">Register</a> <a href="login.jsp">Login</a>
		</div>
	</div>

	<br>
	<center>
		<h1>
			<img src="img/media/rlogo.jpeg" width="100px" height="100px">
			HOTEL SEWWANDI & WEDDING CENTER <img src="img/media/rlogo.jpeg"
				width="100px" height="100px">
		</h1>
	</center>
	<br>
	<div class="h1">Room Reservation</div>

	<!-- <div class="wrapper">
		<div class="sidebar">

			<h5>hotel Sewwandi</h5>

			<br>
			<ul>
			<li><a href="customerhome.jsp"><i class="fa fa-home"></i> Home</a></li>
			<div class="dropdown" >
			<li style="color:#FFFFFF";><i class='fas fa-book'></i>  My Bookings
			<div class="dropdown-content">
			    <a href="MyHallBookings.jsp"><i style='font-size:24px' class='fas'>&#xf0da;</i>&nbsp My Events</a>
			    <a href="selectMyRBookings.jsp"><i style='font-size:24px' class='fas'>&#xf0da;</i>&nbsp My Room Bookings</a>
			  </div>
			</div>
			<li><a href="Check_Availability.jsp"><i class="fa fa-bed" style="font-size:20px"></i>&nbsp  Room Reservation</a></li>
			<li><a href="#"><i class="material-icons" style="font-size:20px">&#xe7f1;</i> &nbsp Hall Reservation</a></li>
			
		</ul>

			<div class="social_media">
				<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
					class="fa fa-instagram"></i></a> <a href="#"><i
					class="fa fa-twitter"></i></a>
			</div>

		</div> -->
		<div class="main_content">


			<form action="B_AvailableRooms.jsp" method="post">
				<div class="container p-3 my-3 border ">
					<div id="cont">

						<div class=h4>
							<center>
								<b>Book a Room
							</center>
						</div>
						<br> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  <label for="Check-In"><b>Check-In:</label>
						<input type="date" id="checkIn" name="checkIn"> &nbsp
						&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
					  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
						&nbsp &nbsp &nbsp &nbsp Check-Out:</label> <input type="date"
							id="checkOut" name="checkOut" required>

						<button type="submit" href="Available_Rooms.jsp" id="clearBtn"
							name="checkAvailability" class="btn btn-primary btn-block"
							onclick="return validate();">CHECK ROOM AVAILABILITY</button>
					</div>
			</form>
			<hr>

			<br>
			<br>
			<br>

			<%
				try {
					connection = DriverManager.getConnection(connectionUrl + database, userid, password);
					statement = connection.createStatement();
					String sql = "select * from room";
					resultSet = statement.executeQuery(sql);

					int j = 0;

					while (resultSet.next()) {
			%>



			<!-- <div class="card-deck">
  <div class="card">
    <img class="card-img-top" src="media/Room_01.jpg" alt="Card image cap">
    <div class="card-body"><br><br>
      <h5 class="card-title">Non-AC Double Room</h5>
      <p class="card-text">R-01</p>
      <p class="card-text">Double bed,Attached bathroom </p>
      <p class="card-text"><medium class="text-muted">LKR6000.00 |1 night</medium></p>
    </div>
  </div>
  <div class="card">
    <img class="card-img-top" src="media/102951494.jpg" alt="Card image cap">
    <div class="card-body"><br><br><br>
      <h5 class="card-title">AC Double Room</h5>
      <p class="card-text">R-02</p>
      <p class="card-text">Double separate beds, AC, Table lamp, Attached bathroom </p>
       <p class="card-text"><medium class="text-muted">LKR7000.00 |1 night</medium></p>
    </div>
  </div>
  <div class="card">
    <img class="card-img-top" src="media/non-ac-single-room.jpg" alt="Card image cap">
    <div class="card-body">
      <h5 class="card-title">Non-AC Double Room</h5>
      <p class="card-text">R-03</p>
      <p class="card-text">Double large bed, TV, Attached bathroom </p>
       <p class="card-text"><medium class="text-muted">LKR6500.00 |1 night</medium></p>
    </div>
  </div>
</div><br><br>
<div class="card-deck">
  <div class="card">
    <img class="card-img-top" src="media/triple1.jpg" alt="Card image cap">
    <div class="card-body"><br>
      <h5 class="card-title">AC Triple Room</h5>
      <p class="card-text">R-04</p>
      <p class="card-text">Double bed, Single bed, AC, Attached bathroom</p>
       <p class="card-text"><medium class="text-muted">LKR8500.00 |1 night</medium></p>
    </div>
  </div>
  <div class="card">
    <img class="card-img-top" src="media/Ac single room.jpg" alt="Card image cap">
    <div class="card-body">
      <h5 class="card-title">AC Double Room</h5>
      <p class="card-text">R-05</p>
      <p class="card-text">Double bed, AC, Cupboard, Attached bathroom</p>
       <p class="card-text"><medium class="text-muted">LKR7000.00 |1 night</medium></p>
    </div>
  </div>
  <div class="card">
    <img class="card-img-top" src="media/non Ac single bed.jpg" alt="Card image cap">
    <div class="card-body">
      <h5 class="card-title">Non-AC Single Room</h5>
      <p class="card-text">R-06</p>
      <p class="card-text">Single bed, Cupboard, Attached bathroom</p>
       <p class="card-text"><medium class="text-muted">LKR5000.00 |1 night</medium></p>
    </div> -->
			<!-- <div class="card"> -->
			<div class="roomRow">
				<div class="img">
					<img src="img/media/home/room/<%=resultSet.getString("imgName")%>"
						width="350px" class="img-responsive">

				</div>

				<div class="rdetails">
					<form method="post" action="AddRoomServlet">
						<input type="hidden" name="image"
							value="<%=resultSet.getString("imgName")%>"> <input
							type="hidden" name="RoomID"
							value="<%=resultSet.getString("roomId")%>">
						<h3>
							<b><%=resultSet.getString("roomType")%>
						</h3>
						&nbsp <input type="hidden" name="head"
							value="<%=resultSet.getString("roomType")%>"> <span><%=resultSet.getString("roomNo")%></span>
						<br>&nbsp <input type="hidden" name="des1"
							value="<%=resultSet.getString("roomNo")%>"> <span><%=resultSet.getString("roomDescription")%></span>
						&nbsp <input type="hidden" name="des2"
							value="<%=resultSet.getString("roomDescription")%>">
						<p class="price">
							<br>&nbsp LKR<%=resultSet.getString("roomPrice")%>
							&nbsp|1 night
						</p>
						<input type="hidden" name="prize"
							value="<%=resultSet.getString("roomPrice")%>"><br>
						<%-- <a class="btn btn-primary" name="updateRoom" href="editRooms.jsp?roomId=<%=resultSet.getString("roomId") %>" >   Edit</a>											 
									<a class="btn btn-primary"  name ="DeleteRoom" href="allRooms.jsp?roomId=<%=resultSet.getString("roomId") %>" >  Delete</a> --%>
					</form>
				</div>
			</div>
			<hr>
			<!-- <hr class="new1">	 -->
			<%
				j++;
					}

					connection.close();

				} catch (Exception e) {

					e.printStackTrace();
				}
			%>
		</div>
	</div>

	</div>
	</div>

	<!-- <br><br><br><br><br><br><br> -->

	<div class="container-fluid bg">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 col-sm-12">


				<div class="panel-body">
					<%--  <form onsubmit="return validate()" action="<%= request.getContextPath() %>/#" method="post" class="add" > --%>





				</div>



			</div>

		</div>
		<br>
</body>

<footer>
	<div class="footer-top">
		<div class="container-fluid">
			<div class="row">

				<div class="col-md-3 col-sm-6 col-xs-12 segment-one">
					<h2>Location</h2>
					<br>
					<p>Hotel "Sewwandi",</p>
					<p>192,</p>
					<p>Galaluwa,</p>
					<p>Manikhinna.</p>
				</div>

				<div class="col-md-3 col-sm-6 col-xs-12 segment-two">
					<h2>About Us</h2>
					<br>
					<p>Hotel "Sewwandi"</p>
					<p>Katugasthota</p>
					<p>Kandy</p>
				</div>

				<div class="col-md-3 col-sm-6 col-xs-12 segment-three">
					<h2>Follow Us</h2>
					<br>
					<p>Please follow us on Social media Profiles in order to keep
						updated.</p>
					<br> <a href="#"><i class="fa fa-facebook"></i></a> <a
						href="#"><i class="fa fa-instagram"></i></a> <a href="#"><i
						class="fa fa-twitter"></i></a>
				</div>

				<div class="col-md-3 col-sm-6 col-xs-12 segment-four">
					<h2>Contact Us</h2>
					<br>
					<p>Get in touch with us.</p>
					<ul>
						<li><a href="#">Email - sewwandistudio@gmail.com</a></li>
						<li><a href="#">Tel - 07</a></li>
						<li><a href="#">Privacy & Terms</a></li>
					</ul>
				</div>

			</div>
		</div>
	</div>
	</div>

	<div class="footer-bottom">
		<center>
			<p>&copy; Hotel Management.com | Designed By KDY04 Developers
				(Pvt) Ltd.</p>
		</center>
	</div>

</footer>



</html>