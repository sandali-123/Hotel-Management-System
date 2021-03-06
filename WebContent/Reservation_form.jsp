<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

         <%@page import="java.sql.DriverManager"%>
 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%


    String roomReservationId = request.getParameter("roomReservationId");
	String roomId = request.getParameter("roomId");
	String cName = request.getParameter("cName");
	String phone_No = request.getParameter("phone_No");
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
<title>Make your reservation</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/util.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" /></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">

function validate(){
 	
	 var checkIn = document.getElementById("checkIn");
	    var checkOut = document.getElementById("checkOut"); 
	    var arrivalTime = document.getElementById("arrivalTime");
		var no_of_adults = document.getElementById("no_of_adults");
		var no_of_kids = document.getElementById("no_of_kids");
		var phone_No = document.getElementById("phone_No");
	
		 var phoneno = /^\d{10}$/;
		 var numerValidate = /^[0-9]+$/; 
		 
		  var x = new Date(checkIn);
		 var y = new Date(checkOut); 
		 
	 
		 if(checkIn.value.trim() == "" ) {

			   alert(" Enter CheckIn date...");
			   checkIn.style.border="solid 3px red";
		          return false;
		        }
		      else if(checkOut.value.trim() == "" ) {

		          alert(" Enter CheckOut date...");
		          checkOut.style.border="solid 3px red";
		          return false;
		        }
		 
		 
		 else if(x > y ) {

		          alert(" CheckOut date should be larger than CheckIn date..");
		          checkIn.style.border="solid 3px red";
		          return false;
		        }
		    
		      else if(arrivalTime.value.trim() == "" ) {

		          alert(" Enter Arrival time...");
		          arrivalTime.style.border="solid 3px red";
		          return false;
		        }
		      else if(no_of_adults.value.trim() == "" ) {

		          alert(" Enter No of adults...");
		          no_of_adults.style.border="solid 3px red";
		          return false;
		        }
		      else if(!no_of_adults.value.match(numerValidate) ) {

		          alert(" Check No of adults..");
		          no_of_adults.style.border="solid 3px red";
		          return false;
		        }
			
		      else if(no_of_kids.value.trim() == "" ) {

		          alert(" Enter No of kids...");
		          no_of_kids.style.border="solid 3px red";
		          return false;
		        }
		      else if(!no_of_kids.value.match(numerValidate) ) {

		          alert(" Check No of kids..");
		          no_of_kids.style.border="solid 3px red";
		          return false;
		        }
		      else if(phone_No.value.trim() == "" ) {

		          alert(" Enter Phone number...");
		          phone_No.style.border="solid 3px red";
		          return false;
		        }
		      else if(!phone_No.value.match(phoneno) ) {

		          alert(" Invalid Phone no..");
		          phone_No.style.border="solid 3px red";
		          return false;
		        }
			
		      else{
		    	  
		    	  alert("Successfully inserted...!");
		       
		          true;
		      }

		 
		 
	
	
}



</script>
<style type="text/css">

*{color:#000;}

.header {
  overflow: hidden;
  background:#962C54;
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


h1{
	
	font-family: 'Red Rose';
	font-weight: bold;
	font-style: oblique;
}
 h1 img{
 	border-image: round;
 }


.h1{
	font-family: "Times New Roman", Times, serif;
	font-weight: 100px;
	text-align: center;
	background: #962C54;
	font-transform: uppercase;
	color: #fff;
	font-size:27px;
}

.bg{background:url('img/i2.jpg') no-repeat;
  width:100%;
  height:100%;
}

.add{
border-radius: 5px;
padding:10px 10px;
margin-top:20px;
margin-bottom:20px;
-webkit-box-shadow: -5px 2px 62px 8px rgba(0,0,0,0.75);
-moz-box-shadow: -5px 2px 62px 8px rgba(0,0,0,0.75);
box-shadow: -5px 2px 62px 8px rgba(0,0,0,0.75);
height: auto;
}


.slide-container{
  width: 1600px;
  height: 450px;
  margin-left: auto;
  margin-right: auto;
  overflow: hidden;
  text-align: center;

}

.image-container{
  width: 4800px;
  height: 900px;
  position: relative;
  transition: left 2s;
  -webkit-transition:left 2s;
  -moz-transition:left 2s;
  -o-transition:left 2s;
}

.slider-image{
  float: left;
  margin: 0px;
  padding: 0px;
}

.button-container{
  top: -20px;
  position: relative;
}


.slider-button{
  display: inline-block;
  height: 10px;
  width:10px;
  border-radius: 5px;
  background-color: #fff;
}

#slider-image-1:target ~ .image-container{
  left: 0px;
}

#slider-image-2:target ~ .image-container{
  left: -1600px;
}

#slider-image-3:target ~ .image-container{
  left: -3200px;
}


.footer-top{
  background: #631d38;
  padding: 20px 0;

}

h2{
  color: #fff;
}

p{
  color: #fff;
}

.segment-one h2:before{
  content: '|';
  color: #c65039;
  padding-right: 10px;
}

.segment-two ul{
  margin: 0;
  padding: 0;
  list-style: none;
}
.segment-two h2:before{
  content: '|';
  color: #c65039;
  padding-right: 10px;
}

.segment-two ul li{
  border-bottom: 1px solid rgba(255,255,255,0.3);
  line-height: 40px;  
}
.segment-two ul li a{
  color: #fff;
  text-decoration: none;
}
.segment-three h2:before{
  content: '|';
  color: #c65039;
  padding-right: 10px;
}
.segment-three a{
  background: black;
  width: 40px;
  height: 40px;
  display: inline-block;
  border-radius: 50%;
}
.segment-three a i{
  font-size: 20px;
  color: #fff;
  padding: 10px 12px;
}

.segment-four ul{
  margin: 0;
  padding: 0;
  list-style: none;
}
.segment-four h2:before{
  content: '|';
  color: #c65039;
  padding-right: 10px;
}

.segment-four ul li{
  border-bottom: 1px solid rgba(255,255,255,0.3);
  line-height: 40px;  
}
.segment-four ul li a{
  color: #fff;
  text-decoration: none;
}

.footer-bottom{
  background: #280b16;
  padding: 5px 0;
  color:#fff;
}
.footer-top{

	
}
.btn-block{

width:100%;
align:center;
}
.border{
  width:67%;
}
.h4{
	font-family: "Times New Roman", Times, serif;
	
	text-align: center;
	font-transform: uppercase;
	font-size:20px;
}
.h3{
	font-family: "Times New Roman", Times, serif;
	
	text-align: center;
	font-transform: uppercase;
	font-size:26px;
}

* {box-sizing: border-box}

/* Add padding to containers */
.container {
  padding: 16px;
  background: #f1f1f1;
  
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #ffff;
}

input[type=text]:focus:focus {
   background: #ffff;
  outline: none;
}
input[type=date]:focus:focus{
	 background: #ffff;
  outline: none;

}
input[type=date]{
	 width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
   background: #ffff;
}
input[type=time]:focus:focus{
	 background: #ffff;
  outline: none;

}
input[type=time]{
	 width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
 background: #ffff;

}
input[type=tel]:focus:focus{
	  background: #ffff;
  outline: none;

}
input[type=tel]{
	 width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
   background: #ffff;

}
input[type=number]:focus:focus{
	 background: #ffff;
  outline: none;

}
input[type=number]{
	 width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
 background: #ffff;

}


/* Overwrite default styles of hr */
hr {
  border: 1.5px solid #f1f1f1;
  margin-bottom: 25px;
   background: black;
}

/* Set a style for the submit/register button */
.registerbtn {
  background-color:#0070ff ;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
  font-size:17px;
}

.registerbtn:hover {
  opacity:1;
  background-color:#87cefa ;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}



		*{
			margin: 0;
			padding: 0;
			box-sizing: border-box;
			list-style: none;
			text-decoration: none;
			font-family: "Times New Roman", Times, serif;
		}

		.wrapper{
			display: flex;
			position: relative;
		}
		.wrapper .sidebar{
			position: absolute;
			width: 250px;
			height: 100%;
			background: #962C54;
			padding: 30px 0;
		}
		.wrapper .sidebar h5{
			color: #fff;
			text-transform: uppercase;
			text-align: center;
			margin-bottom: 30px;
		}
		.wrapper .sidebar ul li{
			padding: 15px;
			border-bottom: 1px solid rgba(0,0,0,0.05);
			border-top: 1px solid rgba(225,225,225,0.05);
		}
		.wrapper .sidebar ul li a{
			color: #fff;
			display: block;
		}
		.wrapper .sidebar ul li a .fa{
			width: 25px;
		}
		.wrapper .sidebar ul li i{
			color: #fff;
		}
		.wrapper .sidebar ul li :hover i{
			color: #000;
		}
		.wrapper .sidebar ul li:hover{
			background: #de87a8;
		}
		.wrapper .sidebar ul li:hover a{
			color: #000;
		}
		.wrapper .sidebar .social_media{
			position: absolute;
			bottom: 5px;
			left: 50%;
			transform: translateX(-50%);
			display: flex;
		}
		.wrapper .sidebar .social_media a{
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
		.wrapper .siderbar .social_media a i{
			color: #fff;
		}
		.wrapper .main_content{
			width: 100%;
			margin-left: 250px;
		}

		.card-text{
		color:black;
		}
		.container 
{ box-shadow: 0px 1px 1px rgba(0,0,0,.2);
width:67%;
 border-top-right-radius: 15px;
			border-top-left-radius: 15px;
			border-bottom-right-radius: 15px;
			border-bottom-left-radius: 15px;
			
}

</style>

</head><body >
<!-- <body style="background-image: url('img/media/ri2.jpg');background-repeat: repeat;">
 -->
<div class="header">
  <div class="header-right">
    <a href="customerloghome.jsp"><i class="fa fa-home"></i> Home</a>
 <!--    <a href="#">Register</a> -->
    <a href="logoutServlet">Logout</a>
  </div>
</div>

        <br>
  			<center><h1><img src="img/media/rlogo.jpeg" width="100px" height="100px"> HOTEL SEWWANDI & WEDDING CENTER <img src="img/media/rlogo.jpeg" width="100px" height="100px"></h1></center>
		<br>
        <div class="h1">Make your reservation</div>

<div class="wrapper" style="background-image: url('img/media/ri2.jpg');background-repeat:no-repeat;">
	<div class="sidebar">

		<h5>hotel Sewwandi</h5>

    <br>
		<ul>
			<li><a href="customerloghome.jsp"><i class="fa fa-home"></i> Home</a></li>
			<div class="dropdown" >
			<li style="color:#FFFFFF";><i class='fas fa-book'></i>  My Bookings
			<div class="dropdown-content">
			    <a href="selectbooking.jsp"><i style='font-size:24px' class='fas'>&#xf0da;</i>&nbsp My Events</a>
			    <a href="selectMyRBookings.jsp"><i style='font-size:24px' class='fas'>&#xf0da;</i>&nbsp My Room Bookings</a>
			  </div>
			</div>
			<li><a href="Check_Availability.jsp"><i class="fa fa-bed" style="font-size:20px"></i>&nbsp  Room Reservation</a></li>
			<li><a href="checkHallAvailability.jsp"><i class="material-icons" style="font-size:20px">&#xe7f1;</i> &nbsp Hall Reservation</a></li>
			
		</ul>

		<div class="social_media">
			<a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-instagram"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
		</div>

	</div>
	<div class="main_content">
	
	
	

<div class="container p-3 my-3 border ">

  <%
			try{
				connection = DriverManager.getConnection(connectionUrl+database, userid, password);
				statement=connection.createStatement();
				String sql ="select roomNo,roomType from room where roomId = '"+roomId+"'";
				resultSet = statement.executeQuery(sql);
				
				int j = 0;
				
				while(resultSet.next()){
					
					String roomType = resultSet.getString("roomType");
					String roomNo = resultSet.getString("roomNo");
					
			
		%>
<!------------------------------Insert booking Details-------------------------------------------------------------->


<form  onsubmit="return validate()" action="AddBookingServelet" method="post"   action="<%= request.getContextPath() %>/#" >

  
  <div class="container">
    <div class = "h3"><b>Reservation form</div>
   
    <hr>
		<input type="text" class="form-control" id="roomReservationId"  name="roomReservationId" value="<% out.print(roomReservationId); %>" hidden>
    <label for="cName"><b>Name :</b></label>
    <input type="text"  name="cName" id="cName"  required   value="<%=session.getAttribute("fname")%> <%=session.getAttribute("lname")%>">
     <label for="checkIn "><b>Check-In:</b></label>
    
    <input type="date" class="form-control"  id="checkIn" name="checkIn" placeholder="Enter checkIn date" >
	 <label for="checkOut "><b>Check-Out:</b></label>
    <!-- <input type="date"   name="checkOut " id="checkOut " required> -->
    <input type="date" class="form-control"  id="checkOut" name="checkOut" placeholder="Enter checkOut date" >
    
    <div class="md-form md-outline">
     <label for="default-picker"><b>Arrival time : </b></label>
  	<input type="time" id="arrivalTime" name = "arrivalTime" class="form-control" placeholder="Select time" >
	</div>
	<label for="no_of_adults"><b>No of adults:</b></label>
    <input type="number"  name="no_of_adults" id="no_of_adults" >
    <label for="no_of_kids"><b>No of kids:</b></label>
    <input type="number"  name="no_of_kids" id="no_of_kids" >
    <label for="text"><b>Room No :</b></label>
    <input type="text"  name="roomNo" id="roomNo" value="<%out.print(roomNo);%>" >
        <!-- <div class="form-group"> -->
      <br>
   <label for="roomType">Room type : </label>
			 	<input type="text" class="form-control" id="roomType"  name="roomType"   value="<%out.print(roomType);%>"   >  
   <!--  </div> -->

    <label for="phone_No" ><b>Phone No :</b></label>
    <input type="tel"  name="phone_No" id="phone_No"   >
    <hr>
    <input type="submit"  name = "addBook" class="registerbtn" value="Submit" id="submit"  >
  </div>
	
 
</form>

  		 	<%
			
			j++;
				}
				
				connection.close();
			
			} catch (Exception e) {
			
				e.printStackTrace();
			}
		
		%>
  

</div>

 

<br><br><br><br>
	
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
            <p>Please follow us on Social media Profiles in order to keep updated.</p>
            <br>
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-instagram"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
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
      <center><p>&copy; Hotel Management.com | Designed By KDY04 Developers (Pvt) Ltd.</p></center>
  </div>

</footer>



</html>  