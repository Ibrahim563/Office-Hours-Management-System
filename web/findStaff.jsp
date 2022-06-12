<%-- 
    Document   : findStaff
    Created on : Jan 13, 2021, 8:39:51 PM
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
                dbConn.RS = dbConn.Stmt.executeQuery("select * from staff where CurrentSubject ="
                       + "'"+subject+"'; ");
        %>
        <table border="1" width="5" cellspacing="5" cellpadding="5">
            <thead>
                <tr>
                    <th>Staff Name</th>
                    <th>Staff Email </th>
                </tr>
            </thead>
            <tbody>
                <%                 while(dbConn.RS.next()){
                        
                    %>
                <tr>
                    
                    <td><%out.print(dbConn.RS.getString("staffName"));%></td>
                    <td><%out.print(dbConn.RS.getString("staffEmail"));%></td>
                </tr>
                <%}%>
            </tbody>
        </table>

    </body>
</html>
