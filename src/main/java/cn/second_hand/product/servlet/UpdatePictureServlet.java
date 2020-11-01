package cn.second_hand.product.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.io.FilenameUtils;

import com.alibaba.fastjson.JSON;



public class UpdatePictureServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	 /**
	  * 实现多文件的同时上传
	  */
	 @Override
	 protected void service(HttpServletRequest request, HttpServletResponse response)
	   throws ServletException, IOException {
	  String savePath = this.getServletConfig().getServletContext().getRealPath("/")+"upload/";
	  DiskFileUpload upload = new DiskFileUpload();
	        List fileList = null;   
	        String fileName = null;
	        try {   
	          fileList = upload.parseRequest(request);
	        } catch (FileUploadException ex) { 
	            System.out.println("No files uploaded"); 
	            return;   
	        } 
	        Iterator<FileItem> it = fileList.iterator();    
	        while(it.hasNext()){   
	            FileItem item =  it.next();   
	            if(!item.isFormField()){   
	                String name = item.getName(); 
	                if(name == null || name.trim().equals("") || item.getSize()==0.0)   
	                    continue;
	             fileName =  UUID.randomUUID().toString() + "." 
	                    + FilenameUtils.getExtension(name);
	                File saveFile = new File(savePath+fileName);   
	                try {   
	                    item.write(saveFile);  
	                } catch (Exception e) {   
	                    e.printStackTrace();   
	                }   
	            }   
	        }
	        
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        request.setCharacterEncoding("UTF-8");
	        PrintWriter out = response.getWriter();
	        out.print("/upload/" + fileName); 
	        out.close();
	 }

	
	} 
