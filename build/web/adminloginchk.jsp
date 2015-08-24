<%@ page  import="java.sql.*" import="databaseconnection.*"%>

<%
String aa=null;
String ab=null;
String idu = request.getParameter("uname1");

String passu= request.getParameter("pass1");


try
{
Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();
//String sql="select uid,name,userAES_DECRYPT(email,'key') from user";
String sss1 = "select * from admin where uname='"+idu+"' && pass='"+passu+"'";

ResultSet rs1=st1.executeQuery(sss1);
if(rs1.next())
{
 aa=rs1.getString(1);
session.setAttribute("aa1",aa);
ab=rs1.getString(2);
session.setAttribute("ab1",ab);


response.sendRedirect("admin_home.jsp?message=success");
}
else
{

response.sendRedirect("admin_home.jsp?message=fail");
}
}
catch(Exception  e1)
{
out.println(e1.getMessage());
}
%>
