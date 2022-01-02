<%-- 
    Document   : update
    Created on : Jan 2, 2022, 12:14:58 PM
    Author     : Rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@page import="com.sun.xml.ws.security.trust.STSIssuedTokenFeature"%>

<%
    if(request.getParameter("submit")!=null);
    {
        String STUDENT_NO = request.getParameter("STUDENT_NO");
        String STUDENT_NAME = request.getParameter("STUDENT_NAME");
        String STUDENT_DOB = request.getParameter("STUDENT_DOB");
        String STUDENT_DOJ = request.getParameter("STUDENT_DOJ");
        
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con=(java.sql.Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","");
       
        String sql =("update student set STUDENT_NAME = ?,STUDENT_DOB = ?,STUDENT_DOJ = ? where STUDENT_NO = ? ");
        pst= con.prepareStatement(sql);
        pst.setString(1, STUDENT_NO);
        pst.setString(2, STUDENT_NAME);
        pst.setString(3, STUDENT_DOB);
        pst.setString(4, STUDENT_DOJ);
        pst.executeUpdate();
        %>
        
        <script>
            
           alert("record Updated successfully"); 
            
        </script>
        
        
        <%
            
            }
    %>








<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="bootstrap-5.1.3-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
       
    </head>
    <body>
       
    
                <h1 style="text-align: center;">Student Update</h1>
                <form class="form-horizontal templatemo-create-account templatemo-container" action="#" method="post">
                    
                   <%
                        
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
                        Statement st;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=(java.sql.Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","");
                        String STUDENT_NO = request.getParameter("STUDENT_NO");
                        pst= con.prepareStatement("select * from student where STUDENT_NO= ?");
                        pst.setString(1, STUDENT_NO);
                        rs = pst.executeQuery();
                        
                        while (rs.next()) 
                        
                        {                                
                       
                        %>
                   
                   
                        <div class="form-group">
                          <div class="col-md-12">		          	
                            <label for="first_name" class="control-label">STUDENT NO</label>
                            <input type="text" class="form-control" name="STUDENT_NO" id="STUDENT_NO" value="<%=rs.getString("STUDENT_NO") %>" required placeholder="Student Name" autocomplete="off" >
                        </div>  
                        </div>
                             
                        <br>
                        
                        <div class="form-group">
                          <div class="col-md-12">		          	
                            <label for="first_name" class="control-label">STUDENT NAME</label>
                            <input type="text" class="form-control" name="STUDENT_NAME" id="STUDENT_NAME" value="<%=rs.getString("STUDENT_NAME") %>"  required placeholder="Student Name" autocomplete="off" >
                        </div>  
                        </div>
                        
                        <br>
                        <div class="form-group">
                          <div class="col-md-12">		          	
                            <label for="first_name" class="control-label">STUDENT_DOB</label>
                            <input type="date" class="form-control" name="STUDENT_DOB" id="STUDENT_DOB" value="<%=rs.getString("STUDENT_DOB") %>"  required placeholder="Student Name" autocomplete="off" >
                        </div>  
                        </div>
                        
                        <br>
                         <div class="form-group">
                          <div class="col-md-12">		          	
                            <label for="first_name" class="control-label">STUDENT_DOJ</label>
                            <input type="date" class="form-control" name="STUDENT_DOJ" id="STUDENT_DOJ" value="<%=rs.getString("STUDENT_DOJ") %>" required placeholder="Student Name" autocomplete="off" >
                        </div>  
                        </div>
                        <%
                            
                            }
                            
                            %>
                    
                  
                        
                        <br>
                        <div class="form-group">
                          <div class="col-md-12">
                            <input type="submit" name="submit" value="submit" class="btn btn-outline-warning" ><br><br>
                            <input type="button" class="btn btn-outline-danger" name="Back" href="index.jsp" value="back">
                          </div>
                        </div>	
                        <br>
                     			    	
                  </form>		      
            
    </body>
</html>
