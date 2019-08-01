<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "test";
String userid = "root";
String password = "root";
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
<header style = "background-color : grey ; color: white;  min-height :100px; ">
	<title>Details</title>
	</br>
	<h1 align= "center"> Anthem Group of Companies</h1>
	</header>

<body background="./images/Lag.png">

<h1><b><font color="#F52330">Retriving Data From Database</font></b></h1>
<table border="1" align="center">
<tr>
<td><b>ApplicantId</b></td>
<td><b>RegistrationDate</b></td>
<td><b>Description</b></td>
<td><b>priority</b></td>
<td><b>ValidityStartDate</b></td>
<td><b>ValidityEndDate</b></td>
<td><b>AssignedTo</b> </td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from applicants";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getInt("applicantid") %></td>
<td><%=resultSet.getDate("regDate") %></td>
<td><%=resultSet.getString("Description") %></td>
<td><%=resultSet.getInt("priority") %></td>
<td><%=resultSet.getDate("valstadate") %></td>
<td><%=resultSet.getDate("valenddate") %></td>
<td><%=resultSet.getString("assignedto") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<style>
h1{
text-align:center;
color:black;
}
th, td {
  padding: 25px;
  text-align: left;
  color:black;
  background-color:white;
}
body{
background-color:white;
}
</style>
</body>
<br><br><br><br><br><br><br><br><br><br>
<footer style = "background-color : grey ; color: white;  min-height :200px; padding-right:1000px;"></br></br></br>
	<u>Contact us</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<u>About Us</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<u>@Copyrights reserved</u>
</footer>
</html>