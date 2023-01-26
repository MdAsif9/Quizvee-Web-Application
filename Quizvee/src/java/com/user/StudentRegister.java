/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.user;

import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author asifk
 */
public class StudentRegister extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet StudentRegister</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StudentRegister at " + request.getContextPath() + "</h1>");
            String name=request.getParameter("user_name");
            String email=request.getParameter("user_email");
            String quiz=request.getParameter("quiz");
             try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/quizvee","root","Asif@1199");
                String q1="insert into Student(name,email) values(?,?)";
                PreparedStatement pstmt=con.prepareStatement(q1);
                pstmt.setString(1,name);
                pstmt.setString(2,email);
           //     pstmt.setString(3,password);
                out.println("<h1>Successfully Registered...</h1>");
           //     out.println("<h1><a href='index.html'>Go to home</a></h1>");
                pstmt.executeUpdate();
                response.sendRedirect("QuizAttempt.jsp?user_email="+quiz+""+email+"");
             }catch(Exception e){
                out.println("<h1>"+e.fillInStackTrace()+" Somthing went wrong</h1>");
                e.printStackTrace();
            }
            out.println("</body>");
            out.println("</html>");
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
