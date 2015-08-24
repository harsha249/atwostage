<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%
        String name=request.getParameter("uname");
		String pass=request.getParameter("pass"); 
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String sex=request.getParameter("sex");
		  
		  String day=request.getParameter("dd");
		  String month=request.getParameter("mm");
		  String year=request.getParameter("yyyy");
		  String dob=year+"/"+month+"/"+day;
		  
 		 String email=request.getParameter("email");
		 
	     java.sql.Date date=new java.sql.Date(0000-00-00); 
		 Connection con=null;
		   
		try {
				con=databasecon.getconnection();
                
   				 Statement st=con.createStatement();
					ResultSet rs = st.executeQuery("SELECT uname FROM user_details where uname='"+name+"';");
						if (rs.next()) 
							{
								//String s1=rs.getString("uname");
								
								 response.sendRedirect("../userexisterror.jsp");
								 
//				              session.setAttribute("sex1",sex);
				            
						}
						
					else
					{
   		 PreparedStatement ps=con.prepareStatement("insert into user_details(uname,password,fname,lname,email,dob,sex)values(?,?,?,?,?,?,?)"); 
				ps.setString(1,name);
				ps.setString(2,pass);
				ps.setString(3,fname);
				ps.setString(4,lname);
				ps.setString(5,email);
				ps.setString(6,dob);
				ps.setString(7,sex);
				
			  ps.executeUpdate();	
			    
			    session.setAttribute("uname",name);
							
			  response.sendRedirect("../uploadimg.jsp");
			
				}
		}
							
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
%>

