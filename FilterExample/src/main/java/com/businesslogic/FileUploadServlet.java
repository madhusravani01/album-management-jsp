package com.businesslogic;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.businesslogic.connection.UserConnection;

@WebServlet("/FileUploadServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

public class FileUploadServlet extends HttpServlet {
	Connection connect=null;
	Statement stmt=null;
	ResultSet rs=null;
    /*
     create images folder at, C:\Users\Dharmesh Mourya\Documents\NetBeansProjects\ImageProject\build\web\images
     */

    public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<link rel='stylesheet' href='css/bootstrap.css'></link>");
		out.println("<marquee><h2 class='text-primary'>Image inserted Suceessfully</h2></marquee>");
		out.println("<body style='background-color:#ca9862;'>");


        int id = Integer.parseInt(request.getParameter("id"));
        String category = request.getParameter("category");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        Part part = request.getPart("file");//
        String fileName = extractFileName(part);//file name

        /**
         * *** Get The Absolute Path Of The Web Application ****
         */
        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        System.out.println("applicationPath:" + applicationPath);
        File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
        }
        String savePath = uploadPath + File.separator + fileName;
        System.out.println("savePath: " + savePath);
        String sRootPath = new File(savePath).getAbsolutePath();
        System.out.println("sRootPath: " + sRootPath);
        part.write(savePath + File.separator);
        File fileSaveDir1 = new File(savePath);
        /*if you may have more than one files with same name then you can calculate some random characters
         and append that characters in fileName so that it will  make your each image name identical.*/
        dbFileName = UPLOAD_DIR + File.separator + fileName;
        part.write(savePath + File.separator);
        //out.println(id+" "+firstName+" "+lastName+" "+fileName+" "+savePath);
        /*
         You need this loop if you submitted more than one file
         for (Part part : request.getParts()) {
         String fileName = extractFileName(part);
         part.write(savePath + File.separator + fileName);
         }*/
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
			connect=UserConnection.getConnection();
            PreparedStatement pst = connect.prepareStatement("insert into image_table values(?,?,?,?,?)");
            pst.setInt(1, id);
            pst.setString(2, category);
            pst.setString(3, firstName);
            pst.setString(4, lastName);
            pst.setString(5, dbFileName);
           
            pst.executeUpdate();
            out.println("<center><h1>Image inserted Succesfully......</h1></center>");
            //out.println("<center><button class='btn btn-outline-success d-block' background-color: #4CAF50;><a href='display.jsp?id=" + id + "'>Display All Images</a></center>");
            out.println("<center><button   position: absolute;\r\n"
            		+ "  top: 50%;\r\n"
            		+ "  left: 50%;\r\n"
            		+ "  transform: translate(-50%, -50%);\r\n"
            		+ "  -ms-transform: translate(-50%, -50%);\r\n"
            		+ "  background-color: #f1f1f1;\r\n"
            		+ "  color: black;\r\n"
            		+ "  font-size: 16px;\r\n"
            		+ "  padding: 16px 30px;\r\n"
            		+ "  border: none;\r\n"
            		+ "  cursor: pointer;\r\n"
            		+ "  border-radius: 5px;\r\n"
            		+ "  text-align: center;;><a href='display.jsp?id=" + id + "'>Display All Images</a></center>");
        } catch (Exception e) {
            out.println(e);
        }

    }
    // file name of the upload file is included in content-disposition header like this:
    //form-data; name="dataFile"; filename="PHOTO.JPG"

    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}