<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.text.ParseException,java.lang.*,java.sql.*, java.util.*,java.util.Date,java.text.*,java.text.SimpleDateFormat,java.util.concurrent.TimeUnit"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<%@ page import="java.sql.*,databaseconnection.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>s h a r e &nbsp;y o u  r &nbsp; I d e a s &nbsp; &amp; &nbsp; T h o u g h t s</title>
	<link href="css/style-ind.css" rel="stylesheet" type="text/css" />
    <style>
	a
	{
		
		color:#CF3;
		text-decoration:none;
	}
	a:hover
	{
		
		text-decoration:underline;
		color:#FFF;
		
	}
	</style>
<script type="text/javascript">
    function validate()
{
	
var fup = document.getElementById('image_file');
	var fileName = fup.value;
	if(fileName == "" )
	{
	 alert("Please upload your Profile Picture..!");
     document.productForm.image_file.focus() ;
	return false;
	} 	
	
	
var extensions = new Array("jpg","jpeg","gif","png","bmp");

var image_file = document.productForm.image_file.value;

var image_length = document.productForm.image_file.value.length;

var pos = image_file.lastIndexOf('.') + 1;

var ext = image_file.substring(pos, image_length);

var final_ext = ext.toLowerCase();

for (i = 0; i < extensions.length; i++)
{
    if(extensions[i] == final_ext)
    {
    return true;
    }
}

alert("You must upload an image file with one of the following extensions: "+ extensions.join(', ') +".");
return false;
}
</script>
</head>
    <body>

       <div class="main" style="position:fixed;">

<!-- Header -->
  <div id="hdr" style="margin:0 auto;"> 
    <div id="logo"> <a href="#"></a> </div>
    <!-- Slogan -->
    
    <div style="margin-top:-130px;float:right;height:30px;width:400px;margin-right:-50px;"> 
      <p align="right" style="margin-right:15px;font-family:'Palatino Linotype','Book Antiqua', Palatino, serif;font-size:24px;font-size:24px;padding-top:5px;"> 
        <span style="margin-right:30px;">Welcome &nbsp;<font style="color:#900;">
       Admin
        </font> </span> <span style="margin-right:15px;font-family:'Palatino Linotype','Book Antiqua', Palatino, serif;font-size:24px;font-size:24px;
      padding-top:5px;"><a href="adminlogin.jsp" title="you want to logout">Back</a></span> 
      </p>
    </div>
  </div>

<!--    <marquee behavior="scroll" direction="left" scrollamount="4" style="font-size:22px;color:#0FF;margin-top:-10px;" >www.chennaisunday.com</marquee>
-->
<div class="content " style="margin-top:40px;">
             
	  
               
             
             <div class="main_form" style="	margin-right:450px;margin-top:20px;" >

            
      <form name="form" action="" method="post" onsubmit="return validation()">
                
    
     <table bgcolor="" cellpadding="5" cellspacing="5" width="925" border="0">
            <tr  bgcolor="#3300FF"> 
            <tr> 
                <td colspan="2" align="center"><font size="2"><b> 
                  <%
                                                       String message=request.getParameter("message");
                                                       if(message!=null && message.equalsIgnoreCase("success"))
                                                       {
                                                               out.println("<font color='Green'>Near Duplicate Page is Deleted.!</font>");
                                                       }
                                                       if(message!=null && message.equalsIgnoreCase("fail"))
                                                       {
                                                               out.println("<font color='red'>Action is Failure!</font>");
                                                       }
                                               %>
                  </b></font></td>
              </tr>     
                  
                  <div id="tmeplatemo_content">  <td colspan="4" align="center">
                     <table border="2" style="margin-right:-30px;margin-top: 20px">
                         
                        <tr bgcolor="#ff9900">
                     <td align="center"><font color="#110022"><strong>User Name</strong></font></td>
                     <td align="center"><font color="#110022"><strong>Photo ID</strong></font></td>
                     <td align="center"><font color="#110022">Ratings</strong></font></td>
                     <td align="center"><font color="#110022"><strong>Post</strong></font></td>
                     
                                                 

                   <%
                    Connection con=null;
                        try{
                        String n=null;
                        String p=null;
                        String r=null;
                        String g=null;
                       con=databasecon.getconnection();
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from rating");
                        while(rs.next())
                        {
                          n=rs.getString("name");
                          p=rs.getString("photoid");
                          r=rs.getString("rating");
                          g=rs.getString("status");
                                      %>
                        <tr>
                            <tr bgcolor="#e0e0e0">
 <td align="center"> <strong><font color="#00ccff"><%=n%></font></strong></td>
 <td align="center"> <strong><font color="#00cc66"><%=p%></font></strong></td>
 <td align="center"> <strong><font color="#00cc66"><%=r%></font></strong></td>
 <td align="center"> <strong><font color="#ff0000"><%=g%></font></strong></td>
                                          </tr>
                        <% }}
                        catch(Exception e)
                        {
                            System.out.println("Execption Error in Admin View"+e.getMessage());
                        }                        
                    %>
                      </tr>
                </table>
                
            </div> <!-- end of content -->

            <div id="templatemo_footer"><br />
                <center><label> Copyright © 2014 <a href="#">Designed by KK</a></label> </center>
            </div> <!-- end of footer -->

        </div> <!-- end of container -->
</html>