/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

@MultipartConfig
public class UploadQuiz extends HttpServlet {

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
            out.println("<title>Servlet UploadQuiz</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadQuiz at " + request.getContextPath() + "</h1>");
            String email=request.getParameter("user_email");
            String name=request.getParameter("user_name");
             Part part=request.getPart("cert1");
                String filename=part.getSubmittedFileName();
                String path= getServletContext().getRealPath("/"+"certificate"+File.separator+filename);
                InputStream is=part.getInputStream();
                boolean succs=uploadFile(is,path);
                if(succs){
                    out.println("File uploaded");
                }
                else{
                    out.println("Error");
                }
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Quizvee","root","Asif@1199");
                out.println("Connection success..."+email+" | "+name+"");
               
                
                String Q1=request.getParameter("Q1");
                String tick1=request.getParameter("tick1");
                String Q1OP1=request.getParameter("Q1OP1");
                String Q1OP2=request.getParameter("Q1OP2");
                String Q1OP3=request.getParameter("Q1OP3");
                String Q1OP4=request.getParameter("Q1OP4");
                String Q2=request.getParameter("Q2");
                String tick2=request.getParameter("tick2");
                String Q2OP1=request.getParameter("Q2OP1");
                String Q2OP2=request.getParameter("Q2OP2");
                String Q2OP3=request.getParameter("Q2OP3");
                String Q2OP4=request.getParameter("Q2OP4");
                String Q3=request.getParameter("Q3");
                String tick3=request.getParameter("tick3");
                String Q3OP1=request.getParameter("Q3OP1");
                String Q3OP2=request.getParameter("Q3OP2");
                String Q3OP3=request.getParameter("Q3OP3");
                String Q3OP4=request.getParameter("Q3OP4");
                String Q4=request.getParameter("Q4");
                String tick4=request.getParameter("tick4");
                String Q4OP1=request.getParameter("Q4OP1");
                String Q4OP2=request.getParameter("Q4OP2");
                String Q4OP3=request.getParameter("Q4OP3");
                String Q4OP4=request.getParameter("Q4OP4");
                String Q5=request.getParameter("Q5");
                String tick5=request.getParameter("tick5");
                String Q5OP1=request.getParameter("Q5OP1");
                String Q5OP2=request.getParameter("Q5OP2");
                String Q5OP3=request.getParameter("Q5OP3");
                String Q5OP4=request.getParameter("Q5OP4");
                String q="insert into "+name.charAt(0)+""+name.charAt(1)+"(id,Question,Option1,Option2,Option3,Option4,RightOption,certificate) values(?,?,?,?,?,?,?,?)";
                PreparedStatement pstmt=con.prepareStatement(q);
                out.println("<h1>"+name.charAt(0)+""+name.charAt(1)+"</h1>");
                pstmt.setInt(1, 1);
                pstmt.setString(2,Q1);
                pstmt.setString(3,Q1OP1);
                pstmt.setString(4,Q1OP2);
                pstmt.setString(5,Q1OP3);
                pstmt.setString(6,Q1OP4);
                pstmt.setString(7,tick1);
                pstmt.setString(8,null);
                pstmt.executeUpdate();
                pstmt.setInt(1, 2);
                pstmt.setString(2,Q2);
                pstmt.setString(3,Q2OP1);
                pstmt.setString(4,Q2OP2);
                pstmt.setString(5,Q2OP3);
                pstmt.setString(6,Q2OP4);
                pstmt.setString(7,tick2);
                pstmt.setString(8,null);
                pstmt.executeUpdate();
                pstmt.setInt(1, 3);
                pstmt.setString(2,Q3);
                pstmt.setString(3,Q3OP1);
                pstmt.setString(4,Q3OP2);
                pstmt.setString(5,Q3OP3);
                pstmt.setString(6,Q3OP4);
                pstmt.setString(7,tick3);
                pstmt.setString(8,null);
                pstmt.executeUpdate();
                pstmt.setInt(1, 4);
                pstmt.setString(2,Q4);
                pstmt.setString(3,Q4OP1);
                pstmt.setString(4,Q4OP2);
                pstmt.setString(5,Q4OP3);
                pstmt.setString(6,Q4OP4);
                pstmt.setString(7,tick4);
                pstmt.setString(8,null);
                pstmt.executeUpdate();
                pstmt.setInt(1, 5);
                pstmt.setString(2,Q5);
                pstmt.setString(3,Q5OP1);
                pstmt.setString(4,Q5OP2);
                pstmt.setString(5,Q5OP3);
                pstmt.setString(6,Q5OP4);
                pstmt.setString(7,tick5);
                pstmt.setString(8,path);
 
             //   pstmt.setString(3,password);
                out.println("<h1>Successfully Upload...</h1>");
                out.println("<h1><a href='index.html'>Go to home</a></h1>");
                pstmt.executeUpdate();
                
            
            }catch(Exception e){
              //  out.println("<h1>somthing went wrong please try again<h1>");
                e.printStackTrace();
            }
            out.println("<input value='http://localhost:9494/Quizvee/StudentRegister.jsp?quiz="+name.charAt(0)+""+name.charAt(1)+"'>" );
            out.println("</body>");
            out.println("</html>");
        }
    }
    public boolean uploadFile(InputStream is,String path){
        boolean test=false;
        try{
            byte[] byt=new byte[is.available()];
            is.read();
            FileOutputStream fops=new FileOutputStream(path);
            fops.write(byt);
            fops.flush();
            fops.close();
            test=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
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
