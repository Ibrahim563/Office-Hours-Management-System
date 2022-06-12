<%-- 
    Document   : Cancel
    Created on : Jan 15, 2021, 2:28:19 AM
    Author     : boody_laptop
--%>

<%@page import="Servlet.MAIL"%>
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
            String id = request.getParameter("suggest");
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            DatabaseConnection dbConn = new DatabaseConnection();
            dbConn.getConnection();
            dbConn.createStatement();
            MAIL mail = new MAIL();
            String studentEmail="";
            String staffEmail="";
            String date="";
            String slot="";
            dbConn.RS = dbConn.Stmt.executeQuery("SELECT * FROM reservation WHERE ReservationID='" + id + "';");
            while (dbConn.RS.next()) {
                studentEmail = dbConn.RS.getString("studentEmail");
                staffEmail = dbConn.RS.getString("staffEmail");
                date = dbConn.RS.getString("date");
                slot = dbConn.RS.getString("slot");
            }
            dbConn.Stmt.executeUpdate("delete from reservation where"
                    + " ReservationID = '" + id + "'");
            String m_text = "Your reservation on " + date + "in slot " + slot + " was canceled successfully ";
            String m_subject = "Reservertion Cancelation";
            mail.SendMail(staffEmail, m_subject, m_text);
            mail.SendMail(studentEmail, m_subject, m_text);

        %>

    </body>
</html>
