<%-- 
    Document   : ReservationHistory
    Created on : Jan 14, 2021, 4:53:06 PM
    Author     : pc
--%>

<%@page import="Servlet.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="ReservationHistory.css" rel="stylesheet" type="text/css" >
        <title>Reservation History</title>
    </head>
    <body>
        <% Class.forName("com.mysql.jdbc.Driver").newInstance();
            DatabaseConnection dbConn = new DatabaseConnection();
            dbConn.getConnection();
            dbConn.createStatement();
            String StartDate = request.getParameter("StartingDate");
            String EndDate = request.getParameter("EndingDate");
            
            dbConn.RS= dbConn.Stmt.executeQuery("SELECT * FROM reservation WHERE date BETWEEN '"+StartDate+"' AND '"+EndDate+"';");
        %>
        <table class="styled-table">
                <thead>
                    <tr>
                        <th>Reservation ID</th>
                        <th>Staff Name</th>
                        <th>Student Name</th>
                        <th>Student Email</th>
                        <th>Slot Number</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%while (dbConn.RS.next()) {%>
                    <tr>
                        <td><%=dbConn.RS.getString("ReservationID")%></td>
                        <td><%=dbConn.RS.getString("staffName")%></td>
                        <td><%=dbConn.RS.getString("studentName")%></td>
                        <td><%=dbConn.RS.getString("studentEmail")%></td>
                        <td><%=dbConn.RS.getString("slot")%></td>
                        <td><%=dbConn.RS.getString("date")%></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
    </body>
</html>
