<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"  %>
<%@ page import="java.sql.*,databaseconnection.*"%>
    <%
		String userfrom=(String)session.getAttribute("uname");	
		
		String userto=request.getQueryString();

		String status="requested";

		 Connection con=null;

try {
				con=databasecon.getconnection();
                
   				 Statement st=con.createStatement();
   		 PreparedStatement ps=con.prepareStatement("insert into request_status(userfrom,userto,status)values(?,?,?)"); 
				ps.setString(1,userfrom);
				ps.setString(2,userto);
				ps.setString(3,status);

			  ps.executeUpdate();	
			    
			  response.sendRedirect("../home.jsp");
			
		}
							
		catch (Exception e) {
			e.printStackTrace();
		}
		
		finally
		{
           	con.close();
			
		}

%>