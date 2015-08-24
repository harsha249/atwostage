<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<%@ page import="java.sql.*,databaseconnection.*"%>
    <%
		String uname=(String)session.getAttribute("uname");	
		session.setAttribute("uname",uname);
 String sex="";
 String dob=""; 
 String dd="";
 String month="";
 String year="";
 String email="";
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
String fname=null;
String lname=null;
String pass=null;

try {
	
con=databasecon.getconnection();
stmt = con.createStatement();

	rs = stmt.executeQuery("select password,fname,lname,email,dob,sex from user_details where uname='"+uname+"' ");

while(rs.next()) {

			pass = rs.getString("password");
 			fname = rs.getString("fname");
 			lname = rs.getString("lname");
			
			email=rs.getString("email"); 
			sex=rs.getString("sex");
			
			dob=rs.getString("dob");
			String date[]=dob.split("/");
			year=date[0];
			month=date[1];
			dd=date[2];
	
}
}
catch (Exception e) {

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
	
#mask {
	display: none;
	position: fixed; left: 0; top: 0; 
	z-index: 10;
	width: 100%; height: 100%;
	opacity: 0.8;
	z-index: 999;
}

.login-popup{
	display:none;
	background: #CCC;
	padding: 10px; 	
	border: 2px solid #ddd;
	float: left;
	font-size: 1.2em;
	position: fixed;
	top: 50%; left: 60%;
	z-index: 99999;
	box-shadow: 0px 0px 20px #999;
	-moz-box-shadow: 0px 0px 20px #999; /* Firefox */
    -webkit-box-shadow: 0px 0px 20px #999; /* Safari, Chrome */
	border-radius:3px 3px 3px 3px;
    -moz-border-radius: 3px; /* Firefox */

    -webkit-border-radius: 3px; /* Safari, Chrome */
}

img.btn_close {
	float: right; 
	margin: -28px -28px 0 0;
}


	</style>
    
<script type="text/javascript">
$(document).ready(function() {
	$('a.login-window').click(function() {
		
		// Getting the variable's value from a link 
		var loginBox = $(this).attr('href');

		//Fade in the Popup and add close button
		$(loginBox).fadeIn(300);
		
		//Set the center alignment padding + border
		var popMargTop = ($(loginBox).height() + 24) / 2; 
		
		
		$(loginBox).css({ 
			'margin-top' : -popMargTop,
			
		});
		
		// Add the mask to body
		$('body').append('<div id="mask"></div>');
		$('#mask').fadeIn(300);
		
		return false;
	});
	
	// When clicking on the button close or the mask layer the popup closed
	$('a.close, #mask').live('click', function() { 
	  $('#mask , .login-popup').fadeOut(300 , function() {
		$('#mask').remove();  
	}); 
	return false;
	});
});
</script> 

<script type="text/javascript">
  function validate()
{
		var f=document.myform.fname.value;
 if(!(isNaN(f)))
   {
     alert( "Please provide Valid Name../Name is not a number!" );
     document.myform.fname.focus() ;
	return false;
	}   
		   if(f<4)
   {
     alert( "Please provide your FirstName!" );
     document.myform.fname.focus() ;
     return false;
   }


	var dd=document.myform.dd.value;
   if(dd.length=="")
   {
     alert( "Please provide your Birth Date!" );
     document.myform.dd.focus() ;
	return false;
	}
    if(isNaN(dd))
   {
     alert( "Please provide Numeric value!" );
     document.myform.dd.focus() ;
	return false;
	}
	    if((dd<0)||(dd>31))
   {
     alert( "Please provide valid Date!" );
     document.myform.dd.focus() ;
	return false;
	}

	
	var mm=document.myform.mm.value;
   if(mm.length=="")
   {
     alert( "Please provide Month!" );
     document.myform.mm.focus() ;
	return false;
	}
    if(isNaN(mm))
   {
     alert( "Please provide Numeric value!" );
     document.myform.mm.focus() ;
	return false;
	}

    if((mm<0)||(mm>12))
   {
     alert( "Please provide valid Month!" );
     document.myform.mm.focus() ;
	return false;
	}



	var yy=document.myform.yyyy.value;
   if(yy.length=="")
   {
     alert( "Please provide Year!" );
     document.myform.yyyy.focus() ;
	return false;
	}
    if(isNaN(yy))
   {
     alert( "Please provide Numeric value!" );
     document.myform.yyyy.focus() ;
	return false;
	}

    if((yy<1940)||(yy>2011))
   {
     alert( "Please provide valid Year!" );
     document.myform.yyyy.focus() ;
	return false;
	}
	
	var x=document.forms["myform"]["email"].value;
	var atpos=x.indexOf("@");
	var dotpos=x.lastIndexOf(".");
	if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
  	{
  	alert("Please provide a valid email id");
  	document.myform.email.focus();
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
       <br><br><br><br><br><span style="margin-right:30px;color:#FFF;">Welcome &nbsp;<font style="color:#FF3;">
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
                <%=lname%></h3>
    </b></span> 
    <!-- Friends -->
    <div class="rslink" > 
      <h3 class="sidetit_l" style="margin-top:21px;">Friends Catalog</h3>
      <a class="faq" href="friendslist.jsp">Friends</a> <a class="advertise" href="reqresponse.jsp">Request 
      From Friends</a> <a class="resources" href="findfriends.jsp">Find Friends</a> 
    </div>
  </div>
  <div id="login-box" class="login-popup" style="margin-left:-360px;"> 
    <p style="font-size:24px;font-family:Tahoma, Geneva,sans-serif;line-height:1em;text-align:justify;color:#CF6"> 
      <u>Update Your Profile Picture....</u></p>
    <div class="main_form" style="	margin-right:50px;margin-left:50px;margin-top:20px;margin-bottom:20px;padding-left:20px;" > 
      <form action="jsp/ppicupdate.jsp" method="post" enctype="multipart/form-data" name="productForm" id="productForm" onsubmit="return validate()" >
        <br>
        <br>
        <table width="400px" align="center" border=0 style="background-color:ffeeff;">
          <tr> </tr>
          <tr> 
            <td align="center" colspan=2>&nbsp;</td>
          </tr>
          <tr> 
            <td><b style="font-size:16px;color:#FF3;">Upload Photo: </b></td>
            <td> <input type="file" name="image_file" id="image_file" > 
            <td> </tr>
          <tr> 
            <td align="center" colspan=2>&nbsp;</td>
          </tr>
          <tr> 
            <td></td>
            <td> <button class="btn btn-primary" type="submit" name="send" id="send">Upload 
              Image</button>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </tr>
          <tr> 
            <td colspan="2">&nbsp;</td>
          </tr>
        </table>
      </form>
    </div>
  </div>
  <div id="ccnt"> 
    <div class="post"> 
      <h2> <a class="tit" href="#">Edit Profile</a> </h2>
      <div class="main_form" > 
        <form class="form-horizontal" name="myform"  method="post" action="jsp/updateprofile.jsp" onsubmit="return validate()">
          <fieldset>
          <div class="control-group"> 
            <label class="control-label">UserName&nbsp;</label>
            <div class="controls"> 
              <input type="text" name="uname" id="uname" class="span6" value="<%=uname %>" readonly="readonly" />
            </div>
          </div>
          <br/>
          <div class="control-group"> 
            <label class="control-label">Old-Password&nbsp;</label>
            <div class="controls"> 
              <input type="password" name="pass" id="pass" class="span6" value="<%=pass %>" readonly="readonly" />
            </div>
          </div>
          <br/>
          <div class="control-group"> 
            <label class="control-label">First Name&nbsp;</label>
            <div class="controls"> 
              <input type="text" name="fname" id="fname" class="span6" value="<%=fname %>" />
            </div>
          </div>
          <br />
          <div class="control-group"> 
            <label class="control-label">Last Name</label>
            <div class="controls"> 
              <input type="text" name="lname" id="lname" class="span6" value="<%=lname %>"  />
            </div>
          </div>
          <br />
          <div class="control-group"> 
            <label class="control-label">Date of Birth &nbsp;</label>
            <div id="date1" class="datefield" > 
              <input  type="tel" name="dd" id="dd" maxlength="2" placeholder="DD" value="<%=dd %>"  style="width:25px;margin-left:22px;"/>
              / 
              <input  type="tel" name="mm" id="mm" maxlength="2" placeholder="MM" value="<%=month %>" style="width:25px;"/>
              / 
              <input type="tel" name="yyyy" id="yyyy" maxlength="4" placeholder="YYYY" value="<%=year %>" style="width:55px;"/>
            </div>
          </div>
          <br />
          <div class="control-group"> 
            <label class="control-label">E-Mail&nbsp;</label>
            <div class="controls"> 
              <input type="text" name="email" id="email" class="span6" value="<%=email %>"  />
            </div>
          </div>
          <div class="form-actions"> 
            <button class="btn btn-primary" type="submit" name="send" id="send">Update 
            Now</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <button class="btn" type="reset">Clear Form</button>
          </div>
          </fieldset>
        </form>
      </div>
      <!-- Post Details -->
    </div>
    <!-- Center Column bottom Borders -->
    <div id="dummy"></div>
  </div>
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

