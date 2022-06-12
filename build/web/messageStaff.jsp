<%-- 
    Document   : messageStaff
    Created on : Jan 15, 2021, 7:10:26 PM
    Author     : boody_laptop
--%>
<%@page import="Servlet.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="messageStaff.css" rel="stylesheet" type="text/css" >
        <script src="jquery-3.5.1.min.js"></script>

    </head>
    <body>
        <form action='Message'>
            <table class="styled-table">
                <thead>
                    <tr>
                        <th>Staff Name</th>
                        <th>Message Content</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>

                        <td>
                            <input type="text" name="staffName"  />
                        </td>
                        <td><input type="text" name="MessageContent" value="" /></td>

                    </tr>
                    <tr>
                        <td><input type="submit" value="Send"/></td>
                    </tr>
                </tbody>
            </table>    
        </form>
        <form action="students.jsp">
            <input type="submit" value="Back" />
        </form>

    </body>
        <script>
            
</script>
    
</html>
