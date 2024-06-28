<%@ page contentType="application/pdf" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
<%@ page import="com.itextpdf.text.*" %>
<%@ page import="com.itextpdf.text.pdf.*" %>
<%@ page import="java.io.*" %>

<%
    int consultaId = Integer.parseInt(request.getParameter("id"));

    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition", "attachment; filename=reporte_consultas.pdf");

    Document document = new Document();
    try {
        PdfWriter.getInstance(document, response.getOutputStream());
        document.open();

        // Añadir el logotipo
        String imageUrl = application.getRealPath("/") + "imagenes/logoperfil.png";
        Image logo = Image.getInstance(imageUrl);
        logo.scaleToFit(100, 100);
        logo.setAlignment(Element.ALIGN_LEFT);
        document.add(logo);

        // Añadir título y detalles de la clínica
        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);
        Paragraph title = new Paragraph("Clínica Veterinaria Mascott\n", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        document.add(title);

        Font clinicDetailsFont = FontFactory.getFont(FontFactory.HELVETICA, 12);
        Paragraph clinicDetails = new Paragraph("Calle 15 #9-54 Sogamoso-Boyacá\nUrgencias 24 horas +57 3114569768\nclinicamascott@gmail.com\n\n", clinicDetailsFont);
        clinicDetails.setAlignment(Element.ALIGN_CENTER);
        document.add(clinicDetails);

        // Obtener los datos de la base de datos
        String propietario = "";
        String cedula = "";
        String mascota = "";
        String edad = "";
        String raza = "";
        String tratamiento = "";
        String medico = "";
        String motivo = "";
        String fecha = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/veterinaria", "root", "");
            Statement stmt = con.createStatement();
            String query = "SELECT p.nombres AS propietario, p.numdocumento AS cedula, m.nombre AS mascota, m.edad, m.raza, c.tratamiento, med.nombres AS medico, c.motivo, c.fecha " +
                           "FROM Consulta c " +
                           "JOIN Propietario p ON c.propietario_id = p.id " +
                           "JOIN Mascota m ON c.mascota_id = m.id " +
                           "JOIN Medico med ON c.medico_id = med.id " +
                           "WHERE c.id = " + consultaId;
            ResultSet rs = stmt.executeQuery(query);

            if (rs.next()) {
                propietario = rs.getString("propietario");
                cedula = rs.getString("cedula");
                mascota = rs.getString("mascota");
                edad = rs.getString("edad");
                raza = rs.getString("raza");
                tratamiento = rs.getString("tratamiento");
                medico = rs.getString("medico");
                motivo = rs.getString("motivo");
                fecha = rs.getString("fecha");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Añadir detalles del propietario y la mascota
        PdfPTable ownerTable = new PdfPTable(2);
        ownerTable.setWidthPercentage(100);
        ownerTable.setSpacingBefore(10f);
        ownerTable.setSpacingAfter(10f);
        float[] ownerColumnWidths = {1f, 2f};
        ownerTable.setWidths(ownerColumnWidths);

        Font cellFont = FontFactory.getFont(FontFactory.HELVETICA, 12);
        ownerTable.addCell(new PdfPCell(new Phrase("Propietario:", cellFont)));
        ownerTable.addCell(new PdfPCell(new Phrase(propietario, cellFont)));
        ownerTable.addCell(new PdfPCell(new Phrase("Cédula:", cellFont)));
        ownerTable.addCell(new PdfPCell(new Phrase(cedula, cellFont)));
        ownerTable.addCell(new PdfPCell(new Phrase("Mascota:", cellFont)));
        ownerTable.addCell(new PdfPCell(new Phrase(mascota, cellFont)));
        ownerTable.addCell(new PdfPCell(new Phrase("Edad:", cellFont)));
        ownerTable.addCell(new PdfPCell(new Phrase(edad, cellFont)));
        ownerTable.addCell(new PdfPCell(new Phrase("Raza:", cellFont)));
        ownerTable.addCell(new PdfPCell(new Phrase(raza, cellFont)));

        document.add(ownerTable);

        // Añadir detalles de la consulta
        PdfPTable consultationTable = new PdfPTable(2);
        consultationTable.setWidthPercentage(100);
        consultationTable.setSpacingBefore(10f);
        consultationTable.setSpacingAfter(10f);
        float[] consultationColumnWidths = {1f, 2f};
        consultationTable.setWidths(consultationColumnWidths);

        consultationTable.addCell(new PdfPCell(new Phrase("Motivo de la Consulta:", cellFont)));
        consultationTable.addCell(new PdfPCell(new Phrase(motivo, cellFont)));
        consultationTable.addCell(new PdfPCell(new Phrase("Tratamiento:", cellFont)));
        consultationTable.addCell(new PdfPCell(new Phrase(tratamiento, cellFont)));
        consultationTable.addCell(new PdfPCell(new Phrase("Médico:", cellFont)));
        consultationTable.addCell(new PdfPCell(new Phrase(medico, cellFont)));
        consultationTable.addCell(new PdfPCell(new Phrase("Fecha de la Consulta:", cellFont)));
        consultationTable.addCell(new PdfPCell(new Phrase(fecha, cellFont)));

        document.add(consultationTable);

        // Pie de página con los datos de contacto
        Font footerFont = FontFactory.getFont(FontFactory.HELVETICA, 10);
        Paragraph footer = new Paragraph("\nUrgencias 24 horas +57 3114569768\nCalle 15 #9-54 Sogamoso-Boyacá\nclinicamascott@gmail.com", footerFont);
        footer.setAlignment(Element.ALIGN_CENTER);
        document.add(footer);

        document.close();
    } catch (DocumentException e) {
        e.printStackTrace();
    } catch (IOException e) {
        e.printStackTrace();
    }
%>