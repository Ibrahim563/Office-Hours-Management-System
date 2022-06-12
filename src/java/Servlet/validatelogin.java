/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Pc
 */
@WebServlet(name = "validatelogin", urlPatterns = {"/validatelogin"})
public class validatelogin extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                DatabaseConnection dbConn = new DatabaseConnection();
                String email = request.getParameter("email");
                String password = request.getParameter("psw");
                dbConn.getConnection();
                dbConn.createStatement();
                dbConn.RS = dbConn.Stmt.executeQuery("SELECT  * FROM students "
                        + "WHERE studentEmail ='" + email + "' AND studentPassword ='" + password + "';");

                String id;
                String name;
                String staffSubject;
                String staffDepartment;
                if (dbConn.RS.next()) {

                    id = dbConn.RS.getString("studentID");
                    name = dbConn.RS.getString("studentName");
                    HttpSession session = request.getSession(true);
                    session.setAttribute("studentID", id);
                    session.setAttribute("email", email);
                    session.setAttribute("studentName",name);
                    response.sendRedirect("students.jsp");

                } else {
                    dbConn.RS = dbConn.Stmt.executeQuery("SELECT  * FROM staff "
                            + "WHERE staffEmail ='" + email + "' AND staffPassword ='" + password + "';");
                    if (dbConn.RS.next()) {

                        id = dbConn.RS.getString("staffID");
                        name = dbConn.RS.getString("staffName");
                        staffSubject = dbConn.RS.getString("CurrentSubject");
                        staffDepartment = dbConn.RS.getString("Department");
                        HttpSession session = request.getSession(true);
                        session.setAttribute("staffID", id);
                        session.setAttribute("staffEmail", email);
                        session.setAttribute("staffName",name);
                        session.setAttribute("staffSubject", staffSubject);
                        session.setAttribute("staffDepartment", staffDepartment);
                        response.sendRedirect("staff.jsp");
                    } else {
                        RequestDispatcher rd = request.getRequestDispatcher("index.html");
                        rd.forward(request, response);
                    }
                    dbConn.RS.close();
                    dbConn.Stmt.close();
                    dbConn.Con.close();
                }
            }catch (Exception ex) {
                ex.printStackTrace();
            }
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(validatelogin.class.getName()).log(Level.SEVERE, null, ex);
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(validatelogin.class.getName()).log(Level.SEVERE, null, ex);
        }
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
//("SELECT  studentUsername AND studentPassword FROM students "
//                        + "WHERE studentUsername ='" + userName + "' AND studentPassword ='" + password + "';");
