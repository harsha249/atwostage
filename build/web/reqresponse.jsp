<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"  %>
<%@ page import="java.sql.*,databaseconnection.*"%>
    <%
		String uname=(String)session.getAttribute("uname");	
		
Connection con = null;
Statement stmt = null;
ResultSet rs1 = null;
String fname=null;
String lname=null;

System.out.println("This is Home page..::" +uname);
try
{
	
       Class.forName("com.mysql.jdbc.Driver");

       con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social","root","har249");

        stmt = con.createStatement();

       rs1 = stmt.executeQuery("select uname,fname,lname from user_details where uname='"+uname+"' ");

       while(rs1.next())
		{

              fname = rs1.getString("fname");
              lname = rs1.getString("lname");
              String cur_uname = rs1.getString("uname");
               session.setAttribute("uname",cur_uname);

         } 
} 
catch (Exception e)
{

out.println("Unable To Display image");

out.println("Image Display Error=" + e.getMessage());

return;

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
	.tab
	{
		border-radius:5px;
		box-shadow:5px 5px 20px #CCC;
		-moz-box-shadow:5px 5px 20px #CCC;
		-o-box-shadow:5px 5px 20px #CCC;
		-webkit-box-shadow:5px 5px 20px #CCC;

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
  <div id="ccnt" > 
    <%
		//String userid=(String)session.getAttribute("userid");
		String accept="Accepted";
		String delete="Deleted";	
		String userfrom=null;
		String userto=null;
		try {
	
	con=databasecon.getconnection();

	stmt = con.createStatement();

	rs1 = stmt.executeQuery("SELECT * FROM request_status where userto='"+uname+"' AND status='requested'  ; ");

	while(rs1.next()) {

  	userfrom=rs1.getString("userfrom");
    userto=rs1.getString("userto");
	session.setAttribute("userfrom",userfrom);
	session.setAttribute("userto",userto);
	%>
    <div id="post"> 
      <table  bgcolor="#FFFFCC" align="left" width="250" height="30" class="tab" style="margin-left:-10px;">
        <tr> 
          <td><a href="#login-box" class="login-window" title="Click to know him"> 
            <img src="jsp/f2.jsp?<%=userfrom%>" style="margin-left:20px;margin-bottom:10px;margin-top:5px;max-height:50px;max-width:70px;margin-right:-30px;" /> 
            </a></td>
          <td> <span style="font-size:20px;font-family:'Palatino Linotype', 'Book Antiqua', Palatino, serif;padding-top:2px;"> 
            <a  href="#login-box" class="login-window" style="text-decoration:none;color:#930;" title="Click to know him"> 
            <% out.print(userfrom);%>
            </a></span></p></td>
        </tr>
        <table align="right" style="margin-right:-20px;">
          <tr> 
            <td> <a href="jsp/statusupdate.jsp?<%=accept%>"> 
              <div class="form-actions" style="margin-top:-10px;margin-left:-15px;"> 
                <button class="btn btn-primary" type="submit" name="send" id="send">Accept 
                Request</button>
              </div>
              </a> </td>
            <td> <a href="jsp/statusupdate.jsp"> 
              <div class="form-actions" style="margin-top:-10px;margin-left:-15px;"> 
                <button class="btn btn-primary" type="submit" name="send" id="send">Delete 
                Request</button>
              </div>
              </a> </td>
          </tr>
        </table>
      </table>
    </div>
    <%
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
			} 
		catch (SQLException e) {
			e.printStackTrace();
			}
		}



%>
    <%
		
String fname1=null;
String lname1=null;
 String sex1="";
 String dob=""; 
 String dd="";
 String month="";
 String year="";
 String email1="";

System.out.println("This is Home page..::" +uname);
try {
	
con=databasecon.getconnection();

stmt = con.createStatement();

rs1 = stmt.executeQuery("select fname,lname,email,dob,sex from user_details where uname='"+userfrom+"' ");

while(rs1.next()) {
	
 fname1 = rs1.getString("fname");
 lname1 = rs1.getString("lname");
			email1=rs1.getString("email"); 
			sex1=rs1.getString("sex");
			
			dob=rs1.getString("dob");
			String date[]=dob.split("/");
			year=date[0];
			month=date[1];
			dd=date[2];
			
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
  </div>
  <div id="login-box" class="login-popup" style="margin-left:-360px;"> 
    <div class="main_form" style="padding-right:50px;"> 
      <form class="form-horizontal" name="myform" >
        <fieldset>
        <div class="control-group"> 
          <label class="control-label">UserName&nbsp;</label>
          <div class="controls"> 
            <input type="text" name="uname" id="uname" class="span6" value="<%=userfrom %>" readonly="readonly" />
          </div>
        </div>
        <br/>
        <div class="control-group"> 
          <label class="control-label">First Name&nbsp;</label>
          <div class="controls"> 
            <input type="text" name="fname" id="fname" class="span6" value="<%=fname1 %>" readonly="readonly"  />
          </div>
        </div>
        <br />
        <div class="control-group"> 
          <label class="control-label">Last Name</label>
          <div class="controls"> 
            <input type="text" name="lname" id="lname" class="span6" value="<%=lname1 %>" readonly="readonly"   />
          </div>
        </div>
        <br />
        <div class="control-group"> 
          <label class="control-label">Date of Birth &nbsp;</label>
          <div id="date1" class="datefield" > 
            <input type="tel" name="dd" id="dd" maxlength="2" placeholder="DD" value="<%=dd %>" style="width:25px;margin-left:22px;" readonly="readonly" />
            / 
            <input  type="tel" name="mm" id="mm" maxlength="2" placeholder="MM" value="<%=month %>" style="width:25px;" readonly="readonly"/>
            / 
            <input type="tel" name="yyyy" id="yyyy" maxlength="4" placeholder="YYYY" value="<%=year %>" style="width:55px;" readonly="readonly"/>
          </div>
        </div>
        <br />
        <div class="control-group"> 
          <label class="control-label">E-Mail&nbsp;</label>
          <div class="controls"> 
            <input type="text" name="email" id="email" class="span6" value="<%=email1 %>" readonly="readonly"  />
          </div>
        </div>
        <div class="form-actions"> </div>
        </fieldset>
      </form>
    </div>
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

