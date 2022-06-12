/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pc
 */
@WebServlet(name = "UpdateOfficeHour", urlPatterns = {"/UpdateOfficeHour"})
public class UpdateOfficeHour extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            DatabaseConnection dbConn = new DatabaseConnection();
            dbConn.getConnection();
            dbConn.createStatement();
            int SlotFrom = Integer.parseInt(request.getParameter("slotFrom"));
            int SlotTo = Integer.parseInt(request.getParameter("slotTo"));
            String Location = request.getParameter("location");
            String Date = request.getParameter("date");

            String StaffName = request.getSession().getAttribute("staffName").toString();
            String StaffDepartment = request.getSession().getAttribute("staffDepartment").toString();
            String StaffSubject = request.getSession().getAttribute("staffSubject").toString();
            
            dbConn.RS = dbConn.Stmt.executeQuery("SELECT * FROM officehours WHERE date='"+Date+"';");
            response.sendRedirect("staff.jsp");
            
            while(dbConn.RS.next())
            {
                if (SlotFrom >= 1 && SlotTo <= 8) {
                    int rows = dbConn.Stmt.executeUpdate("UPDATE officehours SET SlotFrom="+SlotFrom+", SlotTo="+SlotTo+",Location='"+Location+"' WHERE "
                            + " date='"+Date+"';");
                }
                
            }

        } catch (Exception ex) {
            ex.printStackTrace();
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
        processRequest(request, response);
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
        processRequest(request, response);
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
