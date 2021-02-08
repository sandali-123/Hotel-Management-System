<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Salary of Permanent Employee</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/aye-styles.css">

</head>
<body >

	<div class="header">
		<div class="header-right">
			<a href="#">Hi Sam</a> <a href="customerhome.jsp">Log out</a>
		</div>
		<br>
		
	</div>

	<!-- <div class="wrapper">
		 
		<div class="main_content"> -->
			<!-- <div class="bg-image1" style="background:#ffffff;"> -->
				<%
					String year = request.getParameter("year");
					String month = request.getParameter("month");
				%>
				<center>
				<img src="img/logo.jpg" width="100px" height="100px">
			
	<h1>Salary Details of Permanent Employee</h1>
				
 <h1>In <%=month %> month of <%=year %></h1></center>
				<%@ page import="java.sql.*"%>
				<%@ page import="java.io.*"%>
				<%@ page import="java.util.ArrayList"%>
				<%@ page import="java.util.List"%>
				<%@page import="java.text.DecimalFormat"%>
				<%
					String db = "sewwandi";
					String user = "root"; // assumes database name is the same as username

					List<List<String>> data = new ArrayList<List<String>>();

					try {
						String connectionURL = "jdbc:mysql://localhost:3306/" + db;
						Connection connection, connection1 = null;
						Statement statement, statement2 = null;
						ResultSet resultSet, salaryResultSet, otResultSet, noPayResultSet = null;

						Class.forName("com.mysql.jdbc.Driver").newInstance();
						connection = DriverManager.getConnection(connectionURL, user, "isini123");
						if (!connection.isClosed()) {
							System.out.println("Successfully connected to " + "MySQL server using TCP/IP...");

							statement = connection.createStatement();
							String sql = "SELECT * FROM sewwandi.per_employee;";
							resultSet = statement.executeQuery(sql);

							while (!resultSet.isClosed() && resultSet.next()) {

								List<String> employeedetails = new ArrayList<String>();

								employeedetails.add(resultSet.getString("employeeId"));
								employeedetails.add(resultSet.getString("firstname"));
								employeedetails.add(resultSet.getString("lastName"));
								employeedetails.add(resultSet.getString("designation"));
								employeedetails.add(resultSet.getString("basicsalary"));

								int empId = resultSet.getInt("employeeId");

								//String empId = emp.getString("employeeId");

								//System.out.println(empId);

								double salary = resultSet.getDouble("basicSalary");

								statement2 = connection.createStatement();

								String otSQL = "SELECT sum(OT) ot FROM sewwandi.per_empattendan where employeeId=" + empId+ " and date LIKE '"+year+"-"+month+"-%'";
								
								/* + " and date BETWEEN CAST('"+year+"-"+month+"-01' AS DATE) AND CAST('"+year+"-"+month+"-31' AS DATE)"; */
								otResultSet = statement2.executeQuery(otSQL);

								int ot = 0;
								if (otResultSet.next()) {
									ot = otResultSet.getInt("ot");
								}
								otResultSet.close();

								String nopaySQL = "SELECT l.type, count(*) count FROM sewwandi.leave as l where l.empid="
										+ empId + " group by l.type";
								noPayResultSet = statement2.executeQuery(nopaySQL);

								int totalLeaveHrs = 0;
								double NoPayF = 0, NoPayH = 0;
								while (noPayResultSet.next()) {
									String type = noPayResultSet.getString("type");
									int count = noPayResultSet.getInt("count");
									if (type.equals("Full Day")) {
										/*  if(count>4){
										 	NoPayF=(salary/25)*(count-4);
										 }
										 else{
										 	NoPayF=0;
										 } */
										totalLeaveHrs += count;
									} else if (type.equals("Half Day")) {
										/* if(count>2){
											NoPayH=(salary/50)*(count-2);
										}
										else{
											NoPayH=0;
										} */

										totalLeaveHrs += (count / 2);
									}
								}
								noPayResultSet.close();

								//   double totalNoPays = NoPayF+NoPayH;
								int totalNoPays = totalLeaveHrs * 8 / 40;

								double ratio = salary / 30;
								double epf = 0.08 * salary;
System.out.println(ot);
System.out.println(ratio);

								
								employeedetails.add(String.format("%.2f", ot*ratio/100000));//OT pay
								System.out.println(ot);
								employeedetails.add(String.valueOf(totalLeaveHrs));
								employeedetails.add(String.valueOf(epf));//EPF
								employeedetails.add(String.format("%.2f", (totalNoPays * ratio)));//No payS
								// employeedetails.add(String.valueOf(totalNoPays));
								employeedetails.add(String.format("%.2f", salary + (ot * ratio/100000) - ((totalNoPays * ratio) + epf)));

								//System.out.println(salary + (ot * ratio) - (totalNoPays * ratio) - epf);
								data.add(employeedetails);
							}
				%>
				<br>
				<center>
				
				<input type="button" value="Get Report" style=" display: inline-block;
border-radius: 12px;background-color: #949494;padding: 20px;width: auto;transition: all 0.5s;cursor: pointer;align:left ; position: absolute;right: 50px; top: 50px;"  onClick="window.print()">

				<table style="width: 95%; background-color:#b2b2b2;color: black; " >
					<tr style=" background: #4d4d4d;">
						<th>Employee ID</th>
						<th>Employee Name</th>
						<th>Designation</th>
						<th>Basic salary</th>
						<th>OT pay</th>
						<!--  <th>Leave(full/half)</th> -->
						<th>EPF</th>
						<th>No pay</th>
						<th>Net Salary</th>
						<th> salary slip</th>
						
					</tr>
					<%
						for (int i = 0; i < data.size(); i++) {
									//out.println(data.get(i).get(0));
					%>
					
					<tr style="color: black;" >
						<td>
							<%
								out.println(data.get(i).get(0));
							%>
						</td>
						<td>
							<%
								out.println(data.get(i).get(1) +" "+ data.get(i).get(2));
							%>
						</td>
						<td>
							<%
								out.println(data.get(i).get(3));
							%>
						</td>
						<td>
							<%
								out.println(data.get(i).get(4));
							%>
						</td>
						<td>
							<%
								out.println(data.get(i).get(5));
							%>
						</td>
						 	<%-- <td><% out.println(data.get(i).get(5)); %></td>  --%>
						<td>
							<%
								out.println(data.get(i).get(7));
							%>
						</td>
						<td>
							<%
								out.println(data.get(i).get(8));
							%>
						</td>
						<td>
							<%
								out.println(data.get(i).get(9));
							%>
						</td>
						<td>
						<!-- <input type="button" value="print report" onClick="row.print()"> -->
						
							<%--  <button type='submit' name="slip-<%=i%>" > Salary Slip </button> --%>
							<button type='button' class='bn' > Salary Slip </button>
						</td>
					</tr>
					
					<%
					
						}
					%>
				

<br><br><br><br><br><br>
				</table></center>
				<%
					}
						connection.close();
					} catch (Exception ex) {
						out.println("Unable to connect to database: " + ex);
					}
				%>
			
			</script>
<br><br>	<br><br>				</div>

		<!-- </div>
	</div>
	</div> -->
<br><br><br><br><br><br><br><br>
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
					<p>Katugasthot</p>
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