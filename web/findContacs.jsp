<%-- 
    Document   : findContacs
    Created on : Jan 13, 2021, 10:50:57 PM
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
            String Name = request.getParameter("suggest");
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            DatabaseConnection dbConn = new DatabaseConnection();
            dbConn.getConnection();
            dbConn.createStatement();
            dbConn.RS = dbConn.Stmt.executeQuery("select * from staff where staffName="
                    + "'" + Name + "'; ");
        %>
        <table border="1" width="5" cellspacing="5" cellpadding="5">
            <thead>
                <tr>
                    <th>Staff Name</th>
                    <th>Staff Contact </th>
                </tr>
            </thead>
            <tbody>
                <%                 while (dbConn.RS.next()) {

                %>
                <tr>

                    <td><%out.print(dbConn.RS.getString("staffName"));%></td>
                    <td><%out.print(dbConn.RS.getString("staffContact"));%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>