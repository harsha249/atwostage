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
    if(extensions[i] === final_ext)
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
    <%
		String uname=(String)session.getAttribute("uname");	
		%>
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

                 <%if(request.getParameter("message").equalsIgnoreCase("fail")){%>
                 <font style="font-size: 30pt; color: red ;font-weight: bold">WRONG CREDENTIALS FOR ADMIN</font>
                 <a href="adminlogin.jsp"><font style="font-size: 30pt; color: black ;font-weight: bold">CLICK HERE</font></a>
                 
                 <%  
                 }else{%>
                    <form action="jsp/upload.jsp" method="post" enctype="multipart/form-data" name="productForm" id="productForm" onsubmit="return validate()" >
                  <br><br>
    <table width="300px" align="center" border=0 style="background-color:ffeeff;">
      <tr>
        <td align="center" colspan=2 style="font-weight:bold;font-size:20pt;">
          <a href="firststage.jsp" title="you want to home"> First Stage 1</a></td>
      </tr>
      
      <td>
          <tr>
        <td align="center" colspan=2 style="font-weight:bold;font-size:20pt;">
          <a href="view1.jsp" title="you want to home">Social Events</a></td>
      </tr>
          </td>
         <td>
          <tr>
        <td align="center" colspan=2 style="font-weight:bold;font-size:20pt;">
          <a href="viewrank.jsp" title="you want to home">User Ratings</a></td>
      </tr>
          </td>
        
      <tr>
        <td align="center" colspan=2>&nbsp;</td>
      </tr>

      
  <tr>
        <td align="center" colspan=2>&nbsp;</td>
      </tr>
      
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>

    </table>
  </form>
                 <%}%>
      
        </div>

</div>



	

</div>  
  
  
  
  
  
  
</body>

</html>