<%-- 
    Document   : getMascota
    Created on : 27/06/2024, 7:59:15?a. m.
    Author     : BRAYAN
--%>

<%@page import="java.sql.*"%>

<%
    String propietarioId = request.getParameter("propietario_id");
    if (propietarioId != null && !propietarioId.isEmpty()) {
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            try {
                String url = "jdbc:mysql://localhost:3306/veterinaria";
                String driver = "com.mysql.cj.jdbc.Driver";
                String user = "root";
                String password = "";
                Class.forName(driver);
                con = DriverManager.getConnection(url, user, password);
                
                String sql ="SELECT id, nombre FROM  mascota WHERE  propietario_id=?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, Integer.parseInt(propietarioId));
                rs = ps.executeQuery();
                
                while  (rs.next()){
                out.println("<option value= '"+rs.getInt("id")+"'>"+rs.getString("nombre")+"</option>");
                
    }
                
            
                } catch (Exception e) {
                }finally{
                if (rs != null)try {rs.close();}catch(SQLException e){e.printStackTrace();} 
                if (ps != null)try {ps.close();}catch(SQLException e){e.printStackTrace();} 
                if (con != null)try {con.close();}catch(SQLException e){e.printStackTrace();} 
                        
                    }
    }
            
        
    

%>