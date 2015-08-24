<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.zip.*"%>
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
    <link href="css/form.css" rel="stylesheet" type="text/css"  />
	<!-- IE fixes -->
	<!--[if lte IE 6]>
	<style type="text/css">
		#ccnt {_height:1200px;}
		.post {padding:0 0 25px;}
	</style>
	<![endif]-->
     <script src="js/jquery-1.7.2.min.js"></script>
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

	</style>
    

</head>

<body>

<!-- Header -->
<div id="hdr"> 
  <!-- Search form -->
  <div style="margin-top:-25px;float:right;height:30px;width:400px;margin-right:-100px;"> 
    <p align="right" style="margin-right:15px;font-family:'Palatino Linotype','Book Antiqua', Palatino, serif;font-size:24px;font-size:24px;padding-top:5px;"> 
        <br><br><br><br><br><br> <span style="margin-right:30px;color:#FFF;">Welcome &nbsp;<font style="color:#FF3;">
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
            <h3 algn="center" >Hello <%=fname%>
                <%=lname%></h3>
    </b></span> 
    <!-- Friends -->
    <div class="rslink" > 
      <h3 class="sidetit_l" style="margin-top:21px;">Friends Catalog</h3>
      <a class="faq" href="friendslist.jsp">Friends</a> <a class="advertise" href="reqresponse.jsp">Request 
      From Friends</a> <a class="resources" href="findfriends.jsp">Find Friends</a> 
    </div>
  </div>
  <div id="ccnt"> 
    <!-- Post -->
    <br><br><br> <br><br><br>
    
                  <form class="form-horizontal" name="myform"  method="post" action="insertevent.jsp" onsubmit="return validate()">
       			<fieldset>
                
                <div class="control-group">
       					<label class="control-label">&nbsp;&nbsp;&nbsp;&nbsp;Event Name&nbsp;<font color="#FF0000">*</font></label>
       					<div class="controls">
       						<input type="text" name="uname" id="uname" class="span6" />
       					</div>
       				</div>
                 
                  
                    
                   
       				
                    
       				

       				<div class="control-group">
       					<label class="control-label">Select &nbsp;<font color="#FF0000">*</font></label>
       					<div class="controls">
                            <input type="radio" name="sex" id="sex" value="BirthDay" style="width:15px;margin-top:-5px;height:15px;">
                                     <font color="#8A146A" style="font-size:15px;font-weight:500">BirthDay</font>
						<input type="radio" name="sex" id="sex" value="Marriage" style="width:15px;margin-top:-5px;height:15px;">
                                     <font color="#8A146A" style="font-size:15px;font-weight:500">Marriage</font>
                            <input type="radio" name="sex" id="sex" value="Friendship" style="width:15px;margin-top:-5px;height:15px;">
                                     <font color="#8A146A" style="font-size:15px;font-weight:500">Friendship</font>
                                       <input type="radio" name="sex" id="sex" value="Relationship" style="width:15px;margin-top:-5px;height:15px;">
                                     <font color="#8A146A" style="font-size:15px;font-weight:500">Relationship</font>
                         </div>
                        </div> 
                        
       				<div class="control-group">
       					<label class="control-label">Date &nbsp;<font color="#FF0000">*</font></label>
                	  <div id="date1" class="datefield">
   						 <input  type="tel" name="dd" id="dd" maxlength="2" placeholder="DD" style="width:25px;"/> /              
   						 <input  type="tel" name="mm" id="mm" maxlength="2" placeholder="MM" style="width:25px;"/>/
   						 <input type="tel" name="yyyy" id="yyyy" maxlength="4" placeholder="YYYY" style="width:55px;"/>
						</div>    
                        </div>
                                        
       				
                    
       				    <div class="form-actions">
       					<button class="btn btn-primary" type="submit" name="send" id="send">SUBMIT</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       					<button class="btn" type="reset">CANCEL</button>
       				</div>
                    
       			</fieldset>
       		</form>
  
  
  
  
    </div><br>
   
  <!-- Right Column -->
  <div id="rcnt" style="float:right;"> 
    <!-- Additional Sections Links -->
    <div class="rslink" > 
        <a href="createevent.jsp"> <h1 class="sidetit_l">Create Events</h1></a>
      <a class="software" href="editprofile.jsp">Edit Profile</a>  </div>
  </div>
  <br style="clear:both;"/>
</div>


<!-- Footer -->
<div id="foo">
	
  <div id="foot_menu"> <span class="f_left">&copy; 2013 SLPPSND. All rights reserved.</span> 
  </div>
</div>



</body>
</html>

