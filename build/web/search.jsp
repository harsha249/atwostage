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
try {
	
con=databasecon.getconnection();

stmt = con.createStatement();

rs1 = stmt.executeQuery("select uname,fname,lname from user_details where uname='"+uname+"' ");

while(rs1.next()) {

 fname = rs1.getString("fname");
 lname = rs1.getString("lname");
  String cur_uname = rs1.getString("uname");
  session.setAttribute("uname",cur_uname);

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
	<link href="css/btn.css" rel="stylesheet" type="text/css" />
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
	.tab
	{
		border-radius:5px;
		box-shadow:5px 5px 20px #CCC;
		-moz-box-shadow:5px 5px 20px #CCC;
		-o-box-shadow:5px 5px 20px #CCC;
		-webkit-box-shadow:5px 5px 20px #CCC;

	}

	</style>
    
 

</head>

<body>

<!-- Header -->
<div id="hdr"> 
  <!-- Search form -->
  <div style="margin-top:-25px;float:right;height:30px;width:400px;margin-right:-100px;"> 
    <p align="right" style="margin-right:15px;font-family:'Palatino Linotype','Book Antiqua', Palatino, serif;font-size:24px;font-size:24px;padding-top:5px;"> 
       <br><br><br><span style="margin-right:30px;color:#FFF;">Welcome &nbsp;<font style="color:#FF3;">
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
		String search=request.getParameter("search");
		String uname1=null;
		int slno=0;
        int i=search.indexOf('@');
		if(i>1)
		{


	try {
	
	con=databasecon.getconnection();

	stmt = con.createStatement();

	rs1 = stmt.executeQuery("select * from user_details where email='"+search+"' AND uname !='"+uname+"'; ");

	while(rs1.next()) {


 	slno=rs1.getInt("sid");
  	uname1=rs1.getString("uname");


	%>
    <table  bgcolor="#FFFFCC" align="left" width="340" height="30" class="tab" style="margin-left:50px;">
      <tr> 
        <td> <img src="jsp/f2.jsp?<%=uname1%>" style="margin-left:20px;margin-bottom:10px;margin-top:5px;max-height:50px;max-width:70px;" /></td>
        <td></td>
        <td></td>
        <td><span style="margin-left:-90px;font-size:20px;font-family:'Palatino Linotype', 'Book Antiqua', Palatino, serif;padding-top:2px;"> 
          <% out.print(uname1);%>
          </span></p></td>
      </tr>
      <table align="right" style="margin-right:10px;">
        <tr> 
          <td> <a href="jsp/requsetstore.jsp?<%=uname1%>"> 
            <div class="form-actions" style="margin-top:-10px;"> 
              <button class="btn btn-primary" type="submit" name="send" id="send">Send 
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

}

	else
		{

		try {
	
				con=databasecon.getconnection();

				stmt = con.createStatement();

				rs1 = stmt.executeQuery("select * from user_details where fname like '"+search+"' AND uname !='"+uname+"'; ");

				while(rs1.next()) {

 					slno=rs1.getInt("sid");
 					 uname1=rs1.getString("uname");

%>
  <div id="post" style="height:50px;" > 
    <table  bgcolor="#FFFFCC" align="left" width="340" height="30" class="tab" style="margin-bottom:20px;">
      <tr> 
        <td> <img src="jsp/f2.jsp?<%=uname1%>" style="margin-left:20px;margin-bottom:10px;margin-top:5px;max-height:50px;max-width:70px;" /></td>
        <td></td>
        <td></td>
        <td><span style="margin-left:-90px;font-size:20px;font-family:'Palatino Linotype', 'Book Antiqua', Palatino, serif;padding-top:2px;"> 
          <% out.print(uname1);%>
          </span></p></td>
      </tr>
      <table align="right">
        <tr> 
          <td> <a href="jsp/requsetstore.jsp?<%=uname1%>"> 
            <div class="form-actions" style="margin-top:-10px;"> 
              <button class="btn btn-primary" type="submit" name="send" id="send">Send 
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


}
		%>
</div>


	<!-- Right Column -->
	
<div id="rcnt" style="float:right;"> 
  <!-- Additional Sections Links -->
  <div class="rslink" > 
    <h3 class="sidetit_l">Your Catalog</h3>
    <a class="software" href="editprofile.jsp">Edit Profile</a> <a class="terms" href="newpost.jsp">New 
    Post</a> <a class="about" href="myprofile.jsp">Your Post</a> </div>
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

