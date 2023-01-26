/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.user;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author asifk
 */
public class Generate_Certificate extends HttpServlet {

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
            out.println("<title>Servlet Generate_Certificate</title>");            
            out.println("</head>");
            out.println("<body>");
//            out.println("<h1>Servlet Generate_Certificate at " + request.getContextPath() + "</h1>");
            String email=request.getParameter("user_email");
            String name=request.getParameter("user_name");
            String table=request.getParameter("user_table");
            int count=0;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Quizvee","root","Asif@1199");
//                out.println("Connection success..."+email+" | "+name+"");
                
                String tick1=request.getParameter("tick1");
                String tick2=request.getParameter("tick2");
                String tick3=request.getParameter("tick3");
                String tick4=request.getParameter("tick4");
                String tick5=request.getParameter("tick5");
//                out.println(tick1);
                String q="select * from "+table+"";
                Statement stmt = con.createStatement();
                ResultSet set = stmt.executeQuery(q);
//                int count=0;
                while (set.next()){
                    if(tick1.equals(set.getString(7))){
                        count++;
                    } 
                    if(tick2.equals(set.getString(7))){
                        count++;
                    }
                    if(tick3.equals(set.getString(7))){
                        count++;
                    } 
                    if(tick4.equals(set.getString(7))){
                        count++;
                    } 
                    if(tick5.equals(set.getString(7))){
                        count++;
                    } 
                }
//                while (set.next()){
//                    if(tick2.equals(set.getString(7))){
//                        count++;
//                    } 
//                }
//                while (set.next()){
//                    if(tick3.equals(set.getString(7))){
//                        count++;
//                    } 
//                }
//                while (set.next()){
//                    if(tick4.equals(set.getString(7))){
//                        count++;
//                    } 
//                }
//                while (set.next()){
//                    if(tick5.equals(set.getString(7))){
//                        count++;
//                    } 
//                }
                
//                out.println(count);
                if(count>2){

                    
                    String text =""+name+"";
                    File input=new File("D:\\Generate_Pdf\\c1.jpeg");
                    File output=new File("D:\\Generate_Pdf\\"+name+"c10.jpeg");
                    addTextInImage(text,"jpg",input,output);
                    out.println("<h1>Congratulation you are passed download your certificate</h1>");
                    out.println("<h2>Copy this link to download</h2>");
                    out.println("<h1>D:\\Generate_Pdf\\"+name+"c10.jpeg</h1>");
                }
                else{
                    out.println("<h1>You are fail</h1>");
                    
                }
            }catch(Exception e){
                e.printStackTrace();
                System.out.println(e);
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            out.println("</body>");
            out.println("</html>");
        }
    }
    private static void addTextInImage(String text, String type, File source, File destination) throws IOException {
        BufferedImage image=ImageIO.read(source);
        int imagetype ="png".equalsIgnoreCase(type)?BufferedImage.TYPE_INT_ARGB:BufferedImage.TYPE_INT_RGB;
        
        BufferedImage bold = new BufferedImage(image.getWidth(),image.getHeight(),imagetype); 
        
        Graphics2D w=(Graphics2D) bold.getGraphics();
        
        w.drawImage(image,1,2,null);
        AlphaComposite alpha = AlphaComposite.getInstance(AlphaComposite.SRC_OVER,0.9f);
        
        w.setComposite(alpha);
        w.setColor(Color.BLACK);
        w.setFont(new Font(Font.SANS_SERIF,Font.BOLD,65));
        
        FontMetrics fmatrics = w.getFontMetrics();
        Rectangle2D rect = fmatrics.getStringBounds(text, w);
        
        int centerX=(image.getWidth()-(int)rect.getWidth())/2;
        int centerY=image.getHeight()/2;
        
        w.drawString(text, centerX, centerY);
        ImageIO.write(bold, type, destination);
        
        w.dispose();
        System.out.println("Success");
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
