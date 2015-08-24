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
    
    </h2>
    <%
String cur_date=null,currentname=null;
int slno=0;
String label="";
try {
	
con=databasecon.getconnection();

stmt = con.createStatement();

rs1 = stmt.executeQuery("select sl_no,cur_date,uname,label from post where uname in(select userto from request_status where status='accepted' and userfrom='"+uname+"') ORDER BY cur_date DESC ");  //where uname='"+uname+"'

while(rs1.next()) {

 cur_date = rs1.getString("cur_date");
 slno=rs1.getInt("sl_no");
 currentname = rs1.getString("uname");
  label = rs1.getString("label");
%>
    <!-- Main - Center Column -->
    <!-- Post Title - Permalink -->
     
        <h1 align="center" > <a  href="command.jsp?<%=slno%>" > <img src="jsp/postdisplay.jsp?<%=slno%>"  align="center" height="550" width="200" /></a> </h1>
        <br><br><br><br><h3 align="center">
                 <div class="post"> 
      <!-- Post Details -->
      <div> 
        <% out.println(cur_date); %>
         <a  href="#"><span >Posted by: 
        <% out.println(currentname); %>
        </a> <a href="command.jsp?<%=slno%>" >&nbsp;&nbsp;<font color="#ff0000">Ratings</font></a> 
        </div>
        
        
        
        
        </div></h3><br><br>
    <%
}
} catch (Exception e) {

out.println("Unable To Display image");

out.println("Image Display Error=" + e.getMessage());

return;

} 

%>
    <!-- Center Column bottom Borders -->
    <div id="dummy"></div>
  </div>
  <!-- Right Column -->
  <div id="rcnt" style="float:right;"> 
    <!-- Additional Sections Links -->
    <div class="rslink" > 
        <a href="createevent.jsp"> <h1 class="sidetit_l">Create Events</h1></a>
        <a class="software" href="editprofile.jsp">Edit Profile</a> <br><br></br>
            
            
     <%
		//String uname=(String)session.getAttribute("uname");	
		
Connection conn = null;
Statement stmtt = null;
ResultSet rs11 = null;
String fnamee=null;
String lnamee=null;
java.util.Date now = new java.util.Date(); 
     String DATE_FORMAT1 = "yyyy/MM/dd"; 
     SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
     String strDateNew1 = sdf1.format(now);
System.out.println("This is Home page..::" +uname);
try {
	
conn=databasecon.getconnection();

stmtt = conn.createStatement();

rs11 = stmtt.executeQuery("select * from user_details where dob='"+strDateNew1+"' ");

while(rs11.next()) {

 fname = rs11.getString("dob");
 lname = strDateNew1;
 if(fname.equals(lname))
 {
%>
<br> <br>
        <img src="images/happy.jpg" border="0" align="center"  class="profileimg"  /> <br></br>
         <font color="#0000ff"><b>Happy Birthday : </b></font>  <font color="#ffaadd"><b><%=rs11.getString("uname")%></b></font> <br> 
    
    <%}
 else
         {
%>
     <img src="images/happy.jpg" border="0" align="center"  class="profileimg"  /> <br></br>
    <%} }
rs11 = stmtt.executeQuery("select * from events where name in(select userto from request_status where status='accepted' and userfrom='"+uname+"')");
while(rs11.next()){%>
<br>
    <font color="#0000ff"><b><%=rs11.getString("choose")%></b>    
</br>
<br>
<font color="#0000ff"><b><%=rs11.getString("name")%> &nbsp; invited for <%=rs11.getString("eventname")%> on <%=rs11.getString("regstered")%></b>
</br><br></br>
<%}
} catch (Exception e) {

out.println("Unable To Display image");

out.println("Image Display Error=" + e.getMessage()); 
}



    %>

    
    </div>
      
      
      
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

