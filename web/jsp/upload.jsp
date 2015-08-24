<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>



<html>
<head>
</head>
<body>
<%

ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName =context.getRealPath("\\Gallery");
		String paramname=null;
		String file=null;
		String a=null,b=null,c=null,d=null,e=null,f=null,g=null,h=null,i=null,j=null,k=null,l=null,img=null;
		String sts = "Hai Everybody";
		String z2 = (String) session.getAttribute("z1");
		//int count=0,buycount=0,rating=0,review=0;
		Connection con=null;		
		//name=(String)session.getAttribute("name");
		//email=(String)session.getAttribute("email");
		/*java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;*/
	
        
		
		  
	 
	 	
 
		File file1 = null;
			
		
		try {
			
			MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				
				if(paramname.equalsIgnoreCase("image_file"))
				{
					i=multi.getParameter(paramname);
				}
				
				}
					
			int p = 0;
	Enumeration files = multi.getFileNames();	
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
		
		
		if(paramname != null)
		{
			p = 9;
			img = multi.getFilesystemName(paramname);
			String fPath = context.getRealPath("\\Gallery\\"+img);
			file1 = new File(fPath);
			FileInputStream fs = new FileInputStream(file1);
			list.add(fs);
		}		
	}
	        FileInputStream fs1 = null;
            //name=dirName+"\\Gallery\\"+image;
						
			String uname=(String)session.getAttribute("uname");	
			con=databasecon.getconnection(); 

			PreparedStatement ps=con.prepareStatement("insert into file(uname,file_data) values(?,?)");
				
                        ps.setString(1,uname);
	
			fs1 = (FileInputStream)list.get(0);
			ps.setBinaryStream(2,fs1,fs1.available());
			
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("../index.html?message=success");

			}
			else
			{
				response.sendRedirect("../index.html?message=fail");
			}
				
		} 
		catch (Exception ex) 
		{
			out.println(ex.getMessage());
		}
	
 %>
</body>
</html>