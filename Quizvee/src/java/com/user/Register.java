/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.user;

import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author asifk
 */
public class Register extends HttpServlet {

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
            out.println("<title>Servlet Register</title>");            
            out.println("</head>");
            out.println("<body style='background-color:red'>");
           
            String name=request.getParameter("user_name");
            String email=request.getParameter("user_email");
            String password=request.getParameter("user_password");
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/quizvee","root","Asif@1199");
                String q="select * from user";
                Statement stmt=con.createStatement();
                ResultSet set=stmt.executeQuery(q);
                int flag=0;
                while(set.next()){
                    if(email.equals(set.getString(3))){
                        flag=1;
                        break;
                    }
                } 
            
                if(flag==0){
                        String q2="CREATE TABLE "+name.charAt(0)+""+name.charAt(1)+"(id int,Question varchar(200),Option1 varchar(200),Option2 varchar(200),Option3 varchar(200),Option4 varchar(200),RightOption varchar(10),certificate BLOB,PRIMARY KEY (id))";
                     //   Statement stmt=con.createStatement();
                        stmt.execute(q2);
                        
                        String q1="insert into user(name,email,password) values(?,?,?)";
                        PreparedStatement pstmt=con.prepareStatement(q1);
                        pstmt.setString(1,name);
                        pstmt.setString(2,email);
                        pstmt.setString(3,password);
                        out.println("<h1>Successfully Registered...</h1>");
                        out.println("<h1><a href='index.html'>Go to home</a></h1>");
                        pstmt.executeUpdate();
                }
                else{
                        out.println("<h1>User Already Exist please try to Sign in...</h1>");
                        out.println("<h1><a href='index.html'>Go to home</a></h1>");
                    }
                
                
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
