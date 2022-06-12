/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Pc
 */
@WebServlet(name = "createuser", urlPatterns = {"/createuser"})
public class createuser extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, MessagingException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String role = request.getParameter("role");
            String department = request.getParameter("department");
            DatabaseConnection dbConn = new DatabaseConnection();
            dbConn.getConnection();
            dbConn.createStatement();
            dbConn.RS = dbConn.Stmt.executeQuery("SELECT  studentEmail FROM students WHERE studentEmail = '" + email + "' ;");

            boolean flag = false;
            while (dbConn.RS.next()) {
                if (dbConn.RS.getString("studentEmail").equals(email)) {
                    out.print("1");
                    flag = true;
                    break;
                }

            }
            if (flag == false) {
                dbConn.RS = dbConn.Stmt.executeQuery("SELECT  staffEmail FROM staff WHERE staffEmail = '" + email + "' ;");
                while (dbConn.RS.next()) {
                    if (dbConn.RS.getString("staffEmail").equals(email)) {
                        out.print("1");
                        flag = true;
                        break;
                    }
                }
                if (flag == false) {
                    String values = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*_=+-/.?<>)";
                    Random rndm_method = new Random();

                    String password = new String();

                    for (int i = 0; i < 10; i++) {
                        password += values.charAt(rndm_method.nextInt(values.length()));
                    }
///////////////////////////////////////////////////////////////////////////////////////////
                    MAIL mail = new MAIL();
                    String m_text = "This is your new password in office hours system " + password;
                    String m_subject="About your registeration in FACI office hours systems";
                    mail.SendMail(email, m_subject,m_text);
///////////////////////////////////////////////////////////////////////////////////////////

                    if (role.equalsIgnoreCase("Student")) {
                        String line2 = "INSERT INTO students(studentEmail,studentName,studentPassword,Department) VALUES("
                                + "'" + email + "',"
                                + "'" + username + "',"
                                + "'" + password + "',"
                                + "'" + department + "')";
                        int Rows1 = dbConn.Stmt.executeUpdate(line2);
                    } else {
                        String line = "INSERT INTO staff(staffEmail,staffName,staffPassword,Department) VALUES("
                                + "'" + email + "',"
                                + "'" + username + "',"
                                + "'" + password + "',"
                                + "'" + department + "')";
                        int Rows = dbConn.Stmt.executeUpdate(line);
                    }
                    out.print("0");
                }

            }
            dbConn.Stmt.close();
            dbConn.Con.close();

        } finally {
            out.close();
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(createuser.class
                    .getName()).log(Level.SEVERE, null, ex);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(createuser.class
                    .getName()).log(Level.SEVERE, null, ex);

        } catch (InstantiationException ex) {
            Logger.getLogger(createuser.class
                    .getName()).log(Level.SEVERE, null, ex);

        } catch (IllegalAccessException ex) {
            Logger.getLogger(createuser.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(createuser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(createuser.class
                    .getName()).log(Level.SEVERE, null, ex);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(createuser.class
                    .getName()).log(Level.SEVERE, null, ex);

        } catch (InstantiationException ex) {
            Logger.getLogger(createuser.class
                    .getName()).log(Level.SEVERE, null, ex);

        } catch (IllegalAccessException ex) {
            Logger.getLogger(createuser.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(createuser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
