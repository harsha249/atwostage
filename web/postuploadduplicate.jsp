<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.sql.*,databaseconnection.*"%>

<%
	Connection connection = null;
	Statement stmt = null;
	ResultSet rs1 = null;
	String connectionURL = "jdbc:mysql://localhost:3306/social";
	ResultSet rs = null;
	PreparedStatement psmnt = null;
	String label=request.getParameter("drop");
	String uname=(String)session.getAttribute("uname");	
	int sl_no=0;
	
	
  if(label.equals("non_sensitive"))
			 {
	 try
		{
			connection=databasecon.getconnection();
			stmt = connection.createStatement();
			rs1 = stmt.executeQuery("select max(sl_no) AS `maxid` from post where uname='"+uname+"' ");

			   while(rs1.next()) {
				 sl_no = rs1.getInt("maxid");
				 
			psmnt = connection.prepareStatement("update post set label='"+label+"' where sl_no='"+sl_no+"';");
		    int s = psmnt.executeUpdate();
			if(s>0)
			 {
				
				 response.sendRedirect("../myprofile.jsp");
				 
				}
				
			 
			
	
			else
				{
					System.out.println("Error!");
				}
								} 
				 
		  }		
		  catch(Exception e)
			{
				e.printStackTrace();
			}
			finally
				{
						connection.close();
					}
					
			 }
				
			else
				{
					response.sendRedirect("../home.jsp");
				}			
				
			






%>