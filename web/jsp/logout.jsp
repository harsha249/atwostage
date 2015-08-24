<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.sql.*,databaseconnection.*"%>
    <%
		
Connection con = null;
Statement stmt = null;
ResultSet rs1 = null;
PreparedStatement ps=null;
try {
	
con=databasecon.getconnection();

stmt = con.createStatement();

		ps=con.prepareStatement("truncate temp;"); 
			int x=ps.executeUpdate();

		response.sendRedirect("../index.html");
} 





catch (Exception e) {

out.println("Unable To Display image");

out.println("Image Display Error=" + e.getMessage());

return;

} finally {

try {



stmt.close();

con.close();

} catch (SQLException e) {

e.printStackTrace();

}

}


%>