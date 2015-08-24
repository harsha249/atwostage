<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%
        String name=request.getParameter("uname");
		String pass=request.getParameter("img"); 
		
		  String uname=(String)session.getAttribute("uname");	
		  String year=request.getParameter("sex");
		 
 		String status="complete";
		 
	     java.sql.Date date=new java.sql.Date(0000-00-00); 
		 Connection con=null;
		   
		try {
				con=databasecon.getconnection();
                
   				 Statement st=con.createStatement();
					
					
   		                 PreparedStatement ps=con.prepareStatement("insert into rating values(?,?,?,?)"); 
				ps.setString(1,name);
				ps.setString(2,pass);
				
				ps.setString(3,year);
                                 ps.setString(4,status);
			
			       ps.executeUpdate();	
			    
			    session.setAttribute("uname",name);
							
			        response.sendRedirect("home.jsp?message=success");
			
				
		}
							
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
%>

