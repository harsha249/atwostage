

<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con=null;
    try{
        con = databasecon.getconnection();
        String s = request.getParameter("q");
        PreparedStatement ps = con.prepareStatement("update user_details set status='1' where uname='"+s+"';");
        ps.executeUpdate();
    }
    catch(Exception e){
        out.println(e.getMessage());
    }
    finally{
        con.close();
    }
    
    response.sendRedirect("firststage.jsp");
    
    
%>

