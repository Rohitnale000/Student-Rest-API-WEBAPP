

<%@page import="java.sql.*" %> 

<%
      
        String STUDENT_NO = request.getParameter("STUDENT_NO");
       
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con=(java.sql.Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","");
       
        String sql =("delete from student where STUDENT_NO = ?");
        pst= con.prepareStatement(sql);
        pst.setString(1, STUDENT_NO);
        
        pst.executeUpdate();
        
      
        %>
        
        <script>
            
           alert("record Deleted successfully"); 
            
        </script>
        
        
     

