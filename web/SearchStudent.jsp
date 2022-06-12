<%-- 
    Document   : SearchStudent
    Created on : Jan 13, 2021, 5:50:57 PM
    Author     : pc
--%>

<%@page import="Servlet.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="SearchStudent.css" rel="stylesheet" type="text/css" >
        <title>Student Details</title>
    </head>
   <body>
        <%
            String name = session.getAttribute("staffName").toString();
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            DatabaseConnection dbConn = new DatabaseConnection();
            dbConn.getConnection();
            dbConn.createStatement();
            String studentName = request.getParameter("studentName");
            dbConn.RS = dbConn.Stmt.executeQuery("SELECT * FROM students WHERE studentName='"+studentName+"';");           
        %>

        
            <table class="styled-table">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Student Name</th>
                        <th>Student Email</th>
                        <th>Student Department</th>
                        <th>Student GPA</th>
                    </tr>
                </thead>
                <tbody>
                    <%while (dbConn.RS.next()) {%>
                    <tr>
                        <td><%=dbConn.RS.getString("studentID")%></td>
                        <td><%=dbConn.RS.getString("studentName")%></td>
                        <td><%=dbConn.RS.getString("studentEmail")%></td>
                        <td><%=dbConn.RS.getString("Department")%></td>
                        <td><%=dbConn.RS.getString("studentGPA")%></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </form




    </body>
</html>
