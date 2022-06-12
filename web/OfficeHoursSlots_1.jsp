<%-- 
    Document   : OfficeHoursSlots
    Created on : Jan 13, 2021, 9:12:38 PM
    Author     : pc
--%>

<%@page import="Servlet.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="OfficeHoursSlots.css" rel="stylesheet" type="text/css" >
        <title>Office Hours Slots</title>
    </head>
     <body>
        <%
           
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            DatabaseConnection dbConn = new DatabaseConnection();
            dbConn.getConnection();
            dbConn.createStatement();
            int slot = Integer.parseInt(request.getParameter("slotNumber"));
            dbConn.RS = dbConn.Stmt.executeQuery("SELECT * FROM reservation WHERE slot="+slot+";");           
        %>

        
            <table class="styled-table">
                <thead>
                    <tr>
                        <th>Reservation ID</th>
                        <th>Staff Name</th>
                        <th>Student Name</th>
                        <th>Student Email</th>
                        <th>Slot Selected</th>
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
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </form




    </body>
</html>
