<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<%@ page import="java.sql.*,databaseconnection.*"%>
 
        <%
		
		String accept=request.getQueryString();
		String userto=(String)session.getAttribute("userto");
		String userfrom=(String)session.getAttribute("userfrom");
		Connection con=null;
		PreparedStatement ps=null;
		
	if(accept!=null)
		{

	try {
	
	con=databasecon.getconnection();
                
   	Statement stmt=con.createStatement();

 ps=con.prepareStatement("update request_status set status='"+accept+"' where userto='"+userto+"' AND userfrom='"+userfrom+"';"); 
		
			int x=ps.executeUpdate();
			    
			  response.sendRedirect("../myprofile.jsp");


} 
	catch (Exception e) {

	out.println("Unable To Display image");

	out.println("Image Display Error=" + e.getMessage());

	return;

	}


finally {

		try {
			con.close();
			} 
		catch (SQLException e) {
			e.printStackTrace();
			}
		}
}



	else
		{

	try {
	
	con=databasecon.getconnection();
                
   	Statement stmt=con.createStatement();

 ps=con.prepareStatement("Delete from request_status where userto='"+userto+"' AND userfrom='"+userfrom+"';"); 
		
			int x=ps.executeUpdate();
			    
			  response.sendRedirect("../myprofile.jsp");


} 
	catch (Exception e) {

	out.println("Unable To Display image");

	out.println("Image Display Error=" + e.getMessage());

	return;

	}


finally {

		try {
			con.close();
			} 
		catch (SQLException e) {
			e.printStackTrace();
			}
		}
}
	

	
	
	%>
        
     

