<title>sensitive</title>
<%@ page import="java.sql.*,databaseconnection.*"%>


<%
   String uname1= request.getParameter("uname1");
   //out.print(uname1);
   String pass1= request.getParameter("pass1");
   //out.print(pass1);

 try
 {
	con=databasecon.getconnection();
    Statement st=con.createStatement();
	
			ResultSet rs = st.executeQuery("select sid,uname from user_details where uname='"+uname1+"' and password='"+pass1+"'");
			if (rs.next()) 
			{
				
				String userid=rs.getString("sid");
				session.setAttribute("userid",userid);
				
				String s1=rs.getString("uname");
				
				 session.setAttribute("uname",s1);
				 
				 
				 try {
			
					Statement st5=con.createStatement();	
					ResultSet rs5 = st5.executeQuery("select sl_no,cur_date,uname,label from post where uname='"+s1+"' ");
					
					       while(rs5.next()) {

 						int slno1 = rs5.getInt("sl_no");
 						String cur_date1 = rs5.getString("cur_date");
 						String post_uname1 = rs5.getString("uname");
						String label = rs5.getString("label");
		
		try {
                
   				PreparedStatement ps1=con.prepareStatement("insert into temp (sno,date,uname,label)values(?,?,?,?)"); 
		
		        ps1.setInt(1,slno1);
				ps1.setString(2,cur_date1);
				ps1.setString(3,post_uname1);
				ps1.setString(4,label);
				
				
			  ps1.executeUpdate();	
			    
			    
		}
							
		catch (Exception e) {
			e.printStackTrace();
		}
						   }
			}
							
		catch (Exception e1) {
			e1.printStackTrace();
		}
					 
				 

							
		          
				  try {
			
					Statement st2=con.createStatement();	
					ResultSet rs2 = st2.executeQuery("select sl_no,cur_date,uname,label from post where label='non_sensitive' AND uname !='"+s1+"' ");
					
					       while(rs2.next()) {

 						int slno = rs2.getInt("sl_no");
						out.print(slno);
 						String cur_date = rs2.getString("cur_date");
						out.print(cur_date);
 						String post_uname = rs2.getString("uname");
						out.print(post_uname);
						String label = rs2.getString("label");
						out.print(label);
						
		try {
                
   				PreparedStatement ps=con.prepareStatement("insert into temp (sno,date,uname,label)values(?,?,?,?)"); 
		
		        ps.setInt(1,slno);
				ps.setString(2,cur_date);
				ps.setString(3,post_uname);
				ps.setString(4,label);
				
			  ps.executeUpdate();	
			    
		}
							
		catch (Exception e) {
			e.printStackTrace();
		}
		
						
			}
			}
							
		catch (Exception e) {
			e.printStackTrace();
		}
			




				 
				 
				 
				 
				 try {
						
						Statement st1=con.createStatement();
					ResultSet rs1 = st1.executeQuery("select userto from request_status where userfrom='"+s1+"' AND status='Accepted'");
					
						while(rs1.next()) {

 						String userto = rs1.getString("userto");
										
		          
				  try {
			
					Statement st2=con.createStatement();	
				ResultSet rs2 = st2.executeQuery("select sl_no,cur_date,uname,label from post where uname='"+userto+"' AND label='sensitive' ");
					
					       while(rs2.next()) {

 						int slno = rs2.getInt("sl_no");
						out.print(slno);
 						String cur_date = rs2.getString("cur_date");
						out.print(cur_date);
 						String post_uname = rs2.getString("uname");
						out.print(post_uname);
						String label = rs2.getString("label");
						out.print(label);
						
		try {
                
   				PreparedStatement ps=con.prepareStatement("insert into temp (sno,date,uname,label)values(?,?,?,?)"); 
		
		        ps.setInt(1,slno);
				ps.setString(2,cur_date);
				ps.setString(3,post_uname);
				ps.setString(4,label);
				
				
			  ps.executeUpdate();	
			    
		}
							
		catch (Exception e) {
			e.printStackTrace();
		}
		
						
			}
			}
							
		catch (Exception e) {
			e.printStackTrace();
		}
					
					} 
					} 
					catch (Exception e) {
					out.println("Unable To Display image");
					out.println("Image Display Error=" + e.getMessage());
					return;
						} 
				 
				 
				 
				//Class.forName("com.mysql.jdbc.Driver");
				
				//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social","root", "sweet16");
				 
			 
				 
				    try {
						
						Statement st1=con.createStatement();
					ResultSet rs1 = st1.executeQuery("select userfrom from request_status where userto='"+s1+"' AND status='Accepted'");
					
						while(rs1.next()) {

 						String userfrom = rs1.getString("userfrom");
										
		          
				  try {
			
					Statement st2=con.createStatement();	
					ResultSet rs2 = st2.executeQuery("select sl_no,cur_date,uname,label from post where uname='"+userfrom+"' AND label='sensitive' ");
					
					       while(rs2.next()) {

 						int slno = rs2.getInt("sl_no");
						out.print(slno);
 						String cur_date = rs2.getString("cur_date");
						out.print(cur_date);
 						String post_uname = rs2.getString("uname");
						out.print(post_uname);
						String label = rs2.getString("label");
						out.print(label);
		
					
		try {
                
   				PreparedStatement ps=con.prepareStatement("insert into temp (sno,date,uname,label)values(?,?,?,?)"); 
		
		        ps.setInt(1,slno);
				ps.setString(2,cur_date);
				ps.setString(3,post_uname);
				ps.setString(4,label);
				
			  ps.executeUpdate();	
			    
			    
			//response.sendRedirect("../home.jsp");				
		}
							
		catch (Exception e) {
			e.printStackTrace();
		}
		
						
			}
			}
							
		catch (Exception e) {
			e.printStackTrace();
		}
					
						
					} 
					} 
					catch (Exception e) {
					out.println("Unable To Display image");
					out.println("Image Display Error=" + e.getMessage());
					return;
						} 
				 
				 
				 				 

			 response.sendRedirect("../home.jsp");
				 
			}
			else
			{
				 response.sendRedirect("../loginerror.jsp"); 
			}
				/* 
				if((s1.equals(uname1))&&(s2.equals(pass1)))
					{
						//response.sendRedirect("ques.jsp");
						out.println(s1); out.println(s2);
					}
				else
					{
					out.println("Erro page"); 
					    }*/
			
   }
	catch (Exception e) {
			
			e.printStackTrace();
		}

%>

