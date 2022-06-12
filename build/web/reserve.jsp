<%-- 
Document   : reserve
Created on : Jan 14, 2021, 2:58:12 AM
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
            String slot = request.getParameter("slot");
            int solot = Integer.parseInt(slot);
            MAIL mail = new MAIL();

            String name = request.getParameter("name");
            String date = request.getParameter("date");
            String email = session.getAttribute("email").toString();
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            DatabaseConnection dbConn = new DatabaseConnection();
            dbConn.getConnection();
            dbConn.createStatement();
            dbConn.RS = dbConn.Stmt.executeQuery("select * from officehours "
                    + "where staffName = '" + name + "' ;");
            int slotNoTo = 0;
            int slotNoFrom = 0;
            int reserveslot = 0;
            String Daty = null;
            while (dbConn.RS.next()) {
                slotNoTo = dbConn.RS.getInt("SlotTo");
                slotNoFrom = dbConn.RS.getInt("SlotFrom");
                Daty = dbConn.RS.getString("date");
            }
            String Date = Daty.substring(0, 10);
            if (solot <= slotNoTo && solot >= slotNoFrom) {
                dbConn.RS = dbConn.Stmt.executeQuery("select * from reservation "
                        + "where staffName = '" + name + "' ;");
                while (dbConn.RS.next()) {
                    reserveslot = dbConn.RS.getInt("slot");
                }
                dbConn.RS.close();
                if (reserveslot != solot) {
                    if (Date.equals(date)) {
                        dbConn.RS = dbConn.Stmt.executeQuery("select * from students "
                                + "where studentEmail = '" + email + "' ;");
                        String Name = null;
                        while (dbConn.RS.next()) {
                            Name = dbConn.RS.getString("studentName");
                        }
                        dbConn.RS.close();
                        dbConn.RS = dbConn.Stmt.executeQuery("select * from staff "
                                + "where staffName = '" + name + "' ;");
                        String Email = null;
                        while (dbConn.RS.next()) {
                            Email = dbConn.RS.getString("staffEmail");
                        }
                        int Rows1 = dbConn.Stmt.executeUpdate("insert into reservation (staffName,staffEmail,studentName,studentEmail,slot,date) VALUES ('" + name + "','" + Email + "','" + Name + "','" + email + "','" + slot + "','" + date + "');");
                        String m_text = "You have a new  reservation on " + date + " in slot " + slot + " !   ";
                        String m_subject = "New Reservertion";
                        mail.SendMail(Email, m_subject, m_text);
                        mail.SendMail(email, m_subject, m_text);
                    }
                } else {
                    out.print("This Staff Member Isn't available in this slot");
                }
            } else {
                out.print("This Staff Member Isn't available in this slot");
            }

            /*Sending Mail 
                    uncompleted YET 
             */
        %>
    </body>
</html>
