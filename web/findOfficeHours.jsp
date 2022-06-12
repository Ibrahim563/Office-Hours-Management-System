<%-- 
    Document   : findOfficeHours
    Created on : Jan 14, 2021, 12:44:02 AM
    Author     : boody_laptop
--%>

<%@page import="Servlet.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String subject=request.getParameter("suggest");
            Class.forName("com.mysql.jdbc.Driver").newInstance();
                DatabaseConnection dbConn = new DatabaseConnection();
                dbConn.getConnection();
                dbConn.createStatement();
                String sub=request.getParameter("suggest");
                dbConn.RS = dbConn.Stmt.executeQuery("select * from officehours where Subject = '"+sub+"'; ");
        %>
        <table border="1" width="5" cellspacing="5" cellpadding="5">
            <thead>
                <tr>
                    <th>Staff Name</th>
                    <th>Subject </th>
                    <th>From Slot</th>
                    <th>To Slot</th>
                    <th>Location</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <%               
                    while(dbConn.RS.next()){
                        
                    %>
                <tr>
                    <td><%out.print(dbConn.RS.getString("staffName"));%></td>
                    <td><%out.print(dbConn.RS.getString("Subject"));%></td>
                    <td><%out.print(dbConn.RS.getString("SlotFrom"));%></td>
                    <td><%out.print(dbConn.RS.getString("SlotTo"));%></td>
                    <td><%out.print(dbConn.RS.getString("Location"));%></td>
                    <td><%out.print(dbConn.RS.getString("date"));%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
