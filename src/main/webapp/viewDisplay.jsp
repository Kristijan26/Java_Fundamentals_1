<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Responsive Data from Database</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
<div class="row">

<table class="table table-bordered table-responsive table-striped">

<thead>
<tr>
<th>Course Id</th>
<th>Course Title</th>
<th>Trainer</th>
<th>Image URL</th>
<th>Fees</th>
<th>Course Description</th>
</tr>
</thead>

<%
    String course_id = request.getParameter("id");
    try {
        // Load MySQL driver
        Class.forName("com.mysql.jdbc.Driver");
        
        // Establish connection to the database
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_abhay", "jugo", "1234");
        
        // Prepare the query to fetch the course data based on the course_id
        PreparedStatement ps = con.prepareStatement("SELECT * FROM courses WHERE Course_Id=?");
        ps.setString(1, course_id);
        
        // Execute the query and get the result set
        ResultSet rs = ps.executeQuery();
        
        // Iterate over the result set and display the data in the table
        while (rs.next()) {
%>

<tr>
    <td><%= rs.getString("Course_Id") %></td>
    <td><%= rs.getString("Course_Title") %></td>
    <td><%= rs.getString("Trainer") %></td>
    <td><%= rs.getString("Image_URL") %></td>
    <td><%= rs.getString("Fees") %></td>
    <td><%= rs.getString("Course_Description") %></td>
</tr>

<%
        }
        // Close the connection and statement
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</table>
</div>
</div>
</body>
</html>
