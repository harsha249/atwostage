<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%
        String name=request.getParameter("uname");
		String pass=request.getParameter("sex"); 
		
		  String uname=(String)session.getAttribute("uname");	
		  String day=request.getParameter("dd");
		  String month=request.getParameter("mm");
		  String year=request.getParameter("yyyy");
		  String dob=year+"/"+month+"/"+day;
		  
 		
		 
	     java.sql.Date date=new java.sql.Date(0000-00-00); 
		 Connection con=null;
		   
		try {
				con=databasecon.getconnection();
                
   				 Statement st=con.createStatement();
					ResultSet rs = st.executeQuery("SELECT eventname FROM events where eventname='"+name+"'");
						if (rs.next()) 
							{
								//String s1=rs.getString("uname");
								
								 response.sendRedirect("userexisterror.jsp");
								 
//				              session.setAttribute("sex1",sex);
				            
						}
						
					else
					{
   		 PreparedStatement ps=con.prepareStatement("insert into events values(?,?,?,?)"); 
				ps.setString(1,uname);
				ps.setString(2,pass);
				
				ps.setString(3,dob);
                                ps.setString(4,name);
			
			  ps.executeUpdate();	
			    
			    session.setAttribute("uname",name);
							
			  response.sendRedirect("index.html?message=success");
			
				}
		}
							
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
%>

