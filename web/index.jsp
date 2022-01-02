
<%@page import="com.sun.xml.ws.security.trust.STSIssuedTokenFeature"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
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
       
        String sql =("INSERT INTO student (STUDENT_NO,STUDENT_NAME,STUDENT_DOB,STUDENT_DOJ)values(?,?,?,?)");
        pst= con.prepareStatement(sql);
        pst.setString(1, STUDENT_NO);
        pst.setString(2, STUDENT_NAME);
        pst.setString(3, STUDENT_DOB);
        pst.setString(4, STUDENT_DOJ);
        pst.executeUpdate();
        %>
        
        <script>
            
           alert("record Added successfully"); 
            
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
       
        
        <div class="templatemo-bg-image-2">
         <div class="container">
           <div class="col-md-6">
                <h1 style="text-align: center;">Student Information</h1>
                <form class="form-horizontal templatemo-create-account templatemo-container" action="index.jsp"   method="post">
                    <div class="form-inner">
                        
                        <div class="form-group">
                          <div class="col-md-12">		          	
                            <label for="first_name" class="control-label">STUDENT NO</label>
                            <input type="text" class="form-control" name="STUDENT_NO" id="STUDENT_NO" required placeholder="Student Name" autocomplete="off" >
                        </div>  
                        </div>
                        
                        <br>
                        
                        <div class="form-group">
                          <div class="col-md-12">		          	
                            <label for="first_name" class="control-label">STUDENT NAME</label>
                            <input type="text" class="form-control" name="STUDENT_NAME" id="STUDENT_NAME" required placeholder="Student Name" autocomplete="off" >
                        </div>  
                        </div>
                        
                        <br>
                        <div class="form-group">
                          <div class="col-md-12">		          	
                            <label for="first_name" class="control-label">STUDENT_DOB</label>
                            <input type="date" class="form-control" name="STUDENT_DOB" id="STUDENT_DOB" required placeholder="Student Name" autocomplete="off" >
                        </div>  
                        </div>
                        
                        <br>
                         <div class="form-group">
                          <div class="col-md-12">		          	
                            <label for="first_name" class="control-label">STUDENT_DOJ</label>
                            <input type="date" class="form-control" name="STUDENT_DOJ" id="STUDENT_DOJ" required placeholder="Student Name" autocomplete="off" >
                        </div>  
                        </div>
                        <br>
                        <div class="form-group">
                          <div class="col-md-12">
                            <input type="submit" name="submit" value="submit" class="btn btn-outline-warning" >
                            <input type="Reset" name="Reset" value="Reset" class="btn btn-outline-success"><br><br>
                          </div>
                        </div>	
                        <br>
                        
                    </div>				    	
                  </form>		      
            </div>
        </div>
    </div>
        
        <div class="col-md-6">
            <div class="pael-body">
                <table id="tbl" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                    
                    <thead>
                        <tr>
                             <th>STUDENT_NO</th>
                             <th>STUDENT_NAME</th>
                             <th>STUDENT_DOB</th>
                             <th>STUDENT_DOJ</th>
                             <th>EDIT</th>
                             <th>DELETE</th>
                        </tr>
                        
                        <%
                            
                            Connection con;
                           PreparedStatement pst;
                           ResultSet rs;

                           Class.forName("com.mysql.jdbc.Driver");
                           con=(java.sql.Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","");

                            String query = "select * from student";
                            Statement st = con.createStatement();
                            
                            rs = st.executeQuery(query);
                             
                             
                            
                            while (rs.next()) 
                            {                                    
                                String STUDENT_NO = rs.getString("STUDENT_NO");
                                
                                
                         %>
                        
                        
                        
                        <tr>
                            <td><%=rs.getString("STUDENT_NO") %></td>
                            <td><%=rs.getString("STUDENT_NAME") %></td>
                            <td><%=rs.getString("STUDENT_DOB") %></td>
                            <td><%=rs.getString("STUDENT_DOJ") %></td>
                            <td><a href="update.jsp?STUDENT_NO<%=STUDENT_NO%>">EDIT</a></td>
                            <td><a href="delete.jsp?STUDENT_NO<%=STUDENT_NO%>">DELETE</a></td>
                        </tr>
                        <%
                            
                            }
                            
                            %>
                    </thead>
                    
                </table>
            </div>     
        </div>
        
    </body>
</html>
