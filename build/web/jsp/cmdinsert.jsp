<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%
        String command=request.getParameter("cmd");
		//out.print(command);
		String userid=session.getAttribute("userid").toString();
		//out.print(userid); 
		String imageid=session.getAttribute("n").toString();
		//out.print(imageid);
		String unameis=request.getQueryString();
		//out.print("unameis ::"+unameis);
		 Connection con=null;
		try {
				con=databasecon.getconnection();
                
   				PreparedStatement ps=con.prepareStatement("insert into commands (userid,command,imageid)values(?,?,?)"); 
		
		        ps.setString(1,unameis);
				ps.setString(2,command);
				ps.setString(3,imageid);
				
				
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

