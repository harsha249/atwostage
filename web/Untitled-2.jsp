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
	
Class.forName("com.mysql.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social","root","sweet16");

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

    
    
<%
 
 String firstname="";
 String lastname=""; 
 String sex="";
 String dob=""; 
 String email="";

    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/";
    String dbName = "social";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root"; 
    String password = "sweet16";

    int sumcount=0; 
	Statement st;

   
	if(request.getParameter("uname")!=null && request.getParameter("uname")!="")
	{

		 try {
      Class.forName(driver).newInstance();
	 
      conn = DriverManager.getConnection(url+dbName,userName,password);
	    String query = "select * user_details where uname='"+uname+"' ";
	  
       st = conn.createStatement();
	   ResultSet  rs = st.executeQuery(query);
	   while(rs.next())
		{
		  
			
			firstname=rs.getString("fname");
			lastname=rs.getString("lname");
			email=rs.getString("email"); 
			dob=rs.getString("dob");
			sex=rs.getString("sex");
			
			System.out.println(fname+" "+lname+" "+email+" "+dob+sex);
		}

       
		
	}
	catch (Exception e) {
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
    
<style type="text/css">

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
      padding-top:5px;"><a href="index.html" title="you want to logout">Logout</a></span> 
    </p>
  </div>
  <!-- Logo -->
  <div id="logo"> <a href="#"></a> </div>
  <!-- Slogan -->
  <p class="htit" style="margin-left:-70px;">s h a r e &nbsp;y o u r &nbsp; I 
    d e a s &nbsp; &amp; &nbsp; T h o u g h t s </p>
  <!-- Main Menu -->
  <div id="menu"> <a class="menu_freeb" href="#">Home</a> <a class="menu_grap" href="#">Profile</a> 
    <a class="menu_fnt" href="#">Account</a> </div>
</div>
<!-- Main Container -->
<div id="cnt"> 
  <!-- Left Column -->
  <div id="lcnt"> <a href="#login-box" class="login-window"> <img src="jsp/f2.jsp?<%=uname%>" width="156" height="156" border="0" align="left" style="margin-top:-170px;margin-left:-82px;" class="profileimg"  /> 
    </a> <span style="font-size:18px;color:#900;margin-left:-80px;"><b> 
    <%=fname%>
    <%=lname%>
    </b></span> 
    <div id="login-box" class="login-popup"> 
      <p> <a href="#">A Order Book </a> </p>
      <p> <a href="#">B Order Book </a> </p>
      <p> <a href="#">C Order Book </a> </p>
    </div>
    <!-- Friends -->
    <h3 class="sidetit_l" style="margin-top:21px;">Your Friends</h3>
    <a class="friends" href="#">Orchida</a> <a class="friends" href="#">DesignAir</a> 
    <a class="friends" href="#">V.S.S.R.</a> <a class="friends" href="#">Decoder</a> 
  </div>
  <div id="ccnt"> 
    <div class="post"> 
      <h2> <a class="tit" href="#"><u> Edit Your Details : </u></a> </h2>
      <div class="main_form" > 
        <form class="form-horizontal" name="myform"  method="post" action="jsp/register.jsp" onsubmit="return validate()">
          <fieldset>
          <div class="control-group"> 
            <label class="control-label">UserName&nbsp;<font color="#FF0000">*</font></label>
            <div class="controls"> 
              <input type="text" name="uname" id="uname" class="span6" />
            </div>
          </div>
          <div class="control-group"> 
            <label class="control-label">First Name&nbsp;<font color="#FF0000">*</font></label>
            <div class="controls"> 
              <input type="text" name="fname" id="fname" class="span6" />
            </div>
          </div>
          <br />
          <div class="control-group"> 
            <label class="control-label">Last Name</label>
            <div class="controls"> 
              <input type="text" name="lname" id="lname" class="span6" />
            </div>
          </div>
          <br />
          <div class="control-group"> 
            <label class="control-label">Sex &nbsp;<font color="#FF0000">*</font></label>
            <div class="controls"> 
              <input type="radio" name="sex" id="sex" value="male" style="width:30px;margin-top:-5px;height:40px;">
              <font color="#8A146A" style="font-size:15px;font-weight:500">Male</font> 
              <input type="radio" name="sex" id="sex" value="female" style="width:30px;margin-top:-5px;height:40px;margin-left:30px;">
              <font color="#8A146A" style="font-size:15px;font-weight:500">Female</font> 
              <input type="radio" name="sex" id="sex" value="other" style="width:30px;margin-top:-5px;height:40px;margin-left:30px;">
              <font color="#8A146A" style="font-size:15px;font-weight:500">Other</font> 
            </div>
          </div>
          <br />
          <div class="control-group"> 
            <label class="control-label">Date of Birth &nbsp;<font color="#FF0000">*</font></label>
            <div id="date1" class="datefield" > 
              <input  type="tel" name="dd" id="dd" maxlength="2" placeholder="DD" style="width:25px;margin-left:22px;"/>
              / 
              <input  type="tel" name="mm" id="mm" maxlength="2" placeholder="MM" style="width:25px;"/>
              / 
              <input type="tel" name="yyyy" id="yyyy" maxlength="4" placeholder="YYYY" style="width:55px;"/>
            </div>
          </div>
          <br />
          <div class="control-group"> 
            <label class="control-label">E-Mail&nbsp;<font color="#FF0000">*</font></label>
            <div class="controls"> 
              <input type="text" name="email" id="email" class="span6" />
            </div>
          </div>
          <div class="form-actions"> 
            <button class="btn btn-primary" type="submit" name="send" id="send">Register 
            Now</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <button class="btn" type="reset">Clear Form</button>
          </div>
          </fieldset>
        </form>
      </div>
    </div>
  </div>
  <!-- Right Column -->
  <div id="rcnt"> 
    <!-- Additional Sections Links -->
    <div class="rslink"> 
      <h3 class="sidetit_l">Your Friends</h3>
      <a class="about" href="#">Account Settings</a> <a class="contact" href="#">Profile</a> 
      <a class="faq" href="#">Friends</a> <a class="terms" href="newpost.jsp">New 
      Post</a> <a class="advertise" href="#">Find Friends</a> </div>
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

