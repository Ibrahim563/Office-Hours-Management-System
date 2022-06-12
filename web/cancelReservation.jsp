<%-- 
    Document   : cancelReservation
    Created on : Jan 15, 2021, 1:58:05 AM
    Author     : boody_laptop
--%>

<%@page import="Servlet.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
              <script src="jquery-3.5.1.min.js"></script>
                      <link href="cancelReservation.css" rel="stylesheet" type="text/css" >


    </head>
    <body>
        <h1>Now By one Click You Can Cancel a Meeting Reservation</h1>
        <%
            String Email= session.getAttribute("email").toString();
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            DatabaseConnection dbConn = new DatabaseConnection();
            dbConn.getConnection();
            dbConn.createStatement();
            dbConn.RS = dbConn.Stmt.executeQuery("select * from reservation where"
                    + " studentEmail = '"+Email+"' ;");
            
        %>
        
        <table border="1" width="5" cellspacing="5" cellpadding="5">
            <thead>
                <tr>
                    <th>Reservation ID</th>
                    <th>staff Name</th>
                    <th>staff Email</th>
                    <th>Slot Number</th>
                </tr>
            </thead>
            <tbody>
                <%               
                    while(dbConn.RS.next()){
                        
                    %>
                <tr>
                    <td><%out.print(dbConn.RS.getString("Reservationid"));%></td>
                    <td><%out.print(dbConn.RS.getString("staffName"));%></td>
                    <td><%out.print(dbConn.RS.getString("staffEmail"));%></td>
                    <td><%out.print(dbConn.RS.getString("slot"));%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
            <br>
            <table  border="1" width="5" cellspacing="5" cellpadding="5">
                <thead>
                    <tr>
                        <th>Select Reservation ID you want to cancel</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    dbConn.RS = dbConn.Stmt.executeQuery("select * from reservation where"
                    + " studentEmail = '"+Email+"' ;");

                    %>
                    <tr>
                        <td>
                            <select id='id' >
                            <%while (dbConn.RS.next()) {%>
                            <option><%out.print(dbConn.RS.getString("ReservationID"));%></option>
                            <%}%>
                            </select>
                        </td>
                        <td>
                            <form>
                                <input type="submit" value="Cancel Reservation" />
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
        <script>
        $(document).ready(function () {
            $("input").on('click', function () {
                var id = $("#id").val();
        $.get("Cancel.jsp", {suggest : id } , function(result,status){
    });
            });
        });
            </script>


    <form action="students.jsp">
        <input type="submit" value="Back" />
    </form>

    </body>
</html>
