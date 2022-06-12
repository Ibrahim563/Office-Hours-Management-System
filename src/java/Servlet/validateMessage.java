/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sun.security.pkcs11.wrapper.Functions;

/**
 *
 * @author pc
 */
@WebServlet(name = "validateMessage", urlPatterns = {"/validateMessage"})
public class validateMessage extends HttpServlet {

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
            
            try{
                
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                DatabaseConnection dbConn = new DatabaseConnection();
                dbConn.getConnection();
                dbConn.createStatement();
                String name = request.getSession().getAttribute("staffName").toString();
                String StringID = request.getParameter("MessageID");
                int ID = Integer.parseInt(StringID);
                String Reply = request.getParameter("Reply").toString();
                
                dbConn.RS = dbConn.Stmt.executeQuery("SELECT * FROM messages WHERE MessageID="+ID+";");
                
                
                String Sender = null;
                boolean flag = false;
                while(dbConn.RS.next())
                {
                    Sender = dbConn.RS.getString("MessageSender");
                    flag = true;
                    break;
                    
                }
                
                
       
                if(flag == true)
                {
                    
                    int rows = dbConn.Stmt.executeUpdate("INSERT INTO messages(MessageSender,MessengerRole,MessageContent"
                            + ",MessageDate,MessageReceiver,RecieverRole)"
                            + " VALUES('"+name+"', 'Staff', '"+Reply+"','"+LocalDate.now()+"','"+Sender+"','Student');");
                }
                response.sendRedirect("staff.jsp");
                
            }
            catch(Exception e)
            {
                e.printStackTrace();
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
