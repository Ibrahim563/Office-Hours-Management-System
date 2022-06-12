<%-- 
    Document   : reserveAppointment
    Created on : Jan 14, 2021, 12:49:58 AM
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
                <link href="reserveAppointment.css" rel="stylesheet" type="text/css" >


    </head>
    <body>
        <h1>Reserve Appointment With your TA's or Doctors</h1>
        <%
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            DatabaseConnection dbConn = new DatabaseConnection();
            dbConn.getConnection();
            dbConn.createStatement();
            dbConn.RS = dbConn.Stmt.executeQuery("select * from officehours ;");
        %>
        <table border="1" width="5" cellspacing="5" cellpadding="5">
            <tbody>
                <tr>
                    <td>Staff Name</td>
                    <td>Subject </td>
                    <td>From Slot </td>
                    <td>To Slot </td>
                    <td>Date</td>
                    <td>Location</td>
                </tr>
                <%while (dbConn.RS.next()) {%>
                <tr>

                    <td><%out.print(dbConn.RS.getString("staffName"));%></td>
                    <td><%out.print(dbConn.RS.getString("Subject"));%></td>
                    <td><%out.print(dbConn.RS.getString("SlotFrom"));%></td>
                    <td><%out.print(dbConn.RS.getString("SlotTo"));%></td>
                    <td><%out.print(dbConn.RS.getString("date"));%></td>
                    <td><%out.print(dbConn.RS.getString("Location"));%></td>

                </tr>
                <%}%>
            </tbody>
        </table>
        <table border="1" width="5" cellspacing="5" cellpadding="5">
            <thead>
                <tr>
                    <td>Staff Name</td>
                    <td>Slot Number </td>
                </tr>
            </thead>
            <tbody>
                <%
                    dbConn.RS = dbConn.Stmt.executeQuery("select * from officehours ;");

                %>
                <tr>

                    <td>
                        <select id='name'>
                            <%while (dbConn.RS.next()) {%>
                            <option><%out.print(dbConn.RS.getString("staffName"));%></option>
                            <%}%>
                        </select>

                    </td>

                    <td>
                        <select id="slot" >
                            <option> 1</option>
                            <option> 2</option>
                            <option> 3</option>
                            <option> 4</option>
                            <option> 5</option>
                            <option> 6</option>
                            <option> 7</option>
                            <option> 8</option>
                        </select>
                    </td>
                    <td>
                        <input type="date" id="Date">
                    </td>

                </tr>
                <tr>
                    <td>
                        <form>
                            <input type="submit" value="Reserve Appointment" />
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>
    <script>
        $(document).ready(function () {
            $("input").on('click', function () {
                var slot = $("#slot").val();
                var name = $("#name").val();
                var date= $("#Date").val();
                 $.get("reserve.jsp", {name:name,slot: slot ,date:date} , function(result,status){
                });
            });
        });
    </script>

    <form action="students.jsp">
        <input type="submit" value="Back" />
    </form>
</body>
</html>
