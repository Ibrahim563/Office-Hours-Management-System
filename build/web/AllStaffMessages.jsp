<%-- 
    Document   : AllStaffMessages
    Created on : Jan 11, 2021, 3:24:28 PM
    Author     : pc
--%>

<%@page import="Servlet.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Messages</title>
        <link href="AllStaffMessages.css" rel="stylesheet" type="text/css" >
    </head>

    <body>
        <%
            String name = session.getAttribute("staffName").toString();
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            DatabaseConnection dbConn = new DatabaseConnection();
            dbConn.getConnection();
            dbConn.createStatement();
            dbConn.RS = dbConn.Stmt.executeQuery("SELECT * FROM messages WHERE MessengerRole= 'Student' AND MessageReceiver='" + name + "';");
            
        %>

        <form action="validateMessage" method="post">
            <table class="styled-table">
                <thead>
                    <tr>
                        <th>Message ID</th>
                        <th>Date</th>
                        <th>Message Sender</th>
                        <th>Message Content</th>
                    </tr>
                </thead>
                <tbody>
                    <%while (dbConn.RS.next()) {%>
                    <tr>
                        <td><%=dbConn.RS.getString("MessageID")%></td>
                        <td><%=dbConn.RS.getString("MessageDate")%></td>
                        <td><%=dbConn.RS.getString("MessageSender")%></td>
                        <td><%=dbConn.RS.getString("MessageContent")%></td>
                    </tr>
                    <%}%>

                    <tr>
                        <td>Send Reply</td>
                        <td><input type="number" name="MessageID" value="" /> </td>
                        <td><input type="text" name="Reply" value="Type your reply here" /> </td>
                        <td><input type="submit" value="Send Reply" /></td>
                    </tr>
                </tbody>
            </table>
        </form>




    </body>
</html>
