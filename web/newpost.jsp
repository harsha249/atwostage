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
    
    <script type="text/javascript">

            function Validate()
            {
				
			 var fup = document.getElementById('image_file');
				var fileName = fup.value;
			if(fileName == "" )
				{
				 alert("Please upload you post!");
    			 document.productForm.image_file.focus() ;
				return false;
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
        <br><br><br><br> <span style="margin-right:30px;color:#FFF;">Welcome &nbsp;<font style="color:#FF3;">
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
            <h4 algn="left" >Hello <%=fname%>
                <%=lname%></h4>
    </b></span> 
    <!-- Friends -->
    <!-- Left Column Section Links -->
    <!--<div class="lslink">
                        <a class="resources" href="#">Family</a>
                        <a class="showcases" href="#">Friends</a>
                        <a class="photoshop" href="#">News</a>
                        <a class="templates" href="#">Recent Commands</a>
                </div>-->
    <!-- Wallpapers -->
    <!--		<h3 class="sidetit_l">Gallery</h3>
		<a class="img_link" href="#"><img src="images/wallpaper.jpg" /></a>

-->
    <!-- Friends -->
    <div class="rslink" > 
      <h3 class="sidetit_l" style="margin-top:21px;">Friends Catalog</h3>
      <a class="faq" href="friendslist.jsp">Friends</a> <a class="advertise" href="reqresponse.jsp">Request 
      From Friends</a> <a class="resources" href="findfriends.jsp">Find Friends</a> 
    </div>
    <!-- Popular Posts -->
    <!--		<h3 class="sidetit_l">Recent posts</h3>
		<a class="pop_post" href="#">Logo Design Process Tutorial</a>
		<a class="pop_post" href="#">Great use of pop music in great films</a>
		<a class="pop_post" href="#">Icon design tutorial: How to make a Calendar icon</a>
		<a class="pop_post" href="#">DryIcons.com 2.0</a>
-->
  </div>
  <!-- Main - Center Column -->
  <div id="ccnt"> 
    <!-- Post -->
    <div class="post" style="border:1px solid #F00;margin-top:95px;"> 
      <!-- Post Title - Permalink -->
      <form action="jsp/postupload.jsp" method="post" enctype="multipart/form-data" name="productForm" id="productForm" onsubmit="return Validate()" >
        <br>
        <br>
        <table width="400px" align="center" border=0 style="background-color:ffeeff;">
          <tr> 
            <td align="center" colspan=2>&nbsp;</td>
          </tr>
          <tr> 
            <td><b style="font-size:16px;color:#660;">Upload Post: </b></td>
            <td> <input type="file" name="image_file" id="image_file" > 
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
    <!-- Pagination -->
    <!--<div id="pagination">
			<span class="prev">&laquo; Prev</span>
			<span class="page_num_activ">1</span>
			<a class="page_num" href="#">2</a>
			<a class="page_num" href="#">3</a>
			<a class="page_num" href="#">4</a>
			<a class="next" href="#">Next &raquo;</a>
		</div>-->
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
  <!-- RSS Box -->
  <!--		<a href="http://feeds.feedburner.com/DryIconsFreeGraphics" class="rss"><img height="26" width="88" alt="" style="border: 0pt none ;" src="http://feeds.feedburner.com/~fc/DryIconsFreeGraphics?bg=DEDEDC&amp;fg=444444&amp;anim=0"/></a>
-->
  <!-- Latest Tweets  -->
  <!--<h3 class="sidetit_r">Latest Commands</h3>
		<div class="twitter">
			<p class="p_twit">
				<span>@Wed 13 May, 2009 16:23</span>
				Frame Swirl: 06 May, 2009Frame Swirl Vector Graphic
				<a href="http://tinyurl.com/ctj47o">http://tinyurl.com/ctj47o</a>
			</p>
		</div>

		<div class="twitter">
			<p class="p_twit">
				<span>@Wed 13 May, 2009 16:23</span>
				Frame Swirl: 06 May, 2009Frame Swirl Vector Graphic
				<a href="http://tinyurl.com/ctj47o">http://tinyurl.com/ctj47o</a>
			</p>
		</div>

		<div class="twitter">
			<p class="p_twit">
				<span>@Wed 13 May, 2009 16:23</span>
				Frame Swirl: 06 May, 2009Frame Swirl Vector Graphic
				<a href="http://tinyurl.com/ctj47o">http://tinyurl.com/ctj47o</a>
			</p>
		</div>

		<div class="twitter">
			<p class="p_twit">
				<span>@Wed 13 May, 2009 16:23</span>
				Frame Swirl: 06 May, 2009Frame Swirl Vector Graphic
				<a href="http://tinyurl.com/ctj47o">http://tinyurl.com/ctj47o</a>
			</p>
		</div>-->
  <br style="clear:both;"/>
</div>

<!-- Footer -->
<div id="foo">
	
  <div id="foot_menu"> <span class="f_left">&copy; 2013 SLPPSND. All rights reserved.</span> 
  </div>
</div>
</body>
</html>

