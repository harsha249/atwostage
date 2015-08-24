<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"  errorPage="" %>
<%@ page import="java.sql.*,databaseconnection.*"%>
    <%
		String uname=(String)session.getAttribute("uname");	
		
Connection con = null;
Statement stmt = null;
ResultSet rs1 = null;
String fname=null;
String lname=null;

System.out.println("This is Home page..::" +uname);
try {
	
con=databasecon.getconnection();

stmt = con.createStatement();

rs1 = stmt.executeQuery("select fname,lname from user_details where uname='"+uname+"' ");

while(rs1.next()) {

 fname = rs1.getString("fname");
 lname = rs1.getString("lname");
} 
} catch (Exception e) {

out.println("Unable To Display image");

out.println("Image Display Error=" + e.getMessage());

return;

} finally {

try {



stmt.close();

con.close();

} catch (SQLException e) {

e.printStackTrace();

}

}


%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="true" name="mssmarttagspreventparsing" />
	<meta http-equiv="imagetoolbar" content="no" />
	<title>s h a r e &nbsp;y o u  r &nbsp; I d e a s &nbsp; &amp; &nbsp; T h o u g h t s</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<!-- IE fixes -->
	<!--[if lte IE 6]>
	<style type="text/css">
		#ccnt {_height:1200px;}
		.post {padding:0 0 25px;}
	</style>
	<![endif]-->
	<script type="text/javascript">
	/*
	 * Simple JS function for setting the search value
	 */
	function clS(t){
		var srch = document.getElementById('s'), val = srch.value.toString().toLowerCase(), re = /^\s+$/;
		if(t) {
			if(val == 'search...' || val == 'search'){ 
				srch.value = '';
			}
		} else {
			if(val == 'search...' || val == 'search' || val == '' || re.test(val)) {
				srch.value = 'search...';
			}
		}
	}
	</script>
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
	.cmt
	{
		border:1px #999 solid;
		border-radius:5px;
		box-shadow:5px 5px 50px #936;
		-moz-box-shadow:5px 5px 50px #936;
		-o-box-shadow:5px 5px 50px #936;
		-webkit-box-shadow:5px 5px 50px #936;
	}
	#cnnn
	{
		border:#CCC 2px groove;
		border-radius:5px;
		box-shadow:5px 5px 50px #999;
	}
	
	</style>
    <script>
  function validate()
	{
	
	   if( document.myform.cmd.value == "" )
 		  {
  		   alert( "Please provide your command!" );
    		 document.myform.cmd.focus() ;
    		 return false;
  		 }
	}
	</script>

</head>

<body>

<!-- Header -->
<div id="hdr"> 
  <!-- Search form -->
  <div style="margin-top:-25px;float:right;height:30px;width:400px;margin-right:-100px;"> 
    <p align="right" style="margin-right:15px;font-family:'Palatino Linotype','Book Antiqua', Palatino, serif;font-size:24px;font-size:24px;padding-top:5px;"> 
        <br><br><br> <span style="margin-right:30px;color:#FFF;">Welcome &nbsp;<font style="color:#FF3;">
      <% out.println(uname); %>
      </font> </span> <span style="margin-right:15px;font-family:'Palatino Linotype','Book Antiqua', Palatino, serif;font-size:24px;font-size:24px;
      padding-top:5px;"><a href="jsp/logout.jsp" title="you want to logout">Logout</a></span> 
    </p>
  </div>
  <!-- Logo -->
  <div id="logo"> <a href="#"></a> </div>
  <!-- Slogan -->
  
  <!-- Main Menu -->
  <div id="menu"> <a href="home.jsp">Home</a> <a href="myprofile.jsp">Your 
    Profile</a> <a  href="newpost.jsp">New Post</a> </div>
  <!--    <marquee behavior="scroll" direction="left" scrollamount="4" style="font-size:22px;color:#0FF;margin-top:-10px;" >www.chennaisunday.com</marquee>
-->
</div>



<!-- Main Container -->
<div id="cnt"> 
  <!-- Left Column -->
  <div id="lcnt"> <img src="jsp/f2.jsp?<%=uname%>" border="0" align="left" style="margin-top:-170px;margin-left:-82px; width:156px;height:156px;" class="profileimg"  /> 
    <span style="font-size:18px;color:#900;margin-left:-70px;"><b> 
            <h4 algn="center" >Hello <%=fname%>
                <%=lname%></h4>
    </b></span> 


<!-- Friends -->
<!--		<h3 class="sidetit_l" style="margin-top:21px;">Your Friends</h3>
		<a class="friends" href="#">Orchida</a>
		<a class="friends" href="#">DesignAir</a>
		<a class="friends" href="#">V.S.S.R.</a>
		<a class="friends" href="#">Decoder</a>
-->        
	</div>
    
    
	<div class="ccnt" id="cnnn" >

    
<%
String n=request.getQueryString();

session.setAttribute("n",n);

String cur_date=null;
int slno=0;

try {
	
con=databasecon.getconnection();

stmt = con.createStatement();

rs1 = stmt.executeQuery("select sl_no,cur_date from post where sl_no='"+n+"' ");

while(rs1.next()) {

 cur_date = rs1.getString("cur_date");
 slno=rs1.getInt("sl_no");

%>
	<!-- Main - Center Column -->
			<!-- Post Title - Permalink -->
		<div class="post">
 
 			<!--<h2>
				<a class="tit" href="#">Logo Design Process Tutorial</a>
			</h2>-->		
			<!-- Post Details -->
			<!--<div class="post_tit">
				<span class="cld">
               </span>
				<a  href="#"><span class="pby">Posted by:</span></a>
				<a href="#login-box? id="comm" class="login-window">22 comments</a>
			</div>-->
	 <img src="jsp/postdisplay.jsp?<%=slno%>" height="150" width="250" align="center"/>

        </div>
        
<%
}
} catch (Exception e) {

out.println("Unable To Display image");

out.println("Image Display Error=" + e.getMessage());

return;

}
finally {

try {



stmt.close();

con.close();

} catch (SQLException e) {

e.printStackTrace();

}

}

%>
		
       
      
        
        
		<!-- Center Column bottom Borders -->
		<div id="dummy"></div>
	</div>
    <form name="myform" action="jsp/cmdinsert.jsp?<%=uname%>" method="post" onsubmit="return validate()">
       <table align="center" ><tr><td>
       
      
       </td></tr>
       
       <tr align="center"><td height="5">
       
       </td></tr>
       
       <tr align="right"><td>
       <font color="#000000" style="font-weight:bold;font-size:16px;">VIEW ALL COMMANDS</font>
       </td></tr>
       </table>
       </form>
       
       
       
       
       
       
       
       <table align="left" width="530" style="margin-left:235px;margin-top:15px; padding-left:20px;padding-top:15px;" class="cmt" >

				<tr>
                <td style="font-size:14px;color:#300;"><a href="#">
                 
                <div id="ccnt"> 
    <!-- Post -->
    <br><br>
            <h3 align="center">
                  <form class="form-horizontal" name="myform"  method="post" action="insertrate.jsp" onsubmit="return validate()">
       			<fieldset>
                
                <div class="control-group">
       					<label class="control-label">&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FFdd00">Your Name&nbsp;</font><input type="text" name="uname" id="uname" value="<%=uname%>" class="span6" /></label>
       					
       				</div>
                 
                  
                            <br>
                   <div class="control-group">
       					<label class="control-label">&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FFdd00">IMAGE ID&nbsp;<font color="#FFdd00"></font><input type="text" name="img" value="<%=slno%>" id="uname" class="span6" /></label>
       					
       				</div>
                 
       				
                            <br>
       				

       				<div class="control-group">
       					<label class="control-label"><font color="#FFdd00">Give Rating&nbsp;<font color="#FFdd00">*</font></label><br>
                                            <br>	<div class="controls">
                            <input type="radio" name="sex" id="sex" value="Poor" style="width:15px;margin-top:-5px;height:15px;">
                                     <font color="#8A146A" style="font-size:15px;font-weight:500">Poor</font>
						<input type="radio" name="sex" id="sex" value="Bad" style="width:15px;margin-top:-5px;height:15px;">
                                     <font color="#8A146A" style="font-size:15px;font-weight:500">Bad</font>
                            <input type="radio" name="sex" id="sex" value="Good" style="width:15px;margin-top:-5px;height:15px;">
                                     <font color="#8A146A" style="font-size:15px;font-weight:500">Good</font>
                                       <input type="radio" name="sex" id="sex" value="Best" style="width:15px;margin-top:-5px;height:15px;">
                                     <font color="#8A146A" style="font-size:15px;font-weight:500">Best</font>
                         </div>
                        </div> 
                        
       				
                            <br><br>
       				
                    
       				    <div class="form-actions">
       					<button class="btn btn-primary" type="submit" name="send" id="send">SUBMIT</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       					<button class="btn" type="reset">CANCEL</button>
       				</div>
                    
       			</fieldset>
       		</form>
  
            </h1>
  
  
    </div><br>
   
                
                
                
                </td></tr>
               	<tr align="center"><td height="10" style="border-top:#000 dashed 1px;"></td></tr>			
   				
				
			
       
       </table>
       
       
       
       

	<!-- Right Column -->
	<!--<div id="rcnt">
		<div class="rslink">
		<h3 class="sidetit_l">Your Friends</h3>
			<a class="about" href="#">Account Settings</a>
			<a class="contact" href="editprofile.jsp">Edit Profile</a>
			<a class="faq" href="#">Friends</a>
			<a class="terms" href="newpost.jsp">New Post</a>
			<a class="advertise" href="#">Find Friends</a>
		</div>

		</div>-->
	<br style="clear:both;"/>
</div>

<!-- Footer -->
<div id="foo">
	<div id="foot_menu">
		
		<span class="f_left">&copy; 2013 SLPPSND. All rights reserved.</span>

	</div>
</div>



</body>
</html>

