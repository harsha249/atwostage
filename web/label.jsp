<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.zip.*"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
    <%
		String uname=(String)session.getAttribute("uname");	
		session.setAttribute("uname",uname);
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

  <script type="text/javascript">

            function Validate()
            {
			if(document.productForm.drop.selectedIndex==0)
				{
					alert("Select label for posting Security.. ");
					document.productForm.drop.focus();
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
      <span style="margin-right:30px;color:#FFF;">Welcome &nbsp;<font style="color:#FF3;">
      <% out.println(uname); %>
      </font> </span> <span style="margin-right:15px;font-family:'Palatino Linotype','Book Antiqua', Palatino, serif;font-size:24px;font-size:24px;
      padding-top:5px;"><a href="jsp/logout.jsp" title="you want to logout">Logout</a></span> 
    </p>
  </div>
  <!-- Logo -->
  <div id="logo"> <a href="#"></a> </div>
  <!-- Slogan -->
  <p class="htit" style="margin-left:-70px;">s h a r e &nbsp;y o u r &nbsp; I 
    d e a s &nbsp; &amp; &nbsp; T h o u g h t s </p>
  <!-- Main Menu -->
  <div id="menu"> <a class="menu_freeb" href="home.jsp">Home</a> <a class="menu_grap" href="myprofile.jsp">Your 
    Profile</a> <a class="menu_fnt" href="newpost.jsp">New Post</a> </div>
  <!--    <marquee behavior="scroll" direction="left" scrollamount="4" style="font-size:22px;color:#0FF;margin-top:-10px;" >www.chennaisunday.com</marquee>
-->
</div>
<!-- Main Container -->
<div id="cnt"> 
  <!-- Left Column -->
  <div id="lcnt"> <img src="jsp/f2.jsp?<%=uname%>" border="0" align="left" style="margin-top:-170px;margin-left:-82px;width:156px;height:156px;" class="profileimg"  /> 
    <span style="font-size:18px;color:#900;margin-left:-80px;"><b> 
    <%=fname%>
    <%=lname%>
    </b></span> 
    <!-- Friends -->
    <div class="rslink" > 
      <h3 class="sidetit_l" style="margin-top:21px;">Friends Catalog</h3>
      <a class="faq" href="friendslist.jsp">Friends</a> <a class="advertise" href="reqresponse.jsp">Request 
      From Friends</a> <a class="resources" href="findfriends.jsp">Find Friends</a> 
    </div>
    <!-- Popular Posts -->
  </div>
  <!-- Main - Center Column -->
  <div id="ccnt"> 
    <!-- Post -->
    <div class="post" style="border:1px solid #F00;margin-top:95px;"> 
      <!-- Post Title - Permalink -->
      <p style="font-size:24px;font-family:Tahoma,Geneva,sans-serif;line-height:1em;text-align:justify;color:#930;margin-left:15px;"> 
        <u>Please select your uploading post type...</u> </p>
      <form action="jsp/postuploadduplicate.jsp" method="post" name="productForm" id="productForm" onsubmit="return Validate()" >
        <table width="400px" align="center" border=0 style="background-color:ffeeff;" class="main_form">
          <tr> 
            <td align="center" colspan=2>&nbsp;</td>
          </tr>
          <tr> 
            <td><b style="font-size:16px;color:#660;margin-left:15px;">Select 
              Label: </b></td>
            <td> <select name="drop" id="drop">
                <option selected="selected" >Select</option>
                <option value="sensitive">Sensitive</option>
                <option value="non_sensitive">Non-Sensitive</option>
              </select> 
            <td> </tr>
          <tr> 
            <td align="center" colspan=2>&nbsp;</td>
          </tr>
          <tr> 
            <td></td>
            <td> <button class="btn btn-primary" type="submit" name="send" id="send">Upload 
              Post</button>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </tr>
          <tr> 
            <td colspan="2">&nbsp;</td>
          </tr>
        </table>
      </form>
    </div>
    <%
     java.util.Date now = new java.util.Date();
	 String DATE_FORMAT1 = "MMM dd,yyyy";
	 SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
     String strDateNew1 = sdf1.format(now);
	 Date date = new SimpleDateFormat("MMM dd,yyyy").parse(strDateNew1);
	 String sdate= new SimpleDateFormat("MMM dd,yyyy").format(date);
	 
	 session.setAttribute("sysdate",sdate);

%>
    <!-- Center Column bottom Borders -->
    <div id="dummy"></div>
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

