/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author asifk
 */
public class SignIn extends HttpServlet {

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
            out.println("<title>Servlet SignIn</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignIn at " + request.getContextPath() + "</h1>");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            out.println(email + " " + password);
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quizvee", "root", "Asif@1199");
                String q = "select * from user";
                Statement stmt = con.createStatement();
                ResultSet set = stmt.executeQuery(q);
                int flag = 0;
                while (set.next()) {
                    if ((email.equals(set.getString(3))) && (password.equals(set.getString(4)))) {
                        flag = 1;
                        break;
                    }
                    if ((email.equals(set.getString(3))) && (!password.equals(set.getString(4)))) {
                        break;
                    }
                }
                if (flag == 1) {
                    out.println("<h1>Successfully Sign in</h1>");
                    response.sendRedirect("QuizUpload.jsp?user_email="+email+"");
                    
                } else {
                    out.println("<h1>Incorrect Email or password</h1>");
                    out.println("<a href='index.html'><button>Go back</button></a>");
                }
            } catch (Exception e) {
                out.println("Somthing Went Wrong");
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
