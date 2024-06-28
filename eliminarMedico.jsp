<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection con = null;
    PreparedStatement ps = null;

    try {
        String url = "jdbc:mysql://localhost:3306/veterinaria";
        String driver = "com.mysql.cj.jdbc.Driver";
        String user = "root";
        String password = "";
        Class.forName(driver);
        con = DriverManager.getConnection(url, user, password);

        ps = con.prepareStatement("DELETE FROM Medico WHERE id=?");
        ps.setInt(1, id);
        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
%>
            <script>
                alert("Médico eliminado exitosamente.");
                window.location.href = 'adicionarMedico.jsp';
            </script>
<%
        } else {
%>
            <script>
                alert("Error: No se pudo eliminar el médico.");
                window.location.href = 'adicionarMedico.jsp';
            </script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
        <script>
            alert("Error al eliminar el médico.");
            window.location.href = 'adicionarMedico.jsp';
        </script>
<%
    } finally {
        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>