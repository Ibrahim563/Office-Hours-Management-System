<%-- 
    Document   : ViewOfficeHour
    Created on : Jan 15, 2021, 4:56:03 PM
    Author     : Pc
--%>

<%@page import="Servlet.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="OfficeHoursSlots.css" rel="stylesheet" type="text/css" >

    </head>
    <body>
        <%
            String name = session.getAttribute("staffName").toString();
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            DatabaseConnection dbConn = new DatabaseConnection();
            dbConn.getConnection();
            dbConn.createStatement();
            dbConn.RS = dbConn.Stmt.executeQuery("SELECT * FROM officehours WHERE staffName= '" + name + "';");

        %>


        <table class="styled-table">
            <thead>
                <tr>
                    <th>Reservation ID</th>
                    <th>Slot From</th>
                    <th>Slot To</th>
                    <th>Location</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <%while (dbConn.RS.next()) {%>
                <tr>
                    <td><%=dbConn.RS.getString("ReservationID")%></td>
                    <td><%=dbConn.RS.getString("SlotFrom")%></td>
                    <td><%=dbConn.RS.getString("SlotTo")%></td>
                    <td><%=dbConn.RS.getString("Location")%></td>
                    <td><%=dbConn.RS.getString("date")%></td>
                </tr>
                <%}%>

            </tbody>
        </table>




    </body>
</html>
