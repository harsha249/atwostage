<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.zip.*"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%

String saveFile="";
String contentType = request.getContentType();
 if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0))
  {
    DataInputStream in = new DataInputStream(request.getInputStream());
    int formDataLength = request.getContentLength();
    byte dataBytes[] = new byte[formDataLength];
    int byteRead = 0;
    int totalBytesRead = 0;
      while(totalBytesRead < formDataLength)
	  {
          byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
          totalBytesRead += byteRead;
        }
    String file = new String(dataBytes);
    out.println("file is :"+file);
    saveFile = file.substring(file.indexOf("filename=\"") + 10);
    saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
    saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
	int lastIndex = contentType.lastIndexOf("=");
	String boundary = contentType.substring(lastIndex + 1,contentType.length());
	int pos;
	pos = file.indexOf("filename=\"");
	pos = file.indexOf("\n", pos) + 1;
	pos = file.indexOf("\n", pos) + 1;
	pos = file.indexOf("\n", pos) + 1;
	int boundaryLocation = file.indexOf(boundary, pos) - 4;
	int startPos = ((file.substring(0, pos)).getBytes()).length;
	int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
	File ff = new File(saveFile);
	FileOutputStream fileOut = new FileOutputStream(ff);
	fileOut.write(dataBytes, startPos, (endPos - startPos));
	fileOut.flush();
	fileOut.close();
%>

<!--	<Br>
    <table border="2"><tr><td><b>You have successfully upload the file:</b>
				out.println(saveFile);</td></tr>
		</table>
-->

<%
	Connection connection = null;
	String connectionURL = "jdbc:mysql://localhost:3306/social";
	ResultSet rs = null;
	PreparedStatement psmnt = null;
	FileInputStream fis;
		String uname=(String)session.getAttribute("uname");	
		String cur_date=(String)session.getAttribute("sysdate");	
		out.println(uname);
		out.println(cur_date);
		String label="sensitive";
	try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(connectionURL, "root", "root");
			File f = new File(saveFile);
			psmnt = connection.prepareStatement("insert into post(uname,post,cur_date,label) values(?,?,?,?)");
			
			psmnt.setString(1,uname);psmnt.setString(3,cur_date);psmnt.setString(4,label);
			fis = new FileInputStream(f);
			psmnt.setBinaryStream(2, (InputStream)fis, (int)(f.length()));
			int s = psmnt.executeUpdate();
			if(s>0)
			 {
				
				 response.sendRedirect("../label.jsp");
				}
			else
				{
					System.out.println("Error!");
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


%>