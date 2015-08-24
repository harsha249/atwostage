<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%
 		String name=request.getParameter("uname");
 	    String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
	  
		  String day=request.getParameter("dd");
		  String month=request.getParameter("mm");
		  String year=request.getParameter("yyyy");
		  String dob=year+"/"+month+"/"+day;
		  
 		 String email=request.getParameter("email");
		 
	     java.sql.Date date=new java.sql.Date(0000-00-00); 
		 Connection con=null;
		PreparedStatement ps=null;
		try {
				con=databasecon.getconnection();
                
   				 Statement st=con.createStatement();
		ps=con.prepareStatement("update user_details set fname='"+fname+"',lname='"+lname+"',email='"+email+"',dob='"+dob+"' where uname='"+name+"';"); 
			
			int x=ps.executeUpdate();
			    
			    session.setAttribute("uname",name);
							
			  response.sendRedirect("../home.jsp");
			

		}
							
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
%>

