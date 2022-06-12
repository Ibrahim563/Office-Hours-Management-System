<%-- 
    Document   : seeContact
    Created on : Jan 13, 2021, 7:47:42 PM
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
        <link href="seeContact.css" rel="stylesheet" type="text/css" >

    </head>
    <body>

        <h1>Now You Can Find Staff Member of each subject Contact</h1>
        <%

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            DatabaseConnection dbConn = new DatabaseConnection();
            dbConn.getConnection();
            dbConn.createStatement();
            dbConn.RS = dbConn.Stmt.executeQuery("select * from staff ;");

        %>
        <select>
            <%while (dbConn.RS.next()) {%>
            <option><%out.print(dbConn.RS.getString("staffName"));%></option>
            <%}%>
        </select>
        <br>
    <div1></div1>
    <script>
        $(document).ready(function () {
            $("select").change(function () {
                var txt = $("select").val();
                $.get("findContacs.jsp", {suggest: txt}, function (result, status) {
                    $("div1").html(result);
                });
            });
        });


    </script>

    <form action="students.jsp">
        <input type="submit" value="Back" />
    </form>
</body>
</html>